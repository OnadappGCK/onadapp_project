#!/bin/sh
echo "[INFO] SSL renewed, reloading nginx..."
docker exec nginx nginx -s reload
