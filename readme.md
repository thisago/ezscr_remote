# Remote Nimscript in Ezscr

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
ezscr run remote https://raw.githubusercontent.com/thisago/ezscr_remote/master/examples/sum.nims 3 5
```

Output: `8.0` (expected)

---

## Test

To test, just run

```bash
nim r tests/*.nim
```

## FAQ

### Can I run a `remote.nims` that downloads another `remote.nims`?

Yes, how many you want:

```bash
ezscr run remote https://example.com/remote.nims \ # scr 1 that runs scr 2
                 https://example.com/remote.nims \ # scr 2 runs the scr 4
                 https://example.com/sum.nims \ # scr 3 makes the sum
                 2 4
```

Example

```bash
ezscr run remote https://raw.githubusercontent.com/thisago/ezscr_remote/master/config/remote.nims https://raw.githubusercontent.com/thisago/ezscr_remote/master/config/remote.nims https://raw.githubusercontent.com/thisago/ezscr_remote/master/examples/sum.nims 2 5 3
```
Out: `10.0`

## TODO

- [ ] Test on Windows
- [ ] Add tests

## License

MIT
