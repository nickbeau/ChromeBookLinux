#!/bin/bash
#This shell script sets up Linix (Beta) on a chrome book for dotnet developers.
# Step 1: Install WGET
sudo apt-get install wget

# Step 2: Setup Microsoft Repos
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget -q https://packages.microsoft.com/config/debian/9/prod.list
sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list
sudo apt-get update

# Step 3: Install the DotNet Core SDK
sudo apt-get install dotnet-sdk-2.1

# Step 4: Setup Apt for VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update

# Step 5: Install VSCode
sudo apt-get install code # or code-insiders

# Step 6: Install Blazor Templates
dotnet new -i Microsoft.AspNetCore.Blazor.Templates
