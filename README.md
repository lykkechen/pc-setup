# Things to do to reset PC

Things to save before erasing everything:

- [] browser bookmarks
- [] ssh keys
- [x] local files
- [] .bash_profile or .zshrc
- [] global .gitignore

## Mac Settings

- Trackpad scroll direction: Not Natural
- Mouse scroll direction: Not Natural

## Vs Settings

- Explorer: Compact Folders
- Editor: Minimap

## Do

- install LTS node version
- install <https://www.logitech.com/en-us/product/options>

## Update 2023/11/04

In .zshrc add command to start collector locally

`alias otelcol="docker run -v /etc/otelcol/config.yaml:/etc/otelcol-contrib/config.yaml -p 4317:4317 -p 4318:4318 --restart=always -d otel/opentelemetry-collector-contrib:0.87.0"`

Under folder `/private/etc/otelcol/config.yaml` add collector config

```
receivers:
  otlp:
    protocols:
      grpc:
      http:
exporters:
  otlp/honeycomb:
    endpoint: api.honeycomb.io:443
    headers:
      x-honeycomb-team: {HONEYCOMB-API-KEY}
processors:
  batch:
  filter:
    spans:
      exclude:
        match_type: regexp
        libraries:
          - name: '@opentelemetry/instrumentation-fs'

service:
  pipelines:
    traces:
      receivers: [otlp]
      processors: [filter,batch]
      exporters: [otlp/honeycomb]
    metrics:
      receivers: [otlp]
      processors: [batch]
      exporters: [otlp/honeycomb]
```

``` bash
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile

brew install yubikey-agent git ykman
# brew install zsh bind rclone

export SSH_AUTH_SOCK="/opt/homebrew/var/run/yubikey-agent.sock" >> $HOME/.zprofile # does this work?

brew services start yubikey-agent

brew install --cask google-chrome visual-studio-code docker rectangle
# brew install --cask 1password google-drive iterm2


mkdir .ssh
git config --global user.name "Le Chen"
git config --global user.email "le.chen@revas.io"
ssh-add -L > $HOME/.ssh/id_ed25519_nistp256.pub
git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global user.signingkey $HOME/.ssh/id_ed25519_nistp256.pub

## VSCode

- autosave
- settings sync with github

## Login with iCloud

- enable vault and firewall

## Other apps

Microsoft Office 365 + digital signature
```
