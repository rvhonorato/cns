# CNS Compilation

This repository contains a Dockerfile to compile a static CNS binary

You need to et the `cns_solve_1.3_all.tar.gz` from the CNS website,
you will need to make a request and fill a form: <https://cns-online.org/cns_request/>

Put this file in the same directory as the Dockerfile.

To run the builder and copy the executable to your current working
directory, follow the commands below:

```bash
# Build the builder
docker build -t cns-compiler .

# Create a container from this image
docker create --name cns-temp cns-compiler

# Copy the CNS binary from the builder to your working directory
docker cp cns-temp/opt/cns_static ./cns

# Cleanup the temporary container
docker rm cns-temp
```

```bash
# Now you can run the CNS binary
./cns
```
