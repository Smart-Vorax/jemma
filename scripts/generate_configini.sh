#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo -e "\nThis script must be called with 2 arguments."
    echo -e "\tSyntax: ./generate_configini.sh <template-file> <plugins-folder>"
    echo -e "\texample: ./scripts/generate_configini.sh ./scripts/config.ini.template release/plugins/"
    echo -e "\n"
    exit
fi

ls $2 > /dev/null

if [ $? -eq 0 ]; then
	DATE=`date +%Y%m%d%H%M`
	WHOAMI=`whoami`
    echo "#Configuration file generated by $WHOAMI on $DATE"
else
    echo -e "\nPlugin folder $2 is probably wrong\n"
    exit
fi

while read LINE; do
	if [ "$LINE" == "CONFIG-INI-TEMPLATE-PUT-PLUGINS_HERE" ]
	then
		echo -n "osgi.bundles="
		for x in `ls $2`;
		do
		        echo "plugins/$x@start,\\"
		done
	else
		echo "$LINE"
	fi

  
done < $1




