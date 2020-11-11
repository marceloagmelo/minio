#!/bin/bash

echo "========================================="
echo "Starting application"
echo "========================================="

/usr/bin/docker-entrypoint.sh minio server /storage

