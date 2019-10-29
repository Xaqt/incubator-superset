#!/bin/bash
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
set -ex

echo "ENV here: " $SUPERSET_ENV
echo "MAPBOX_API_KEY: " $MAPBOX_API_KEY

echo "starting ssh"

pm2 start redis-server

echo 'redis started now'

celery worker --app=superset.sql_lab:celery_app --pool=gevent -Ofair &

exec gunicorn --bind  0.0.0.0:8088 \
  --workers $((2 * $(getconf _NPROCESSORS_ONLN) + 1)) \
  --timeout 60 \
  --limit-request-line 0 \
  --limit-request-field_size 0 \
  superset:app