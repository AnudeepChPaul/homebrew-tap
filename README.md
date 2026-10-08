# homebrew-tap

Private Homebrew tap for digest. Needs SSH access to both repos.

```sh
brew tap anudeepchpaul/tap git@github.com:AnudeepChPaul/homebrew-tap.git
brew install digest
```

Upgrade with `brew upgrade digest`. Releases are cut from the digest repo with `mise run release`.
