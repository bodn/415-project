sh ./bash_profile.sh
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NOCOLOR='\033[0m'
echo -e "${GREEN}Setting up enviornment:${NOCOLOR}"
# Gather npm dependencies
if [ -d "./node_modules" ] 
then
    echo "Dependencies already installed..." 
else
    echo -e "${RED}node_modules not found...${NOCOLOR}"
    echo -e "Installing dependencies..."
    npm install
fi