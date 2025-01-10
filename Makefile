
.PHONY: relayerstart startrelayer
.PHONY: relayerbuild buildrelayer
.PHONY: relayerreset resetrelayer

.PHONY: keyringstart startkeyring
.PHONY: keyringbuild buildkeyring
.PHONY: keyringreset resetkeyring

.PHONY: proxystart startproxy
.PHONY: proxybuild buildproxy
.PHONY: proxyreset resetproxy

.PHONY: sidecarstart startsidecar
.PHONY: sidecarbuild buildsidecar
.PHONY: sidecarreset resetsidecar

.PHONY: zrchainstart startzrchain
.PHONY: zrchainbuild buildzrchain
.PHONY: zrchainreset resetzrchain

# Aliases
startrelayer: relayerstart
buildrelayer: relayerbuild
resetrelayer: relayerreset

startkeyring: keyringstart
buildkeyring: keyringbuild
resetkeyring: keyringreset

startproxy: proxystart
buildproxy: proxybuild
resetproxy: proxyreset

startsidecar: sidecarstart
buildsidecar: sidecarbuild
resetsidecar: sidecarreset

startzrchain: zrchainstart
buildzrchain: zrchainbuild
resetzrchain: zrchainreset

# Main Targets
relayerstart:
	@echo "Running target: relayerstart"
	cd zenrock/tools/relayer/cmd/relayer && \
	go run main.go

relayerbuild:
	@echo "Running target: relayerbuild"
	@echo "No Action Defined"

relayerreset:
	@echo "Running target: relayerreset"
	@echo "No Action Defined"

#######################################################


keyringbuild:
	@echo "Running target: keyringbuild"
	cd zenrock/keyring/cmd/zenrockkms && \
	rm -f zenrockkms && \
	go build -o zenrockkms

keyringstart:
	@echo "Running target: keyringstart"
	cd zenrock/keyring/cmd/zenrockkms && \
	./zenrockkms --config=config-zenbtc.yml

keyringreset:
	@echo "Running target: keyringreset"
	@echo "No Action Defined"

#######################################################

proxystart:
	@echo "Running target: proxystart"
	cd zenrock/bitcoin-proxy && \
    go run cmd/main.go config_zenbtc_local.yml

proxybuild:
	@echo "Running target: proxybuild"
	@echo "No Action Defined"

proxyreset:
	@echo "Running target: proxyreset"
	@echo "No Action Defined"


#######################################################

sidecarstart:
	@echo "Running target: sidecarstart"
	cd zrchain/sidecar && \
    ./sidecar


sidecarbuild:
	@echo "Running target: sidecarbuild"
	cd zrchain/sidecar && \
    rm -f sidecar && \
    go build -o sidecar

sidecarreset:
	@echo "Running target: sidecarreset"
	rm -rf zrchain/sidecar/neutrino/neutrino_testnet3 && \
    mkdir -p zrchain/sidecar/neutrino/neutrino_testnet3 && \
    rm -rf zrchain/sidecar/neutrino/neutrino_mainnet && \
    mkdir -p zrchain/sidecar/neutrino/neutrino_mainnet


#######################################################

zrchainstart:
	@echo "Running target: zrchainstart"
	cd zrchain && \
    ./start.sh

zrchainbuild:
	@echo "Running target: zrchainbuild"
	@echo "No Action Defined"

zrchainreset:
	@echo "Running target: zrchainreset"
	cd zrchain && \
    ./reset.sh && \
    ./start.sh