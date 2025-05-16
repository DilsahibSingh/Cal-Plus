from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.exc import IntegrityError
from sqlmodel import Session, select

from schemas.user import UserCreate, UserLogin, Token
from models.user import User
from core.security import hash_password, verify_password, create_access_token
from database.session import get_session

router = APIRouter()

@router.post("/auth/signup", response_model=Token)
def signup(user_in: UserCreate, session: Session = Depends(get_session)):
    hashed = hash_password(user_in.password)
    user = User(email=user_in.email, hashed_password=hashed)
    try:
        session.add(user)
        session.commit()
        session.refresh(user)
    except IntegrityError:
        raise HTTPException(status_code=400, detail="Email already registered")
    token = create_access_token({"sub": user.email})
    return {"access_token": token}

@router.post("/auth/login", response_model=Token)
def login(user_in: UserLogin, session: Session = Depends(get_session)):
    statement = select(User).where(User.email == user_in.email)
    user = session.exec(statement).first()
    if not user or not verify_password(user_in.password, user.hashed_password):
        raise HTTPException(status_code=401, detail="Invalid credentials")
    token = create_access_token({"sub": user.email})
    return {"access_token": token}
