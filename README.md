# Debugging Go with Delve running in Docker

This is a proof of concept for running the delve server within docker and then use delve as a CLI client to connect to it. 

```bash
# build and run a docker image containing the source code, the binary and delve
# This will make delve available on port 2345
make up

# Run the delve client CLI to add breakpoints etc
make dlv
```
