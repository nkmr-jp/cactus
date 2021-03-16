# Color settings
# See: https://gist.github.com/rsperl/d2dfe88a520968fbc1f49db0a29345b9
# define standard colors
BLACK=$(tput -Txterm setaf 0)
RED=$(tput -Txterm setaf 1)
GREEN=$(tput -Txterm setaf 2)
YELLOW=$(tput -Txterm setaf 3)
LIGHTPURPLE=$(tput -Txterm setaf 4)
PURPLE=$(tput -Txterm setaf 5)
BLUE=$(tput -Txterm setaf 6)
WHITE=$(tput -Txterm setaf 7)
RESET=$(tput -Txterm sgr0)

POST_DATA='{
  "businessLogicID": "guks32pf",
  "tradeParams": [
    "0x06fc56347d91c6ad2dae0c3ba38eb12ab0d72e97",
    "0x9d624f7995e8bd70251f8265f2f9f2b49f169c55",
    "Brad",
    "Cathy",
    50,
    "CAR1"
  ],
  "authParams": [
    "none"
  ]
}'

echo
echo "${GREEN}POST: 1. show curl command ${RESET}"
echo "curl localhost:5034/api/v1/bl/trades/"
echo
echo "${GREEN} POST: 2. show post data ${RESET}"
echo "$POST_DATA"
echo
echo "${GREEN} POST: 2. show response${RESET}"
curl localhost:5034/api/v1/bl/trades/ \
  -XPOST -H "Content-Type: application/json" \
  -d "$POST_DATA"
