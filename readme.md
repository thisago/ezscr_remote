# Remote Nimscript

This is a example of how to run Nimscript files that are available in a HTTP
server without Nim installed

## Setup

First you need to install the ezscr (assuming that you already have installed
the Nim)

```bash
nimble install ezscr
```

Then, you need to pack the script(s) using ezscr

```bash
ezscr pack
```

Now you can use the script as following

```bash
ezscr run remote https://raw.githubusercontent.com/thisago/remote_nimscript/master/examples/sum.nims 3 5
```

Output: `8` (expected)

---

## Test

To test, just run

```bash
nim r tests/*.nim
```

## License

MIT