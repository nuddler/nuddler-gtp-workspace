#!/bin/bash
# Simple script to run backend API, Celery worker and React frontend

set -e

# Prepare Python virtual environment
if [ ! -d "venv" ]; then
    python -m venv venv
fi
source venv/bin/activate
pip install -r backend/requirements.txt

# Start backend API
uvicorn backend.app.main:app --reload &
API_PID=$!

# Start Celery worker
python -m backend.app.celery_worker &
CELERY_PID=$!

# Start frontend
cd frontend
npm install
npm run start &
FRONTEND_PID=$!

trap "kill $API_PID $CELERY_PID $FRONTEND_PID" EXIT
wait $API_PID $CELERY_PID $FRONTEND_PID
