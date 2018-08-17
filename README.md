# yet another dotfiles repo


## post install

### Secure storage

Besides encrypting the entire disk, I also use an encrypted loopback image for
personal files.

    hdiutil create \
        -encryption -stdinpass \
        -type SPARSE -fs HFS+J \
        -volname Secure \
        -size 100g \
        Secure.sparseimage

This should be safe to drop on dropbox or any other sync platform.
