FROM alpine:3.18

# Install PostgreSQL client and Redis client
RUN apk add --no-cache postgresql-client redis

COPY test_workload.sh /usr/local/bin/test_workload.sh
RUN chmod +x /usr/local/bin/test_workload.sh

# Run the script when the container starts
CMD ["test_workload.sh"]
