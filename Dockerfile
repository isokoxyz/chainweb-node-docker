
FROM kadena/chainweb-node
WORKDIR /chainweb

# Install scripts
COPY chainweb.mainnet01.yaml .
COPY chainweb.testnet04.yaml .
COPY chainweb.development.yaml .

# Command
STOPSIGNAL SIGTERM
HEALTHCHECK --start-period=5m --interval=1m --retries=5 --timeout=10s CMD ./check-health.sh

CMD ./run-chainweb-node.sh
