
FROM kadena/chainweb-node:latest
WORKDIR /chainweb

# Install scripts
COPY run-chainweb-node.sh .
COPY initialize-db.sh .
COPY chainweb.mainnet01.yaml .
COPY chainweb.testnet04.yaml .
COPY chainweb.development.yaml .
COPY check-health.sh .
RUN chmod 755 run-chainweb-node.sh initialize-db.sh check-health.sh

# Command
STOPSIGNAL SIGTERM
HEALTHCHECK --start-period=5m --interval=1m --retries=5 --timeout=10s CMD ./check-health.sh

CMD ./run-chainweb-node.sh
