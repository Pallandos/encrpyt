# ENCRYPT

`ENCRYPT` is a simple wrapper for using `gpg` to encrypt files for backups, export and more

## Install and configuration

1. Clone this repo 
2. Run `make install` 
3. (Optional) create a `~/.config/encrypt/passphrase` and enter your default passphrase in it 
4. Done!

> [!CAUTION]
> Note that `~/.config/encrypt/passphrase` will store your passphrase in **plaintext**

## Usage 

```
encrypt [-p <passphrase_file>] -f <file_pattern>
```

This command will encrypt all files in current matching the given file pattern, using the passphrase in `passphrase_file`. If no passphrase file is passed, the programm will try to use the passfile in the config.

> [!CAUTION]
> Note that the passprase in config is **not encrypted** and this is not a safe method

## Example

```sh
encrypt -p pass.txt -f "*.tar.gz*"
# will encrypt all .tar.gz files in current dir with the passhrase in 'pass.txt'

encrypt -f "*.txt"
# NOT SAFE
# will encrypt all .txt files in current dir, using the passphrase in ~/.config/encrypt/passphrase
```

## Removing 

Uninstalling ENCRPYT is as easy as installing. Just run 

    make uninstall

and it will remove the files from your path.