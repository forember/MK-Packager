#!/bin/bash
set -ex
cd /packager
rm -r binaries
mkdir binaries
cd binaries
mkdir libjack2-optional libjack2-optional-dev jackd2-optional
