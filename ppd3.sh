#remove old file, create a new one, this will hold the users and ppds
rm touch ppds.csv
touch ppds.csv

#For each user, download the profile and extract the user name and ppd
for i in {1..1000};
#We will need cookies containing a valid login to view user profiles
do wget --load-cookies cookies.txt \
     http://www.actuarialoutpost.com/actuarial_discussion_forum/member.php?u=$i
#Extract the user name
ao_user=$(grep "View Profile:" member.php?u=$i | grep -o -P '(?<=Profile: ).*(?=</title>)' | tr -d ',')
#Extract the ppd
ppd=$(grep "Posts Per Day" member.php?u=$i | grep -o '[0-9:]*\.[0-9:]*')
record="$ao_user, $ppd"
#Append the record to the csv file
echo $record >> ppds.csv
rm member.php?u=$i
done;
