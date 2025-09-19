# CNS Compilation

This repository contains a Dockerfile to compile a static CNS binary

## Usage

- Get the `cns_solve_1.3_all.tar.gz` from the CNS website,
  you will need to make a request and fill a form: <https://cns-online.org/cns_request/>

This is all you need.

To run the builder and copy the executable to your current working
directory, follow the commands below:

```bash
# Build the builder
docker build -t cns-compiler .

# Create a container from this image
docker create --name cns-temp cns-compiler

# Copy the CNS binary from the builder container to your current working directory
docker cp cns-temp/opt/cns_static ./cns

# Cleanup the temporary container
docker rm cns-temp
```

```bash
# Now you can run the CNS binary
./cns
```
