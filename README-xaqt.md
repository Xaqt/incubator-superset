# Xaqt superset

## Setup

1. Get bq_keys.json file into both root and ./contrib/docker folders
2. Make sure your memory is large enough on docker: https://github.com/apache/incubator-superset/issues/8211
3. You need to set env variables:

```
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
COMPOSE_PROJECT_NAME=
POSTGRES_DB=
POSTGRES_USER=
POSTGRES_PASSWORD=
POSTGRES_HOST=
POSTGRES_PORT=5432
REDIS_HOST=
REDIS_PORT=
GOOGLE_APPLICATION_CREDENTIALS=/home/superset/superset/bq_keys.json
MAPBOX_API_KEY=
SUPERSET_LOAD_EXAMPLES=yes
SUPERSET_ENV=production
```
