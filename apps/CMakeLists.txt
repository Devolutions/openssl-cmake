# Based on original work by David Manura
# Copyright (C) 2007-2012 LuaDist.
# Copyright (C) 2013 Brian Sidebotham

# Redistribution and use of this file is allowed according to the terms of the
# MIT license.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

set(OPENSSL_APPS_SRC_DIR "${OPENSSL_SRC_DIR}/apps")
set(OPENSSL_APPS_BIN_DIR "${OPENSSL_BIN_DIR}/apps")

file(READ "${OPENSSL_APPS_SRC_DIR}/CA.pl.cmake" CA_PL)
file(WRITE "${OPENSSL_APPS_BIN_DIR}/CA.pl" "${CA_PL}")

file(READ "${OPENSSL_APPS_SRC_DIR}/tsget.cmake" TSGET)
string(REPLACE "@VERSION_STRING@" "${VERSION_STRING}" TSGET "${TSGET}")
file(WRITE "${OPENSSL_APPS_BIN_DIR}/tsget" "${TSGET}")

file(READ "${OPENSSL_APPS_SRC_DIR}/progs.h.cmake" PROGS_H)
file(WRITE "${OPENSSL_APPS_BIN_DIR}/progs.h" "${PROGS_H}")

include_directories(BEFORE SYSTEM "${OPENSSL_APPS_BIN_DIR}")

add_definitions(-DMONOLITH)

set(E_SRC
    "${OPENSSL_APPS_SRC_DIR}/app_rand.c"
    "${OPENSSL_APPS_SRC_DIR}/apps.c"
    "${OPENSSL_APPS_SRC_DIR}/asn1pars.c"
    "${OPENSSL_APPS_SRC_DIR}/bf_prefix.c"
    "${OPENSSL_APPS_SRC_DIR}/ca.c"
    "${OPENSSL_APPS_SRC_DIR}/ciphers.c"
    "${OPENSSL_APPS_SRC_DIR}/cms.c"
    "${OPENSSL_APPS_SRC_DIR}/crl.c"
    "${OPENSSL_APPS_SRC_DIR}/crl2p7.c"
    "${OPENSSL_APPS_SRC_DIR}/dgst.c"
    "${OPENSSL_APPS_SRC_DIR}/dhparam.c"
    "${OPENSSL_APPS_SRC_DIR}/dsa.c"
    "${OPENSSL_APPS_SRC_DIR}/dsaparam.c"
    "${OPENSSL_APPS_SRC_DIR}/ec.c"
    "${OPENSSL_APPS_SRC_DIR}/ecparam.c"
    "${OPENSSL_APPS_SRC_DIR}/enc.c"
    "${OPENSSL_APPS_SRC_DIR}/engine.c"
    "${OPENSSL_APPS_SRC_DIR}/errstr.c"
    "${OPENSSL_APPS_SRC_DIR}/gendsa.c"
    "${OPENSSL_APPS_SRC_DIR}/genpkey.c"
    "${OPENSSL_APPS_SRC_DIR}/genrsa.c"
    "${OPENSSL_APPS_SRC_DIR}/nseq.c"
    "${OPENSSL_APPS_SRC_DIR}/ocsp.c"
    "${OPENSSL_APPS_SRC_DIR}/openssl.c"
    "${OPENSSL_APPS_SRC_DIR}/opt.c"
    "${OPENSSL_APPS_SRC_DIR}/passwd.c"
    "${OPENSSL_APPS_SRC_DIR}/pkcs12.c"
    "${OPENSSL_APPS_SRC_DIR}/pkcs7.c"
    "${OPENSSL_APPS_SRC_DIR}/pkcs8.c"
    "${OPENSSL_APPS_SRC_DIR}/pkey.c"
    "${OPENSSL_APPS_SRC_DIR}/pkeyparam.c"
    "${OPENSSL_APPS_SRC_DIR}/pkeyutl.c"
    "${OPENSSL_APPS_SRC_DIR}/prime.c"
    "${OPENSSL_APPS_SRC_DIR}/rand.c"
    "${OPENSSL_APPS_SRC_DIR}/rehash.c"
    "${OPENSSL_APPS_SRC_DIR}/req.c"
    "${OPENSSL_APPS_SRC_DIR}/rsa.c"
    "${OPENSSL_APPS_SRC_DIR}/rsautl.c"
    "${OPENSSL_APPS_SRC_DIR}/s_cb.c"
    "${OPENSSL_APPS_SRC_DIR}/s_client.c"
    "${OPENSSL_APPS_SRC_DIR}/s_server.c"
    "${OPENSSL_APPS_SRC_DIR}/s_socket.c"
    "${OPENSSL_APPS_SRC_DIR}/s_time.c"
    "${OPENSSL_APPS_SRC_DIR}/sess_id.c"
    "${OPENSSL_APPS_SRC_DIR}/smime.c"
    "${OPENSSL_APPS_SRC_DIR}/speed.c"
    "${OPENSSL_APPS_SRC_DIR}/spkac.c"
    "${OPENSSL_APPS_SRC_DIR}/storeutl.c"
    "${OPENSSL_APPS_SRC_DIR}/srp.c"
    "${OPENSSL_APPS_SRC_DIR}/ts.c"
    "${OPENSSL_APPS_SRC_DIR}/verify.c"
    "${OPENSSL_APPS_SRC_DIR}/version.c"
    "${OPENSSL_APPS_SRC_DIR}/x509.c")

if(WIN32)
    if(EXISTS "${OPENSSL_APPS_SRC_DIR}/win32_init.c")
        list(APPEND E_SRC "${OPENSSL_APPS_SRC_DIR}/win32_init.c")
    endif()
endif()

add_executable(openssl ${E_SRC})

target_link_libraries(openssl crypto ssl)

install(TARGETS openssl
    RUNTIME DESTINATION bin)

install(FILES
    "${OPENSSL_APPS_BIN_DIR}/CA.pl"
    "${OPENSSL_APPS_BIN_DIR}/tsget"
    DESTINATION share/openssl)
