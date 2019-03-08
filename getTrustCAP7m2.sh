#! /bin/bash

# XML_CERTS='https://applicazioni.cnipa.gov.it/TSL/_IT_TSL_signed.xml'
XML_CERTS='https://eidas.agid.gov.it/TL/TSL-IT.xml'
wget --tries=2 -O Ca.xml ${XML_CERTS}
# cnipa_signed.xml now is only one line long so we add e return value before start tag and after tag (X509Certificate)
for i in `sed -e 's/<X509Certificate/\n<X509Certificate/g' -e s'#</X509Certificate>#</X509Certificate>\n#g' Ca.xml | grep '<X509Certificate'`; do
  echo -e "-----BEGIN CERTIFICATE-----"
  echo $i| sed -e 's/<\/*X509Certificate>//g'| openssl base64 -d -A| openssl base64
  echo -e "-----END CERTIFICATE-----"
done >Ca.pem
rm Ca.xml


#      Copyright (c) 2018 Enio Carboni - Italy
#
#      This file is part of getTrustCAP7m.
#
#    getTrustCAP7m is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    getTrustCAP7m is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with getTrustCAP7m.  If not, see <http://www.gnu.org/licenses/>.

