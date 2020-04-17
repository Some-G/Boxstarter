# Boxstarter script

Collection of scripts I use to automate the creation of Windows and WSL environments. Leverages [Chocolatey](https://chocolatey.org/) to automate the installation of software and create repeatable, scripted Windows environments.

Heavily inspired by [Nick Craver](https://nickcraver.com/)'s [Windows10-Setup](https://gist.github.com/NickCraver/7ebf9efbfd0c3eab72e9) gist, [Jess Frazelle](https://blog.jessfraz.com/)'s [boxstarter.ps1](https://gist.github.com/jessfraz/7c319b046daa101a4aaef937a20ff41f) script, and the [Debloat-Windows-10](https://github.com/W4RH4WK/Debloat-Windows-10) project.

Includes the [APT weekly upgrades](https://www.riosec.com/articles/automatingupdatesforbashonubuntuonwindows10) task by [RioSec](https://www.riosec.com/).

## Usage

Open an **elevated** PowerShell command-prompt and run:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope Process
```

Next, run the `boxstarter.ps1` script:

```powershell
.\boxstarter.ps1
```

## Updating Chocolatey apps

Follow the same steps as above, but instead of running `boxstarter.ps1`, execute:

```powershell
.\scripts\installApps.ps1
```

Contrary to its name, it will run `choco upgrade` on non auto-updateable programs. Auto-upgrading programs must be manually updated through their UI.

## Setting up WSL

This repo also contains a bash setup script that creates the necessary links to share config files between Windows and Linux user profiles. It also installs some applications.

Note some config files need to be created manually prior to running this script.

To run it, open a WSL shell and execute:

```bash
./wslstarter.sh
```

## Start VS Code in WSL mode

_Depends on VS Code, WSL._

First, install the `ms-vscode-remote.remote-wsl` VS Code extension. Next, follow [these steps](#usage), but instead of running `boxstarter.ps1`, execute:

```powershell
.\scripts\configureApps.ps1
```

Contextual "Open in Code" menus will now open the file/directory in a WSL session.

## Notes to self

I also use this repo as a reference guide.

- [Moving the Users directory to another drive](notes/MOVING_USERS.md)
- [Setting up Java](notes/SETTING_UP_JAVA.md)
- [Setting up git commit signing](notes/GPG_GIT.md)
- [Missing apps list](notes/MISSING_APPS.md)

## License

[MIT](LICENSE) &copy; [Hugo Manrique](https://hugmanrique.me)