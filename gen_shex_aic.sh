 #!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---------------------------------------------------+"
echo -e "|    Adversarial Informatics Shellcode Generator    |"
echo -e "|               cygienesolutions.com                |"
echo -e "|       [Usage]: ./gen_shex_aic.sh <BINARYFILE>     |"
echo -e "+---------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo -e "${GREEN}"
    echo -e "[Description]"
    echo -e "Converts a binary file to shellcode."
    echo -e "[Usage]: ./gen_shex_aic.sh <BINARYFILE>"
    echo -e "${NC}"
    echo ""
    exit 1; fi

BINARYFILE=$1

echo -e "${YELLOW}"
echo -e "Generating Shellcode..."
echo -e "${NC}"
for i in $(objdump -d $1 -M intel |grep "^ " |cut -f2); do echo -n '\x'$i; done;echo
#SHELLCODE=$("for i in $(objdump -d $1 -M intel |grep "^ " |cut -f2); do echo -n '\x'$i; done;echo")

echo -e "${GREEN}"
echo "Shellcode Size: $PUB"
echo -e "${NC}"

