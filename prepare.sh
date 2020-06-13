sudo apt update && sudo apt upgrade -y

# Install Go
sudo -E add-apt-repository ppa:longsleep/golang-backports -y
sudo -E apt-get update
sudo -E apt-get install golang-go -y

#Create a '$HOME/go/bin' directory add the directory path to your 'PATH' variable.
mkdir -p ~/go/bin
export PATH=$PATH:~/go/bin

#Install Pulumi
curl -fsSL https://get.pulumi.com | sudo sh
export PATH=$PATH:~/.pulumi/bin

# install jq
sudo apt install jq -y

#Install 'tf2pulumi'
curl -s "https://api.github.com/repos/pulumi/tf2pulumi/releases" \
     | jq -r ".[0].assets[] | select(.browser_download_url | test(\"$(uname | tr '[:upper:]' '[:lower:]')\")) | .browser_download_url" \
     | xargs curl -s -L \
     | tar xvz --directory="$(go env GOPATH)/bin"

#Install Nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

#Install Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo -E apt update && sudo -E apt install --no-install-recommends yarn

#Install Python 3 and Pip
sudo -E apt install python3-pip -y

#Install .net core

curl -L https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb --output packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo -E add-apt-repository universe
sudo -E apt update
sudo -E apt install apt-transport-https -y
sudo -E apt update
sudo -E apt install dotnet-sdk-3.1 -y

# Install golangci-lint

 curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.25.0

 make ensure
