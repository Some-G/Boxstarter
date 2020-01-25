# Setting up git commit signing

Open `~/.gitconfig` and add the following:

```toml
[user]
  # ...
  signingkey = <GPG_KEY_SIGNATURE>
[commit]
  gpgsign = true
```

Next, open `~/.bashrc` and add the following at the end of file:

```bash
export GPG_TTY=$(tty)
```

`source ~/.bashrc` or restart your terminal, and git should now sign every commit.