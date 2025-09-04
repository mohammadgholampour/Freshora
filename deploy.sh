#!/bin/bash
# deploy_build.sh

# Activate virtual environment
source "$VIRTUAL_ENV/bin/activate"

# Upgrade pip
pip install --upgrade pip

# Install requirements
pip install -r requirements.txt

# Make migrations and migrate
python manage.py makemigrations
# Migrate
python manage.py migrate --noinput

# Create default SiteSettings AFTER migrations
# This is a workaround to create a default SiteSettings after migrations
python manage.py shell -c "from core.models import SiteSettings; SiteSettings.objects.get_or_create(pk=1)"

# Collect static files
python manage.py collectstatic --noinput
