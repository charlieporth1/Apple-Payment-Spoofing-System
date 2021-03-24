#!/bin/bash 
#alias pingCmd="curl -fsS --retry 3" 
#pingCmd https://hc-ping.com/6e232e26-e3c0-40fc-8788-ac81cd3b83e0
sudo timedatectl set-ntp on
rm -rf /tmp/space*
curl -fsS --retry 3 https://hc-ping.com/6e232e26-e3c0-40fc-8788-ac81cd3b83e0
export home=/mnt/HDD/ApplePaymentsSpoofing/
export itc=/mnt/HDD/itunes-connect-slack/

export pending="Pending Developer Release"
export ready="Ready for Sale"
export inReview="In Review"
export waiting="Waiting For Review"
export prep="Prepare for Submission"
export rej="Rejected"
export err="Error_getting_app_status"


function logicHandling() {
	export rubyfile=$1
	echo "file: $1"
	export cmdPending=$(sudo ruby $home/$rubyfile | awk '{print $2" "$3" "$4}' | grep -o "$pending")
	export cmdReady=$(sudo ruby $home/$rubyfile| awk '{print $2" "$3" "$4}' | grep -o "$ready")
	export cmdInReview=$(sudo ruby $home/$rubyfile | awk '{print $2" "$3" "$4}' | grep -o "$inReview")
	export cmdWaitingReview=$(sudo ruby $home/$rubyfile | awk '{print $2" "$3" "$4}' | grep -o "$waiting")
	export cmdPrep=$(sudo ruby $home/$rubyfile | awk '{print $2" "$3" "$4}' | grep -o "$prep")
	export cmdRej=$(sudo ruby $home/$rubyfile | awk '{print $2" "$3" "$4}' | grep -o "$rej")
	export cmdErr=$(sudo ruby $home/$rubyfile | awk '{print $2" "$3" "$4}' | grep -o "$err")


	if [ ! -z "$cmdPending" ]; then
		export bool="false"
		export boolNotif="true"
		export appReviewStatus="$pending"

	elif [ ! -z "$cmdReady" ]; then
		export bool="false"
		export boolNotif="true"
		export appReviewStatus="$ready"

	elif [ ! -z "$cmdInReview" ]; then
		export bool="true"
		export boolNotif="false"
		export appReviewStatus="$inReview"

	elif [ ! -z "$cmdWaitingReview" ]; then
		export bool="true"
		export boolNotif="false"
		export appReviewStatus="$waiting"

	elif [ ! -z "$cmdPrep" ]; then 
		export bool="false" 
		export boolNotif="true" 
		export appReviewStatus="$prep" 
		sudo bash /mnt/HDD/Programs/iTunesConnecBuildProcessingDone.sh &

	elif [ ! -z "$cmdRej" ]; then
		export bool="false"
		export boolNotif="true"
		export appReviewStatus="$rej"

	elif [ ! -z "$cmdErr"]; then
		export bool="true" 
		export boolNotif="false"
		export appReviewStatus="$err" 

	# error handling 
	else 
		export bool="false" 
		export boolNotif="true"
		export appReviewStatus="$ready" 

	fi
sudo bash /mnt/HDD/Programs/iTunesConnecBuildProcessingDone.sh & 

} 
logicHandling get-app-status.rb
logicHandling get-app-status-teacher.rb

sleep 60
echo $appReviewStatus 

. /usr/bin/cred.sh
cd  $home
<< --MULTILINE-COMMENT--
export lastStatus=$( cat $home/lastStatus | sed -n '1p' )
if [[ "$appReviewStatus" != "$lastStatus" && "$appReviewStatus" != "$err" ]]; then
cd  $home
echo $bool |  node $home/server.js
echo $bool | npm start
echo "Last Status: $lastStatus"
echo "Current Status: $appReviewStatus"
sendemail -f $USER@otih-oith.us.to -t $phonee  -m "Apple App Store Payment Spoofing: $bool; for Apple App Review Status: $appReviewStatus; Date $(date)"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
sendemail -f $USER@otih-oith.us.to -t 6124836444@tmomail.net  -m "Apple App Store Payment Spoofing: $bool; for Apple App Review Status: $appReviewStatus; Date $(date)"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
echo "$appReviewStatus" > $home/lastStatus
echo "$(date)" >>  $home/lastStatus
curl -fsS --retry 3 https://hc-ping.com/d3050c3c-71a6-4f44-b252-0437c887f133
elif [[  "$appReviewStatus" == "$err" ]]; then
. /usr/bin/cred.sh
sendemail -f $USER@otih-oith.us.to -t $phonee  -m "Apple App Store Payment Spoofing: $err;  for Apple App Review Status: $appReviewStatus; Date $(date): ERROR: $err TAKE ACTION DEFCON 1"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
sendemail -f $USER@otih-oith.us.to -t $phonee  -m "Apple App Store Payment Spoofing: $err;  for Apple App Review Status: $appReviewStatus; Date $(date): ERROR: $err TAKE ACTION DEFCON 1"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
sendemail -f $USER@otih-oith.us.to -t $phonee  -m "Apple App Store Payment Spoofing: $err;  for Apple App Review Status: $appReviewStatus; Date $(date): ERROR: $err TAKE ACTION DEFCON 1"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
sendemail -f $USER@otih-oith.us.to -t 6124836444@tmomail.net   -m "Apple App Store Payment Spoofing: $err;  for Apple App Review Status: $appReviewStatus; Date $(date): ERROR: $err TAKE ACTION DEFCON 1"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
sendemail -f $USER@otih-oith.us.to -t 6124836444@tmomail.net   -m "Apple App Store Payment Spoofing: $err;  for Apple App Review Status: $appReviewStatus; Date $(date): ERROR: $err TAKE ACTION DEFCON 1"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
sendemail -f $USER@otih-oith.us.to -t 6124836444@tmomail.net   -m "Apple App Store Payment Spoofing: $err;  for Apple App Review Status: $appReviewStatus; Date $(date): ERROR: $err TAKE ACTION DEFCON 1"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
else 
echo "nothing changed"
curl -fsS --retry 3 https://hc-ping.com/d3050c3c-71a6-4f44-b252-0437c887f133
fi
--MULTILINE-COMMENT--
#TEACHER

export lastStatusT=$( cat $home/lastStatusT | sed -n '1p' )
if [[ "$appReviewStatusT" != "$lastStatusT" && "$appReviewStatusT" != "$err" ]]; then
cd  $home
echo "$bool $boolPay" | node $home/serverT.js
#echo $bool | echo $boolPay | npm start
echo "Last Status T: $lastStatusT"
echo "Current Status T: $appReviewStatusT"
sendemail -f $USER@otih-oith.us.to -t $phonee  -m "Apple App Store Payment Spoofing: $bool; for Apple App Review Status TEACHER: $appReviewStatus; Date $(date)"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
sendemail -f $USER@otih-oith.us.to -t 6124836444@tmomail.net  -m "Apple App Store Payment Spoofing: $bool; for Apple App Review Status TEACHER: $appReviewStatus; Date $(date)"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
echo "$appReviewStatusT" > $home/lastStatusT
echo "$(date)" >>  $home/lastStatusT
curl -fsS --retry 3 https://hc-ping.com/d3050c3c-71a6-4f44-b252-0437c887f133
elif [[  "$appReviewStatusT" == "$err" ]]; then
. /usr/bin/cred.sh
sendemail -f $USER@otih-oith.us.to -t $phonee  -m "Apple App Store Payment Spoofing: $err;  for Apple App Review Status TEACHER: $appReviewStatus; Date $(date): ERROR: $err TAKE ACTION DEFCON 1"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
sendemail -f $USER@otih-oith.us.to -t $phonee  -m "Apple App Store Payment Spoofing: $err;  for Apple App Review Status TEACHER: $appReviewStatus; Date $(date): ERROR: $err TAKE ACTION DEFCON 1"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
sendemail -f $USER@otih-oith.us.to -t $phonee  -m "Apple App Store Payment Spoofing: $err;  for Apple App Review Status TEACHER: $appReviewStatus; Date $(date): ERROR: $err TAKE ACTION DEFCON 1"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
sendemail -f $USER@otih-oith.us.to -t 6124836444@tmomail.net   -m "Apple App Store Payment Spoofing: $err;  for Apple App Review Status TEACHER: $appReviewStatus; Date $(date): ERROR: $err TAKE ACTION DEFCON 1"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
sendemail -f $USER@otih-oith.us.to -t 6124836444@tmomail.net   -m "Apple App Store Payment Spoofing: $err;  for Apple App Review Status TEACHER: $appReviewStatus; Date $(date): ERROR: $err TAKE ACTION DEFCON 1"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
sendemail -f $USER@otih-oith.us.to -t 6124836444@tmomail.net   -m "Apple App Store Payment Spoofing: $err;  for Apple App Review Status TEACHER: $appReviewStatus; Date $(date): ERROR: $err TAKE ACTION DEFCON 1"   -s smtp.gmail.com:587 -o tls=yes -xu $usr -xp  $passwd
else 
echo "nothing changed"
curl -fsS --retry 3 https://hc-ping.com/d3050c3c-71a6-4f44-b252-0437c887f133
fi

