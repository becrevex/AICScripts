
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
echo -e "Building Sports Team Index...: "
echo -e "${NC}"

#Baseball
#--------
echo "Atlanta,Georgia Braves" > sports.pw
echo "Miami,Florida Marlins" >> sports.pw
echo "NewYork,NewYork Mets" >> sports.pw
echo "Philadelphia,Pennsylvania Phillies" >> sports.pw
echo "Washington,DC Nationals" >> sports.pw
echo "Chicago,Illinois Cubs" >> sports.pw
echo "Cincinnati,Ohio Reds" >> sports.pw
echo "Milwaukee,Wisconsin Brewers" >> sports.pw
echo "Pittsburgh,Pennsylvania Pirates" >> sports.pw
echo "StLouis,Missouri Cardinals" >> sports.pw
echo "Phoenix,Arizona Diamondbacks" >> sports.pw
echo "Dener,Colorado Rockies" >> sports.pw
echo "LosAngeles,California Dodgers" >> sports.pw
echo "SanDiego,California Padres" >> sports.pw
echo "SanFrancisco,California Giants" >> sports.pw
echo "Baltimore,Maryland Orioles" >> sports.pw
echo "Boston,Massachusetts RedSox" >> sports.pw
echo "NewYork,NewYork Yankees" >> sports.pw
echo "TampaBay,Florida Rays" >> sports.pw
echo "Toronto,Canada BlueJays" >> sports.pw
echo "Chicago,Illinois WhiteSox" >> sports.pw
echo "Cleveland,Ohio Indians" >> sports.pw
echo "Detroit,Michigan Tigers" >> sports.pw
echo "KansasCity,Missouri Royals" >> sports.pw
echo "Minneapolis,Minnesota, Twins" >> sports.pw
echo "Houston,Texas Astros" >> sports.pw
echo "LosAngeles,California Angels" >> sports.pw
echo "Oakland,California Athletics" >> sports.pw
echo "Seattle,Washington Mariners" >> sports.pw
echo "Dallas,Texas Rangers" >> sports.pw
#Football
#--------
echo "Phoenix,Arizona Cardinals" >> sports.pw
echo "Atlanta,Georgia Falcons" >> sports.pw
echo "Baltimore,Maryland Ravens" >> sports.pw
echo "Buffalo,NewYork Bills" >> sports.pw
echo "Charlotte,Carolina Panthers" >> sports.pw
echo "Chicago,Illinois Bears" >> sports.pw
echo "Cincinnati,Ohio Bengals" >> sports.pw
echo "Cleveland,Ohio Browns" >> sports.pw
echo "Dallas,Texas Cowboys" >> sports.pw
echo "Denver,Colorado Broncos" >> sports.pw
echo "Detroit,Michigan Lions" >> sports.pw
echo "GreenBay,Wisconsin Packers" >> sports.pw
echo "Houston,Texas Texans" >> sports.pw
echo "Indianapolis,Indiana Colts" >> sports.pw
echo "Jacksonville,Florida Jaguars" >> sports.pw
echo "KansasCity,Missouri Chiefs" >> sports.pw
echo "Miami,Florida Dolphins" >> sports.pw
echo "Minneapolis,Minnesota Vikings" >> sports.pw
echo "Boston,Massachusetts Patriots" >> sports.pw
echo "NewOrleans,Louisiana Saints" >> sports.pw
echo "NewYork,NewYork Giants" >> sports.pw
echo "NewYork,NewYork Jets" >> sports.pw
echo "Oakland,California Raiders" >> sports.pw
echo "Philadelphia,Pennsylvania Eagles" >> sports.pw
echo "Pittsburgh,Pennsylvania Steelers" >> sports.pw
echo "StLouis,Missouri Rams" >> sports.pw
echo "SanDiego,California Chargers" >> sports.pw
echo "SanFrancisco,California 49ers" >> sports.pw
echo "Seattle,Washington Seahawks" >> sports.pw
echo "TampaBay,Florida Buccaneers" >> sports.pw
echo "Nashville,Tennessee Titans" >> sports.pw
echo "Washington,DC Redskins" >> sports.pw
#Basketball
#----------
echo "Atlanta,Georgia Hawks" >> sports.pw
echo "Boston,Massachusetts Celtics" >> sports.pw
echo "Brooklyn,NewYork Nets" >> sports.pw
echo "Charlotte,Carolina Hornets" >> sports.pw
echo "Chicago,Illinois Bulls" >> sports.pw
echo "Cleveland,Ohio Cavaliers" >> sports.pw
echo "Dallas,Texas Mavericks" >> sports.pw
echo "Denver,Colorado Nuggets" >> sports.pw
echo "Detroit,Michigan Pistons" >> sports.pw
echo "Oakland,California Warriors" >> sports.pw
echo "Houston,Texas Rockets" >> sports.pw
echo "Indianapolis,Indiana Pacers" >> sports.pw
echo "LosAngeles,California Clippers" >> sports.pw
echo "LosAngeles,California Lakers" >> sports.pw
echo "Memphis,Tennessee Grizzlies" >> sports.pw
echo "Miami,Florida Heat" >> sports.pw
echo "Milwaukee,Wisconsin Bucks" >> sports.pw
echo "Minneapolis,Minnesota Timberwolves" >> sports.pw
echo "NewOrleans,Louisiana Pelicans" >> sports.pw
echo "NewYork,NewYork Knicks" >> sports.pw
echo "OklahomaCity,Oklahoma Thunder" >> sports.pw
echo "Orlando,Florida Magic" >> sports.pw
echo "Philadelphia,Pennsylvania 76ers" >> sports.pw
echo "Phoenix,Arizona Suns" >> sports.pw
echo "Portland,Oregon TrailBlazers" >> sports.pw
echo "Sacramento,California Kings" >> sports.pw
echo "SanAntonio,Texas Spurs" >> sports.pw
echo "Toronto,Canada Raptors" >> sports.pw
echo "SaltLakeCity,Utah Jazz" >> sports.pw
echo "Washington,DC Wizards" >> sports.pw
#Hockey
#------
echo "Anaheim,California Ducks" >> sports.pw
echo "Phoenix,Arizona Coyotes" >> sports.pw
echo "Boston,Massachusetts Bruins" >> sports.pw
echo "Buffalo,NewYork Sabres" >> sports.pw
echo "Calgary,Alberta-Canada Flames" >> sports.pw
echo "Charlotte,Carolina Hurricanes" >> sports.pw
echo "Chicago,Illinois Blackhawks" >> sports.pw
echo "Denver,Colorado Avalanche" >> sports.pw
echo "Columbus,Ohio BlueJackets" >> sports.pw
echo "Dallas,Texas Stars" >> sports.pw
echo "Detroit,Michigan Red Wings" >> sports.pw
echo "Edmonton,Alberta-Canada Oilers" >> sports.pw
echo "Miami,Florida Panthers" >> sports.pw
echo "LosAngeles,California Kings" >> sports.pw
echo "Minneapolis,Minnesota Wild" >> sports.pw
echo "Montreal,Quebec-Canada Canadiens" >> sports.pw
echo "Nashville,Tennessee Predators" >> sports.pw
echo "Newark,NewJersey Devils" >> sports.pw
echo "NewYork,NewYork Islanders" >> sports.pw
echo "NewYork,NewYork Rangers" >> sports.pw
echo "Ottawa,Ontario Senators" >> sports.pw
echo "Philadelphia,Pennsylvania Flyers" >> sports.pw
echo "Pittsburgh,Pennsylvania Penguins" >> sports.pw
echo "SanJose,California Sharks" >> sports.pw
echo "StLouis,Missouri Blues" >> sports.pw
echo "TampaBay,Florida Lightning" >> sports.pw
echo "Toronto,Ontario MapleLeafs" >> sports.pw
echo "Vancouver,BritishColumbia-Canada Canucks" >> sports.pw
echo "LasVegas,Nevada GoldenKnights" >> sports.pw
echo "Washington,DC Capitals" >> sports.pw
echo "Winnipeg,Manitoba-Canada Jets" >> sports.pw
echo "Done."

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
	echo -e "${YELLOW}"
	echo -e $team ${#team}
	echo -e "${NC}"
	sum=$(expr ${#team} + 2)
	crunch $sum $sum -t $team%% >> "$FIRSTNAME.pw"
done



echo -e "${YELLOW}"
echo -e "Password Profile Completed."
echo -e "${NC}"
echo -e "${GREEN}"
echo -e "Generated passwords: $(cat $FIRSTNAME.pw | wc -l)"
echo -e "${NC}"



