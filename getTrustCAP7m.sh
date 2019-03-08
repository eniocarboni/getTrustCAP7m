# /bin/bash

# XML_CERTS='https://applicazioni.cnipa.gov.it/TSL/_IT_TSL_signed.xml'
XML_CERTS='https://eidas.agid.gov.it/TL/TSL-IT.xml'
# cnipa_signed.xml now is only one line long so we add e return value before start tag and after tag (X509Certificate)
wget -O - ${XML_CERTS} | sed -e 's/<X509Certificate/\n<X509Certificate/g' -e s'#</X509Certificate>#</X509Certificate>\n#g' | perl -ne 'if (/<X509Certificate>/) {
s/^\s+//; s/\s+$//;
s/<\/*X509Certificate>//g;
print "-----BEGIN CERTIFICATE-----\n";
while (length($_)>64) {
print substr($_,0,64)."\n";
$_=substr($_,64);
}
print $_."\n";
print "-----END CERTIFICATE-----\n";
}'



#      Copyright (c) 2016 Enio Carboni - Italy
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

