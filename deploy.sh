#!/bin/bash

# نصب نیازمندی‌ها
pip install -r requirements.txt

# ساخت مایگریشن‌ها و اجرای آنها
python manage.py makemigrations
python manage.py migrate

# ساخت SiteSettings پیش‌فرض
python manage.py shell -c "from core.models import SiteSettings; SiteSettings.objects.get_or_create(pk=1)"

# جمع‌آوری فایل‌های استاتیک
python manage.py collectstatic --noinput
