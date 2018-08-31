#!/bin/bash

cd /app
gerapy init
cd gerapy
gerapy migrate
gerapy runserver 0.0.0.0:8000

while true; do echo `date`;sleep 60;tail -f /home/admin/jlogindexer/logs/performance-*;done