
#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_------------------------------------------------+"
echo -e "|  Adversarial Informatics Combat Password Profiler  |"
echo -e "|             cygienesolutions.com                   |"
echo -e "|        [Usage]: ./gen_pwprofile_aic.sh             |"
echo -e "+----------------------------------------------------+"
echo -e "${NC}"
#if [ $# == 0 ] ; then
#    exit 1; fi

echo -e "${GREEN}"
echo -e "Target's Full name: "
echo -e "${NC}"
read FIRSTNAME
echo -e "${GREEN}"
echo -e "Target's Home state: "
echo -e "${NC}"
read HOMESTATE
#echo -e "Target's City: "
#read CITY
#echo -e "Target's Pet's Name: "
#read PETSNAME
#echo -e "Target's High School: "
#read HIGHSCHOOL
#echo -e "Target's College/Uni: "
#read COLLEGE

echo -- > $FIRSTNAME.pw
for team in $(cat sports.pw | grep $HOMESTATE | awk '{print $2}')
do
	echo $team ${#team}
	sum=$(expr ${#team} + 2)
	crunch $sum $sum -t $team%% >> "$FIRSTNAME.pw"
done



echo -e "${YELLOW}"
echo -e "Password Profile Completed."
echo -e "${NC}"
echo -e "${GREEN}"
echo -e "Generated passwords: $(cat $FIRSTNAME.pw | wc -l)"
echo -e "${NC}"



