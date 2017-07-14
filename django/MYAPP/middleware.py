import re

from django.http import HttpResponse

class HealthCheckMiddleware(object):
    def process_request(self, request):
        if "/healthcheck" in request.path:
            return HttpResponse('healthy: returned by middleware.HealthCheckMiddleware', status=200)