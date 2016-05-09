# Shell

- Change to zsh `chsh -s /usr/local/bin/zsh`

# Credentials

- ssh
- aws

# Secure storage

Besides encrypting the entire disk, I also use an encrypted loopback image for
personal files.

    hdiutil create \
        -encryption -stdinpass \
        -type SPARSE -fs HFS+J \
        -volname Secure \
        -size 100g \
        Secure.sparseimage
