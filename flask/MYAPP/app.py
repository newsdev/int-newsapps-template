#!/usr/bin/env python

import argparse
import base64
import csv
import datetime
import glob
import json
import importlib
import io
import os
import re
import time

try:
    import configparser
except ImportError:
    import ConfigParser as configparser

from flask import Flask, render_template, request, make_response, Response, redirect, jsonify
import peewee
from peewee import *
from pyiap.pyiap_flask_middleware import VerifyJWTMiddleware
import requests

import models
import utils

settings = importlib.import_module('config.%s.settings' % utils.get_env())
app = Flask(__name__, template_folder=settings.TEMPLATE_PATH)
# app.wsgi_app = VerifyJWTMiddleware(app.wsgi_app)
app.debug=settings.DEBUG

@app.before_request
def _db_connect():
    models.database.connect()

# This hook ensures that the connection is closed when we've finished
# processing the request.
@app.teardown_request
def _db_close(exc):
    if not models.database.is_closed():
        models.database.close()

@app.route('/healthcheck', methods=['GET'])
def health():
    return Response('ok')

##
## ROUTES GO HERE
##


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000, debug=True)
