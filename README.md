# Homebrew Tap (ipm)

Personal Homebrew formulae for ipm.

## Tap this repo

```bash
brew tap mattstrick/ipm-tap
```

## Install ipm

```bash
brew install mattstrick/ipm-tap/ipm
```

Then use the `ipm` and `npx` commands as usual.

## Updating the formula when you release a new ipm-cli version

1. Tag a release in [ipm-cli](https://github.com/mattstrick/ipm-cli), e.g. `v11.10.2`.
2. Update `Formula/ipm.rb`:
   - Set `url` to the new tarball: `https://github.com/mattstrick/ipm-cli/archive/refs/tags/vVERSION.tar.gz`
   - Get the new SHA256:
     ```bash
     curl -sL "https://github.com/mattstrick/ipm-cli/archive/refs/tags/vVERSION.tar.gz" | shasum -a 256
     ```
   - Set `sha256` in the formula.
3. Commit, push, then users can `brew update && brew upgrade ipm`.

## Pushing this tap to GitHub

1. Create a new repo named **`homebrew-ipm-tap`** under your GitHub user (e.g. `https://github.com/mattstrick/homebrew-ipm-tap`).
2. From this directory:
   ```bash
   git init
   git add .
   git commit -m "Add ipm formula"
   git remote add origin https://github.com/mattstrick/homebrew-ipm-tap.git
   git push -u origin main
   ```
3. Then anyone can run `brew tap mattstrick/ipm-tap` and `brew install mattstrick/ipm-tap/ipm`.
