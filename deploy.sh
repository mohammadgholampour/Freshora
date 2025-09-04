#!/bin/bash

# فعال کردن virtualenv
source .venv/bin/activate

# ست کردن environment variables
export $(grep -v '^#' .env | xargs)

# اجرای migrations
python manage.py migrate --noinput

# استارت Gunicorn
gunicorn gambo.wsgi:application --bind 0.0.0.0:$PORT
