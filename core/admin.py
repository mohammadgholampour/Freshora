from django.contrib import admin
from core.models import SiteSettings


# Register your models here.
@admin.register(SiteSettings)
class SiteSettingsAdmin(admin.ModelAdmin):
    list_display = ['site_name', 'contact_email', 'contact_phone', 'address', 'privacy_last_updated', 'terms_last_updated']
