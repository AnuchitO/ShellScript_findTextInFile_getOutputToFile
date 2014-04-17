#!/bin/sh
pathFile="./ShellScript/"
sourceFile="listOfShellScriptFile.txt"
outputFile="listNameTextInShellScript.txt"
namePackage="namePackageFile.txt"
$(rm -rf "$sourceFile")
$(rm -rf "$outputFile")
echo -n "Processing......"
for fileName in  $(find $pathFile -name "*" -type f)
do
	
	if [ -s $fileName ]
	then {

		pattern=$(echo $pathFile|sed -e 's/\//\\\//g')
		cutPathToFileName=$(echo "$fileName"|sed -e "s/""$pattern""//g")

		for line in $(cat $namePackage) 
		do 
			checkMatch=$(cat $fileName | grep -i "$line" )
			if [ -n "$checkMatch" ]
			then {
				echo "$cutPathToFileName""\t\t$line" >> $outputFile
			}
			else {
				echo -n ""
			} fi
		done 

		echo "$cutPathToFileName" >> $sourceFile
		
	} 
	else {
		echo -n "$fileName file empty"
	} fi
done
echo ""	
echo "Successfull" 
exit 0
