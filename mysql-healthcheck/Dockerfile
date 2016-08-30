FROM mysql:latest

COPY healthcheck.sh /healthcheck.sh
HEALTHCHECK --retries=6 --interval=10s --timeout=5s CMD /healthcheck.sh
