#!/bin/bash
gunicorn --bind  0.0.0.0:5000 --workers=5 --threads=2 app:app & 
sleep 15 
nginx -g 'daemon off;'
