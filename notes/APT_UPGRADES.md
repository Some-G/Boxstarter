# Automating WSL updates via Windows Task

[`scripts/wsl.ps1`](scripts/wsl.ps1) creates a Windows task to automatically update WSL every week. However, this requires additional setup that, for security reasons, shouldn't be scripted.

The following updates the sudoers configuration to allow `apt-get` to run as root without prompting for a manually entered password.

```bash
sudo visudo
```

Add the following lines

```bash
# Allow members of the sudo group to execute apt-get without a password
%sudo ALL=NOPASSWD:/usr/bin/apt-get
```