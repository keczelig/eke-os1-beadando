#!/bin/bash

#NEPTUNKÓD: GJVTL6

#forras:
# https://linuxzeal.wordpress.com/shell-script/create-menu-in-shell-script/
# http://wttr.in/
# https://rapidapi.com/


show_menus(){
        clear
    echo ""
    echo "MENU "
    echo ""
    echo "1. aktualis idojaras"
    echo "2. arfolyam (API)"
    echo "3. ennyi napos vagy"    
    echo "4. osszeadas gyakorlas"
    echo "5. kilepes"
}

read_options(){
    local choice
    echo ""
    read -p "Melyik legyen?: " choice
    case $choice in
	1) idojaras ;;
	2) arfolyam ;;
	3) napok ;;
    	4) szum ;;
	5) exit 0 ;;
    esac
}


pause(){
    read -p "A folytatashoz nyomd meg az [ENTER] billentyut..." fackEnterKey
}

idojaras(){

echo ""
curl -H "Accept-Language: hu" wttr.in?0
echo ""

pause
}

arfolyam(){
echo ""
echo -n "1 USD = "
curl --request GET \
	--url 'https://currency-exchange.p.rapidapi.com/exchange?to=HUF&from=USD&q=1.0' \
	--header 'x-rapidapi-host: currency-exchange.p.rapidapi.com' \
	--header 'x-rapidapi-key: ae010c6bb8mshfe4aa3841a3214dp169e90jsnc21a8e19abba'
echo " HUF"
echo -n "1 EUR = "
curl --request GET \
	--url 'https://currency-exchange.p.rapidapi.com/exchange?to=HUF&from=EUR&q=1.0' \
	--header 'x-rapidapi-host: currency-exchange.p.rapidapi.com' \
	--header 'x-rapidapi-key: ae010c6bb8mshfe4aa3841a3214dp169e90jsnc21a8e19abba'
echo " HUF"
echo -n "1 CHF = "
curl --request GET \
	--url 'https://currency-exchange.p.rapidapi.com/exchange?to=HUF&from=CHF&q=1.0' \
	--header 'x-rapidapi-host: currency-exchange.p.rapidapi.com' \
	--header 'x-rapidapi-key: ae010c6bb8mshfe4aa3841a3214dp169e90jsnc21a8e19abba'
echo " HUF"
echo "" 
	pause
}

szum(){
echo ""
echo -n "Elso szam:"
read x
echo -n "Masodik szam:"
read y
(( sum=x+y ))
echo -n "A te tipped:"
read tipp

if [ $sum == $tipp  ]
then
echo "Ugyes vagy!"
else
echo "Sajnos nem nyert..."
fi
echo "A megoldas: $sum"
echo ""
pause
}

napok(){
echo ""
echo -n "Add meg a szuletesnapodat ebben a formaban (YYYY-MM-DD)"

read bdate
bdate=`date -d "${bdate}" +"%s"`
current_date=`date +"%s"`
echo ""
echo $(($((bdate - current_date)) / -86400)) 'napos vagy.'
echo ""



pause
}


while true
do
    show_menus
    read_options
done
