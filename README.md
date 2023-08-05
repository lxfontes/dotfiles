# yet another dotfiles repo

```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

### Secure storage

Besides encrypting the entire disk, I also use an encrypted loopback image for
personal files.

    hdiutil create \
        -encryption -stdinpass \
        -type SPARSE -fs HFS+J \
        -volname Secure \
        -size 100g \
        Secure.sparseimage
