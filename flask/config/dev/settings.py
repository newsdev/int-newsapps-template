import os

from peewee import *

import utils

DEBUG=True
TEMPLATE_PATH = '%s/templates/' % os.path.dirname(os.path.realpath(__file__))

DATABASES = {
    'default': {
        'ENGINE': 'peewee.PostgresqlDatabase',
        'OPTIONS': {
            "database": os.environ.get('MYAPP_DB_NAME', "MYAPP_%s" % utils.get_env()),
            "user": os.environ.get('MYAPP_DB_USER', None),
            "password": os.environ.get('MYAPP_DB_PASSWORD', None),
            "host": os.environ.get('MYAPP_DB_HOST', None),
        }
    }
}
