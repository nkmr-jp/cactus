# Color settings
# See: https://gist.github.com/rsperl/d2dfe88a520968fbc1f49db0a29345b9
# define standard colors
BLACK        := $(shell tput -Txterm setaf 0)
RED          := $(shell tput -Txterm setaf 1)
GREEN        := $(shell tput -Txterm setaf 2)
YELLOW       := $(shell tput -Txterm setaf 3)
LIGHTPURPLE  := $(shell tput -Txterm setaf 4)
PURPLE       := $(shell tput -Txterm setaf 5)
BLUE         := $(shell tput -Txterm setaf 6)
WHITE        := $(shell tput -Txterm setaf 7)
RESET := $(shell tput -Txterm sgr0)

start-ledger:
	@echo "${GREEN}# START: start fabric, go-ethereum ${RESET}"
	@sh script-start-ledgers.sh

.PHONY: build
build:
	@echo "${GREEN}# BUILD: 1. build fabric/validator, go-ethereum/validator, packages, cartrade ${RESET}"
	@sh script-build-all.sh
	@echo "${GREEN}# BUILD: 2. build get-app ${RESET}"
	@sh script-build-get-app.sh

# TODO: ログをファイルに出す
start-fabric-validator:
	@sh script-start-validator-fabric.sh

# TODO: ログをファイルに出す
start-eth-validator:
	@sh script-start-validator-ethereum.sh

.PHONY: start
start:
	@sh script-start-cartrade.sh

stop:
	@sh script-stop-cartrade.sh

restart: stop start

.PHONY: get
get:
	@#sh script-get-app.sh
	@echo "${GREEN}# GET: 1. get ethereum balances ${RESET}"
	@cd script-test-getFunctions/go-ethereum; node getBalance.js
	@echo
	@echo "${GREEN}# GET: 2. get Fabcar owner ${RESET}"
	@cd script-test-getFunctions/fabric; node queryCar.js CAR1

.PHONY: post
post:
	@sh script-post-cartrade-sample.sh

