import os
from boto.s3.connection import ProtocolIndependentOrdinaryCallingFormat

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SECRET_KEY = os.environ.get('DJANGO_SECRET_KEY', '++hv#e)wqd-as;dlkjf;sdkfljsfdg3499134mndfs!@^$-snmz+@m(&-g5e74&zg)+geh-xqe')
DEBUG = True
ALLOWED_HOSTS = ['*']

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.postgres',
    'django.contrib.humanize',
    'rest_framework',
    'pure_pagination',
    'storages',
]

MIDDLEWARE = [
    'MYAPP.middleware.HealthCheckMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'pyiap.django.VerifyJWTMiddleware',
]

ROOT_URLCONF = 'MYAPP.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ['MYAPP/templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.static',
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'config.dev.app.application'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': os.environ.get('MYAPP_DB_NAME', 'MYAPP'),
        'USER': os.environ.get('MYAPP_DB_USER', ''),
        'PASSWORD': os.environ.get('MYAPP_DB_PASSWORD', ''),
        'HOST': os.environ.get('MYAPP_DB_HOST', ''),
    }
}

ADD_REVERSION_ADMIN=True

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.DjangoModelPermissionsOrAnonReadOnly'
    ],
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.LimitOffsetPagination',
    'PAGE_SIZE': 1000
}

PAGINATION_SETTINGS = {
    'PAGE_RANGE_DISPLAYED': 4,
    'MARGIN_PAGES_DISPLAYED': 1,
    'SHOW_FIRST_PAGE_WHEN_INVALID': True,
}

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

AWS_S3_CALLING_FORMAT = ProtocolIndependentOrdinaryCallingFormat()
AWS_SECRET_ACCESS_KEY = os.environ.get('AWS_SECRET_ACCESS_KEY', None)
AWS_ACCESS_KEY_ID = os.environ.get('AWS_ACCESS_KEY_ID', None)
AWS_STORAGE_BUCKET_NAME = os.environ.get('MYAPP_S3_BUCKET_NAME', 'int.dev.nyt.com')
AWS_S3_CUSTOM_DOMAIN = os.environ.get('MYAPP_S3_BUCKET_DOMAIN', 'int.dev.nyt.com')
AWS_S3_SECURE_URLS = False
AWS_S3_URL_PROTOCOL = 'http:'

STATICFILES_LOCATION = 'apps/MYAPP'
STATICFILES_STORAGE = 'MYAPP.utils.custom_storages.StaticStorage'
STATIC_URL = "%s/" % STATICFILES_LOCATION

MEDIAFILES_LOCATION = 'apps/MYAPP/media'
MEDIA_URL = "%s/" % MEDIAFILES_LOCATION
DEFAULT_FILE_STORAGE = 'MYAPP.utils.custom_storages.MediaStorage'