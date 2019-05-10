# k8s-sample-signal-pass

Example of how implicit and explicit signal definitions might affect a container lifecycle.

## Results

|     x     |   implicit   |   explicit   |
| --------- | ------------ | ------------ |
|   with    |   U2         |  U1 , U2     |
|  without  |   TERM       |  U1, TERM    |


Where:

- **with** - having `STOPSIGNAL` in `Dockerfile` set to `SIGUSR2`
- **without** - *not* having any `STOPSIGNAL` set
- **explicit** - having a `preStop` sending `SIGUSR1`
- **implicit** - not having any `preStop`

