#!/bin/bash

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
API_KEY="ae010c6bb8mshfe4aa3841a3214dp169e90jsnc21a8e19abba"
API_HOST="currency-exchange.p.rapidapi.com"
quantity=1
from1=USD
from2=EUR
from3=CHF
to=HUF

function exchange1() {
    echo ""
    local API_URL="https://currency-exchange.p.rapidapi.com/exchange?q=1&from=$from1&to=$to"
    local rate=$(curl -s --request GET --url $API_URL --header "x-rapidapi-host: $API_HOST" --header "x-rapidapi-key: $API_KEY")
    local result=$(echo "$rate * $quantity" | bc)
    echo $quantity $from1 = $result $to
    
    local API_URL="https://currency-exchange.p.rapidapi.com/exchange?q=1&from=$from2&to=$to"
    local rate=$(curl -s --request GET --url $API_URL --header "x-rapidapi-host: $API_HOST" --header "x-rapidapi-key: $API_KEY")
    local result=$(echo "$rate * $quantity" | bc)
    echo $quantity $from2 = $result $to

    local API_URL="https://currency-exchange.p.rapidapi.com/exchange?q=1&from=$from3&to=$to"
    local rate=$(curl -s --request GET --url $API_URL --header "x-rapidapi-host: $API_HOST" --header "x-rapidapi-key: $API_KEY")
    local result=$(echo "$rate * $quantity" | bc)
    echo $quantity $from3 = $result $to
    echo ""

}
    exchange1
	pause
}

datum(){

    date
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
