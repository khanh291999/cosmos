#!/bin/sh
set -e # Stop script immediately on error (fail-fast)

echo "--- STARTING INTEGRATION TEST ---"

# Simulate deliberate failure based on environment variable (Deliverable 2)
if [ "$FORCE_FAIL" = "true" ]; then
  echo "[!] Deliberately failing (FORCE_FAIL=true). Exiting with code 1."
  exit 1
fi

echo "1. Testing PostgreSQL..."
# Write record (Đã thêm "" vào các biến PG_PASS, PG_HOST)
PGPASSWORD="$PG_PASS" psql -h "$PG_HOST" -U postgres -d postgres -c "CREATE TABLE IF NOT EXISTS integration_test (id SERIAL, status TEXT);"
PGPASSWORD="$PG_PASS" psql -h "$PG_HOST" -U postgres -d postgres -c "INSERT INTO integration_test (status) VALUES ('psql_success');"
# Read record
RESULT_PG=$(PGPASSWORD="$PG_PASS" psql -h "$PG_HOST" -U postgres -d postgres -t -c "SELECT status FROM integration_test ORDER BY id DESC LIMIT 1;" | xargs)

if [ "$RESULT_PG" = "psql_success" ]; then
  echo "=> PostgreSQL is working properly."
else
  echo "=> PostgreSQL encountered an error."
  exit 1
fi

echo "2. Testing Redis..."
# Write key (Đã thêm "" vào các biến REDIS_HOST, REDIS_PASS)
redis-cli -h "$REDIS_HOST" -a "$REDIS_PASS" set mykey "redis_success"
# Read key
RESULT_REDIS=$(redis-cli -h "$REDIS_HOST" -a "$REDIS_PASS" get mykey)

if [ "$RESULT_REDIS" = "redis_success" ]; then
  echo "=> Redis is working properly."
else
  echo "=> Redis encountered an error."
  exit 1
fi

echo "--- INTEGRATION TEST SUCCESSFUL (Exit 0) ---"
exit 0
