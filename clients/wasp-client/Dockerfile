# Stage 1: Build evmemulator from source
FROM golang:1.24 AS evmbuilder

WORKDIR /src
RUN git clone --depth=1 --branch emulator https://github.com/howjmay/wasp.git waspclone
# COPY waspclone /src/waspclone

COPY waspclone/go.mod /go.mod
WORKDIR /src/waspclone/tools/evm/evmemulator
RUN go build -o /evmemulator

# Stage 2: Final runtime image
FROM ubuntu:22.04

# Copy evmemulator binary from builder stage
COPY --from=evmbuilder /evmemulator /usr/local/bin/evmemulator
COPY --from=evmbuilder /go.mod /go.mod

# Genesis file
COPY genesis.json /etc/genesis.json

# Entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8545 8551

ENTRYPOINT ["/entrypoint.sh"]