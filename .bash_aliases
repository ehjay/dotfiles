# aliases for flux and screen dim
alias dim="pkill xflux; xrandr --output VGA1 --brightness 0.7"
alias brighten="pkill xflux; xrandr --output VGA1 --brightness 1"
alias flux="xflux -l 43.7 79.4"

# tscl runs tsc local build
run_tsc_local() {
  node ~/workspace/TypeScript/built/local/tsc.js $1
}
alias tscl=run_tsc_local
