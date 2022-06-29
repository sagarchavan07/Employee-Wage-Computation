WAGE_PER_HOUR=20
FULL_DAY_HOURS=8
PART_TIME_HOUR=4
MAX_WORKING_DAYS=20

day=1
totalWage=0
totalWorkHours=0

function getAttendance(){
	attendance=$((RANDOM%3))
}

declare -A dailyWage

for((i=1; i<=$MAX_WORKING_DAYS; i++))
do
	getAttendance
	
	case $attendance in
	0) wage=0	
		;;
	1) wage=$(($PART_TIME_HOUR*$WAGE_PER_HOUR))
		totalWorkHours=$(($totalWorkHours+$PART_TIME_HOUR))
		;;
	2)	wage=$(($FULL_DAY_HOURS*$WAGE_PER_HOUR))
		totalWorkHours=$(($totalWorkHours+$FULL_DAY_HOURS))
		;;
	esac
	dailyWage["Day"$i]=$wage
	totalWage=$(($totalWage+$wage))
done

echo "daily wage : " ${dailyWage[@]}

echo "totalWorkHours : " $totalWorkHours
echo "total wage : " $totalWage
