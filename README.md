# Project Skeleton

This repository contains a simple project skeleton consisting of:

* **Backend**: Python with [FastAPI](https://fastapi.tiangolo.com/) and Celery for background tasks. Example database configuration uses PostgreSQL via SQLAlchemy.
* **Frontend**: A minimal React setup using Webpack and Babel.
* **Queue**: Celery configured with Redis as the broker and backend.

## Structure

```
backend/        # Python backend
frontend/       # React frontend
```

## Running Backend Manually

Create a virtual environment and install requirements:

```
python -m venv venv
source venv/bin/activate
pip install -r backend/requirements.txt
```

Start the API server:

```
uvicorn backend.app.main:app --reload
```

Run the Celery worker in a separate terminal:

```
python -m backend.app.celery_worker
```

## Running Frontend Manually

Install Node dependencies and start the development server:

```
cd frontend
npm install
npm run start
```

This will serve the React app on [http://localhost:3000](http://localhost:3000).

## Using the helper script

A convenience script `start_app.sh` is provided to start the API, Celery worker and React app in one step. Execute it from the project root:

```
./start_app.sh
```

The script creates a virtual environment if needed, installs dependencies and runs all services concurrently. Press `Ctrl-C` to stop them.

