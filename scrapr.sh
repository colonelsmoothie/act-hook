### Script to download Actuarial Outpost posts 1 thru 100000. To change which posts to download, change the indices of the loop.

for i in {1..100000};
do aria2c http://www.actuarialoutpost.com/actuarial_discussion_forum/showpost.php?p=$i;
mv showpost.php showpost.php.$i;
done;
