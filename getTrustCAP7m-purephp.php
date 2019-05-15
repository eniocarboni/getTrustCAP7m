<?php

$XML_CERTS='https://eidas.agid.gov.it/TL/TSL-IT.xml';
$xmlDoc = file_get_contents($XML_CERTS);
if ($xmlDoc === FALSE) {
	echo "Ci sono problemi a scaricare il file $XML_CERTS\n";
	exit(1);
}
$xmlDoc2=preg_replace('/<X509Certificate/',"\n<X509Certificate",$xmlDoc);
$xmlDoc2=preg_replace('/<\/X509Certificate>/',"</X509Certificate>\n",$xmlDoc2);
preg_match_all ('/<X509Certificate>(.*)<\/X509Certificate>/',$xmlDoc,$matches);
// $matches[0] contiene l'array con il match completo compreso del tag X509Certificate
// $matches[1] contiene l'array con il match relativo alla sotto espressione (quella dentro le parentesi)
foreach($matches[1] as $key => $cert) {
	echo "-----BEGIN CERTIFICATE-----" . PHP_EOL;
        echo chunk_split($cert,64,PHP_EOL);
	echo "-----END CERTIFICATE-----" . PHP_EOL;
}
/*
foreach($xmlDoc->getDocNamespaces() as $strPrefix => $strNamespace) {
  if(strlen($strPrefix)==0) {
	  $strPrefix="p7m";
	  $xmlDoc->registerXPathNamespace($strPrefix,$strNamespace);
  }
}
foreach ($xmlDoc->xpath('//p7m:X509Certificate') as $cert) {
	echo "-----BEGIN CERTIFICATE-----" . PHP_EOL;
	echo chunk_split($cert,64,PHP_EOL);
	echo "-----END CERTIFICATE-----" . PHP_EOL;

}
 */
/**
*      Copyright (c) 2019 Enio Carboni - Italy
*
*      This file is part of getTrustCAP7m.
*
*    getTrustCAP7m is free software: you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation, either version 3 of the License, or
*    (at your option) any later version.
*
*    getTrustCAP7m is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License for more details.
*
*    You should have received a copy of the GNU General Public License
*    along with getTrustCAP7m.  If not, see <http://www.gnu.org/licenses/>.
*/
