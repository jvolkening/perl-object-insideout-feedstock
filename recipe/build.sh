#!/bin/bash

set -o errexit -o pipefail

if [[ -f Makefile.PL ]]; then
    perl Makefile.PL INSTALLDIRS=vendor NO_PERLLOCAL=1 NO_PACKLIST=1 MAKE=make
    make
    make test
    make install VERBINST=1
else
    echo 'Unable to find Makefile.PL. You need to modify build.sh.'
    exit 1
fi
