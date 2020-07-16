# EdgeDB Homebrew Tap

There's two kinds of formulae:

* default, e.g. `edgedb-cli` which is the latest released version
* nightly, e.g. `edgedb-cli-nightly` which is the latest available nightly version

## How do I install these formulae?
`brew install edgedb/tap/<formula>`

Or `brew tap edgedb/tap` and then `brew install <formula>`.

## Documentation
`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## How to auto-update versions from published JSON indexes?
```
$ curl -H "Accept: application/vnd.github.everest-preview+json" \
       -H "Authorization: Bearer $GITHUB_TOKEN" \
       -H "Content-Type: application/json" \
       --data '{"event_type": "autoupdate"}' \
       https://api.github.com/repos/edgedb/homebrew-tap/dispatches
```
