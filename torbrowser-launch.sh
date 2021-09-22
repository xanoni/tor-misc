#! /usr/bin/env -S bash -ex

## Also see about:config => extensions.torlauncher.*

## SOCKS connection
export TOR_SOCKS_HOST=127.0.0.1
export TOR_SOCKS_PORT=9050

## Control connection
export TOR_CONTROL_HOST=127.0.0.1
export TOR_CONTROL_PORT=9051

## Control authentication (pick one of 2)
## Generate hashed PW via `tor --hash-password $PW`
#export TOR_CONTROL_COOKIE_AUTH_FILE="$HOME/.tor/CookieAuthFile"
export TOR_CONTROL_PASSWD='"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"'

## TOR_SKIP_LAUNCH - if set to 1, do not start a tor process, and, unless
## TOR_CONFIGURE_ONLY is set to 1, do to not try to configure Tor (that is, do
## not make a control port connection). Values other than 1 have no effect.
export TOR_SKIP_LAUNCH=1

## TOR_FORCE_NET_CONFIG - if set to 1, display the Tor Network Settings wizard
## at startup (the value of the extensions.torlauncher.prompt_at_startup hidden
## preference is ignored). Values other than 1 have no effect. Used by Tails.
export TOR_FORCE_NET_CONFIG=0

## TOR_CONFIGURE_ONLY - if set to 1, do not start Tor but try to connect via the
## control port to configure Tor. Also, Tor Launcher will not try to become the
## primary controller. Values other than 1 have no effect.
export TOR_CONFIGURE_ONLY=1

## TOR_TRANSPROXY=1 enables Torbutton's transparent proxy mode, which is used if
## you have a Tor Router or some other set up that does not require that the
## browser connect to Tor via a SOCKS proxy.
#export TOR_TRANSPROXY=1

## Change exec for Linux!
open "/Applications/Tor Browser.app" #--profile /path/to/torbrowser/Data/
