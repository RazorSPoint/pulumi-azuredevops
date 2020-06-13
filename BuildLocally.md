# Build locally

**Important notice:**

> The build infrastructure is based on tools available on *nix-sh operating
> systems like MacOS or Linux. _Building on Windows is not supported._
>
> The provider can be build, installed and used in the Windows Subsytems for
> Linux (WSL) though.

## Prerequisites

 > **Note**
 > When installing packages it is assumed that the installation is uninterrupted as possible, thus flags for pre-confirming the installation are used.

1. Install `Go`

   Linux:

   ```sh
   $ sudo -E add-apt-repository ppa:longsleep/golang-backports -y
   $ sudo -E apt-get update
   $ sudo -E apt-get install golang-go -y
   ```

   Create a `$HOME/go/bin` directory add the directory path to your `PATH` variable.

   ```sh
   $ mkdir ~/go/bin
   $ export PATH=$PATH:~/go/bin
   ```

   > **Note**
   > So that the `$HOME/go/bin` directory is available in the environment
   > variable `$PATH` at every start of a shell, it makes sense to add the
   > shown export command to the file `$HOME/.bashrc` and `$HOME/.profile`.

2. [Install `Pulumi`](https://www.pulumi.com/docs/get-started/azure/install-pulumi/)

   Linux:

   ```sh
   $ curl -fsSL https://get.pulumi.com | sh
   ```

   Add the `$HOME/.pulumi/bin` directory to your `PATH` variable

   ```sh
   $ export PATH=$PATH:~/.pulumi/bin
   ```

3. Install `tf2pulumi`
=======
   > **Note**
   > So that the `$HOME/.pulumi/bin` directory is available in the environment
   > variable `$PATH` at every start of a shell, it makes sense to add the
   > shown export command to the file `$HOME/.bashrc` and `$HOME/.profile`.

   https://github.com/pulumi/tf2pulumi

   > **Note:**
   > Ensure that you install the binary in a directory that is already in your `PATH`
   > variable and make sure that the binary is executable.

   Linux:

   install jq, which is needed for the step after.

   ```sh
   $ sudo apt install jq -y
   ```

   ```sh
   $ curl -s "https://api.github.com/repos/pulumi/tf2pulumi/releases" \
     | jq -r ".[0].assets[] | select(.browser_download_url | test(\"$(uname | tr '[:upper:]' '[:lower:]')\")) | .browser_download_url" \
     | xargs curl -s -L \
     | tar xvz --directory="$(go env GOPATH)/bin"
   ```

4. Install `nodejs`

   Linux:

   ```sh
   $ curl -sL https://deb.nodesource.com/setup_12.x | sudo bash
   $ sudo apt-get install nodejs -y
   ```

5. Install `yarn`

   https://classic.yarnpkg.com/en/docs/install/#debian-stable

   Linux:

   ```
   $ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
   $ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
   $ sudo -E apt update && sudo -E apt install --no-install-recommends yarn
   ```

6. Install `Python3` and `Pip`

   Linux:

   ```sh
   $ sudo -E apt install python3-pip -y
   ```

7. Install Dotnet

   https://docs.microsoft.com/en-us/dotnet/core/install/linux-package-manager-ubuntu-1804

   Linux:

   ```sh
   $ curl -L https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb --output packages-microsoft-prod.deb
   $ sudo dpkg -i packages-microsoft-prod.deb
   $ rm packages-microsoft-prod.deb
   $ sudo -E add-apt-repository universe
   $ sudo -E apt update
   $ sudo -E apt install apt-transport-https -y
   $ sudo -E apt update
   $ sudo -E apt install dotnet-sdk-3.1 -y
   ```

8. Install `golangci-lint`

   https://github.com/golangci/golangci-lint

   Linux:

   ```sh
   $ curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.25.0
   ```

## Build and Install

To build and install theprovider locally

1. Clone repository https://github.com/tmeckel/pulumi-azuredevops

2. Run `make ensure`.

   > **Remark:**
   > Running `make ensure` is only required if
   >
   > * go packages have been updated,
   > * the project has been cleaned (`make build_clean`) or
   > * if you compile for the first time.
   >

3. Run `make build`

4. To perform a local install do `make install`

Samples for testing your installation can be found in in the [examples repository](https://github.com/tmeckel/pulumi-azuredevops-samples).

## Tips & Troubleshooting

1. Beware that when starting a new shell, the PATH variable does not include all of the needed path items. As mentioned, extend $HOME/.profile and $HOME/.bashrc and add the required path items to the $PATH variable.

2. Windows user can run the build on Windows with WSL. You can [activate it on Windows 10](https://docs.microsoft.com/en-us/windows/wsl/install-win10) with
```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
Currently, this only activates WSL version 1. If you want to use WSL2 you have to have at least install _Windows 10 Insider Preview build 18917_.

3. When working with Windows WSL or VSCode remote development extension it sometimes happens that non root permissions are not enough to use `make build` or `make install` you can it in a sudo shell. Make sure to start the shell and use the same PATH variable
```sh
sudo -E sudo env "PATH=$PATH" sh
```

4. After having installed the provider locally and using the NodeJS package `@pulumi/azuredevops` in your project, the following error could appear:

    ```sh
    ~/my/project/dir$ yarn link @pulumi/azuredevops
    yarn link v1.22.4
    error No registered package found called "@pulumi/azuredevops".
    info Visit https://yarnpkg.com/en/docs/cli/link for documentation about this command.
    ```

  This means that the package is not properly linked to use with yarn. In this case run the following script.

   ```sh
   $ cd $HOME/.pulumi/node_modules/@pulumi/azuredevops
   $ yarn link
   ```
