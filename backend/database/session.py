from sqlmodel import create_engine, Session, SQLModel

sqlite_url = "sqlite:///./db.db"
engine = create_engine(sqlite_url, echo=True)

def get_session():
    with Session(engine) as session:
        yield session
