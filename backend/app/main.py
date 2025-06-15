from fastapi import FastAPI
from .database import engine, Base
from .tasks import example_task

app = FastAPI()

# Create database tables
Base.metadata.create_all(bind=engine)

@app.get("/")
def read_root():
    return {"message": "Hello, world!"}

@app.post("/task")
def run_task():
    example_task.delay()
    return {"status": "task queued"}
