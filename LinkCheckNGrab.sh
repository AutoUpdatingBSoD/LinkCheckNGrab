################################
# 08/06/2018 - Michael Hammond #
# Automated Link Check-n-Grab  #
# LinkCheckNGrab.sh            #
# Web and Mobile Technologies  #
# Radford University           #
#                              #
# This is a Linux shell script #
# intended to be run in a      #
# Virtual Machine while        #
# leaving the guest machine    #
# alone.                       #              
#                              #
# This script feeds redirects  #
# from a file to the Firefox   #
# Browser in a loop and stores #
# the results of the source    #
# URLs provided in a csv file. #
#                              #
# The Linux machine running    #
# this must have xdotool,      #
# MySql, xclip, wmctrl, and    #
# the Firefox browser          #
# installed.                   #
#                              #
# For more information, refer  #
# to the attached README       #
# document.                    #
################################

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    less -FX "README.txt" # display README for help.
    exit 0
fi

fi 
readonly prefix="Redirect 301 "
# Save the prefix as a variable to be stripped.
# the prefix is readonly since it's never written to.
readonly URL="https://www.google.com"
# This readonly variable is the variable used to let the program
# know what domain to start from.
while IFS='' read -r line; do #while hasnextline
{
    direct=${line#"$prefix"} 
    # save next line stripped of prefix
    source="$(cut -d' ' -f1 <<< $direct)"
    # get part 1 of stripped next line, save as source
    dest="$(cut -d' ' -f2 <<< $direct)"
    # get part 2 of stripped next line, save as destination 
    path=$(curl -Ls -o /dev/null -w %{url_effective} "$URL$source")
    echo $path
    # paste url to variable
    if [[ "$path" = "$URL$dest" ]]; then # If the URLs are an exact match
    {
        echo "$URL$source, $URL$dest, " >> "/outfiles/result-conf.csv"
    }
    else
    {
        echo "$URL$source, $URL$dest, $path" >> "/outfiles/result-conf.csv"
    }
    fi;
    sleep 5
    # sleep to give curl time to reload.
}
done < "configtext.txt" # file to loop through
