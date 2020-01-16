# Boxstarter script

Collection of scripts I use to automate the creation of Windows and WSL environments. Leverages [Chocolatey](https://chocolatey.org/) to automate the installation of software and create repeatable, scripted Windows environments.

Heavily inspired by [Nick Craver](https://nickcraver.com/)'s [Windows10-Setup](https://gist.github.com/NickCraver/7ebf9efbfd0c3eab72e9) gist, [Jess Frazelle](https://blog.jessfraz.com/)'s [boxstarter.ps1](https://gist.github.com/jessfraz/7c319b046daa101a4aaef937a20ff41f) script, and the [Debloat-Windows-10](https://github.com/W4RH4WK/Debloat-Windows-10) project.

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

## License

[MIT](LICENSE) &copy; [Hugo Manrique](https://hugmanrique.me)