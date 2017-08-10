import collections
import datetime
import importlib
import json
import os
import re
import time
from uuid import uuid4

from peewee import *

import utils

settings = importlib.import_module('config.%s.settings' % utils.get_env())
db = settings.DATABASES['default']
db_engine = getattr(importlib.__import__(db['ENGINE'].split('.')[0]), db['ENGINE'].split('.')[1])
database = db_engine(**db['OPTIONS'])

class BaseModel(Model):
    active = BooleanField(default=True)
    created = DateTimeField()

    class Meta:
        database = database
