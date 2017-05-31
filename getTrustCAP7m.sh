# /bin/bash

wget -O - https://applicazioni.cnipa.gov.it/TSL/_IT_TSL_signed.xml | perl -ne 'if (/<X509Certificate>/) {
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

