Para el correcto funcionamiento de la ultima versión de Phd, debemos hacer un par de cambios.

En primer lugar ejecutar el archivo 20131031.sql localizado en administrator/components/com_phd/sql, este añadira un campo en la tabla de aplicants y otro en la de degrees.

En segundo lugar, hay que definir un directorio (por ejemplo /var/data/docs_phd) fuera de la parte pública, este debera tener permisos de apache, tal y como si estuviera en la parte www. Una vez hecho esto hay que poner este directorio en la variable Documents path con el path completo [ /var/data/docs_phd/ ] en la configuración del componente. Recordar que la pestaña de menú tambien tiene este campo como opción de configuración.

Por último recordar que para que funcione la generación de zips, Es necsaria la clase ZipArchive class
http://pecl.php.net/package/zip
