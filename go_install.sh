#!/bin/bash

blue=$(tput setaf 4)    #color for blue
red=$(tput setaf 1)     #color for red
yellow=$(tput setaf 3)  #color for yellow
green=$(tput setaf 2)   #color for green
white=$(tput setaf 7)   #color for white
magenta=$(tput setaf 5) #color for magenta
cyan=$(tput setaf 6)     #color for cyan
orange=$(tput setaf 208) #color for orange
# Install required tools

sleep 1
echo """${white}
______                       _____           _ 
| ___ \                     |_   _|         | |
| |_/ /___  ___ ___  _ __     | | ___   ___ | |
|    // _ \/ __/ _ \| '_ \    | |/ _ \ / _ \| |
| |\ \  __/ (_| (_) | | | |   | | (_) | (_) | |
\_| \_\___|\___\___/|_| |_|   \_/\___/ \___/|_| [v2.2.1]
                                               
                                               
                            Made by ♥ sanjai kumar @ https://github.com/sanjai-AK47               
                
"""

sleep 2

echo """${green}
======================================================================================================================================================================================================="""

echo """${green}[!]NOTE: This is a important fully automated installation script that requires golang version go1.19.8 or abover version

if it is below version go1.19.8  please download the latest version Manually and add to path

if it is version go1.19.8 or above version no need to worry the script will automatically install the required tools !
                          """


echo """${green}

=========================================================================================================================================================================================================="""

sleep 2

echo "${green}[-]Now your go version will be displayed!"  

sleep 1

go version

sleep 3

echo "${white}[#]Updating your OS"

sudo apt-get -y update &> /dev/null

sleep 1

read -p "[#]This proces will update your system, Do you want to continue the process(yes/no): " ans

if [[ "$ans" == "y" || "$ans" == "Y" || "$ans" == "yes"|| "$ans" == "YES" ]];
then
    echo "${blue}[#]this will upgrade your system.."

    sudo apt-get -y upgrade &> /dev/null

else
    if [[ "$ans" == "n" || "$ans" == "N" || "$ans" == "no"|| "$ans" == "NO" ]];
    then
	    echo "${red}[#]Continuing the process without updating.."

    else
	    echo "${red}[#]Give proper input(yes or no).."
	    sleep 1
   	    exit
    fi
fi  

sleep 1 

echo "${white}[#]Checking for go installed or not !"

if ! command -v "go" &> /dev/null;
then
    echo "${red}[-]Warning: ! go is not installed ..."
    sleep 1 
    echo "${green}[-]Installing go.."
    sudo apt-get -y install golang-go &> /dev/null
    sleep 1 
    echo "${green}[-]Successfully Installed go"
    
else
    echo "${green}[-]go is already installed"
    sleep 2
    read -p "${yellow}[-]Do you want to upgrade go(y/n):" ans

    if [[ "$ans" == "y" || "$ans" == "Y" || "$ans" == "yes"|| "$ans" == "YES" ]];

    then

        echo "${green}[-]Upgrading go.."
        sleep 1
        sudo apt-get -y upgrade golang-go &> /dev/null
        sleep 1 
        echo "${green}[-]Upgraded go successfully.."

    elif [[ "$ans" == "n" || "$ans" == "N" || "$ans" == "no"|| "$ans" == "NO" ]];
    then
        sleep 1
        echo "${red}[-]Warning you may face some issues in installation of required tools"
        sleep 1
        echo "${red}[-]Continuing the process without upgrading"
        sleep 1
    
    else
        echo "${red}[-]Invalid option given by user. give (y or n)"
        sleep 1
        echo "${green}[-]Continuing the process for installation and without upgrading go"

    fi

fi

sleep 2 

echo """${white}[#]Rquired Tools are:
      
      [-]Subfinder
      [-]Assetfinder
      [-]Amass
      [-]Waybackurls
      [-]Httpx
      [-]Httprobe
      [-]dnsx
      [-]mapcidr
      [-]chaos
                         """

sleep 2 

echo """${red}[-]Performing installation processs  for required Tools

========================================================================================================================================================================================================================"""

sleep 2

if ! command -v "subfinder" &> /dev/null;
then

    echo "${green}[!]Installing subfinder"
    sleep 1
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    clear
    cd $HOME/go/bin
    sudo mv subfinder /usr/bin
    echo "${green}[-]checking subfinder installed or not"

    if ! command -v "subfinder" &> /dev/null;
    then
        
        echo "${red}[!]Trying to Install through git"
        cd ~/recon_tool
        git clone https://github.com/projectdiscovery/subfinder.git
        cd subfinder/v2/cmd/subfinder
        go build 
        sudo mv subfinder /usr/local/bin/
        sleep 1
        echo "${green}[!]Process Finished"
    
    else 

        echo "${green}[!]Subfinder successfully installed"
        


    fi

       


else
    echo "${green}[!]Subfinder already installed"


fi

cd ~/recon_tool 

sleep 1

if ! command -v "assetfinder" &> /dev/null;
then

    sleep 1

    echo "${green}[-]Installing Assetfinder"
    cd ~/recon_tool
    sleep 1
    git clone https://github.com/tomnomnom/assetfinder.git &> /dev/null
    cd assetfinder
    go mod  init github.com/tomnomnom/assetfinder
    go build 
    sudo mv assetfinder /usr/local/bin/
    sleep 1
    echo "${green}[!]checking Assetfinder installed"
    
    if ! command -v "assetfinder" &> /dev/null;
    then
        echo "${red}[!]Try to install Assetfinder manually"

    else

        echo "${green}[!]Assetfinder Installed Successfully"
    
    fi

else

    echo "${green}[!]Assetfinder already installed"


fi

cd ~/recon_tool

sleep 1

if ! command -v  "amass" &> /dev/null;
then

    echo "${green}[!]Installing Amass"
    go install -v github.com/owasp-amass/amass/v3/...@master
    clear
    cd $HOME/go/bin
    sudo mv amass /usr/bin
    sleep 1
    echo "${green}[!]Checking amass Installed"

    if ! command -v "amass" &> /dev/null;
    then
        echo "${red}[!]Trying to install Amass through git"
        cd ~/recon_tool
        git clone https://github.com/owasp-amass.git
        cd amass/cmd/amass
        go build 
        sudo mv amass /usr/bin
        cd ~/recon_tool
        echo "${green}[!]Process Finished"

    else

        echo "${red}[!]Try to install Amass manually"

    fi

else

    echo "${green}[!]Amass already installed"


fi

cd ~/recon_tool

sleep 1

if ! command -v "waybackurls" &> /dev/null;
then

    echo "${green}[!]Installing waybackurls"
    go install github.com/tomnomnom/waybackurls@latest
    cd $HOME/go/bin
    sudo mv waybackurls /usr/bin
    clear
    echo "${green}[!]Checking waybackurls installed"

    if ! command -v "waybackurls" &> /dev/null;
    then
        
        echo "${red}[!]Trying to install waybackurls through git"
        cd ~/recon_tool
        git clone https://github.com/tomnomnom/waybackurls.git
        cd waybackurls
        go build
        sudo mv waybackurls /usr/bin
        cd ~/recon_tool
        echo "[!]Process Finished"
    else
      
        echo "${green}[!]Waybackurls successfully installed"
    
    fi


fi 
    
cd ~/recon_tool

sleep 1

if ! command -v "httpx" &> /dev/null;
then

    echo "${green}[!]Installing httpx"
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    cd $HOME/go/bin
    sudo mv httpx /usr/bin
    clear
    echo "${green}[!]Checking httpx installed"
    if ! command -v "httpx" &> /dev/null;
    then
       echo "${red}[!]Trying to install httpx through git"
       cd ~/recon_tool
       git clone https://github.com/projectdiscovery/httpx.git &> /dev/null
       cd httpx/cmd/httpx
       go build 
       sudo mv httpx /usr/bin
       clear
       sleep 1
       echo "${green}[!]Process Finished"

    else

        echo "${green}[!]httpx successfully installed"

    fi

else

    echo "${green}[!]httpx already installed"
fi


cd ~/recon_tool

if ! command -v "httprobe" &> /dev/null;
then
    echo "${green}[!]Installing httprobe"
    go install github.com/tomnomnom/httprobe@latest
    cd $HOME/go/bin
    sudo mv httprobe /usr/bin
    sleep 1
    echo "${green}[!]checking httprobe installed"
    if ! command -v "httprobe" &> /dev/null;
    then
        echo "${red}[!]Trying to install httprobe through"
        cd ~/recon_tool
        git clone https://github.com/tomnomnom/httprobe.git
        cd httprobe
        go build
        sudo mv httprobe /usr/bin
        sleep 1
        echo "${green}[!]Process Finished"

    else

        echo "${green}[!]httprobe successfully installed"
    
    fi

else

    echo "${green}[!]httprobe already installed"
fi

cd ~/recon_tool

if ! command -v "dnsx" &> /dev/null;
then

    echo "${green}[!]Installing dnsx"
    go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
    cd $HOME/go/bin
    sudo mv dnsx /usr/bin
    cd ~/recon_tool
    echo "${green}[!]checking dnsx installd"

    if ! command -v "dnsx" &> /dev/null;
    then

        echo "${red}[!]Trying to install dnsx through git"
        cd ~/recon_tool
        git clone https://github.com/projectdiscovery/dnsx.git
        cd dnsx/cmd/dnsx
        go build
        sudo mc dnsx /usr/bin
        clear
        echo "${green}[!]Process Finished"

    else

        echo "${green}[!]dnsx successfully installed"

    fi

else

    echo "${green}[!]dnsx already installed"

fi

cd ~/recon_tool

if ! command -v "mapcidr" &> /dev/null;
then

    echo "${green}][!]Installing mapcidr"
    go install -v github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest
    cd $HOME/go/bin
    sudo mv mapcidr /usr/bin
    cd ~/recon_tool
    echo "${green}[!]checking mapcidr installed"

    if ! command -v "mapcidr" &> /dev/null;
    then
        cd ~/recon_tool
        echo "${red}[!]Trying to install mapcidr through git"
        git clone https://github.com/projectdiscovery/mapcidr.git
        cd mapcidr/cmd/mapcidr
        go build
        sudo mv mapcidr /usr/bin
        echo "${green}[!]Process Finished"
    
    else

        echo "${green}[!]mapcidr successfully installed"

    fi

else

    echo "${green}[!]mapcidr already installed"



fi


cd ~/recon_tool

if ! command -v "chaos" &> /dev/null;
then
    echo "${green}[!]Installing chaos"
    go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
    cd $HOME/go/bin
    sudo mv chaos /usr/bin
    cd ~/recon_tool
    echo "${green}checking chaos-client installed"

    if ! command -v "chaos" &> /dev/null;
    then
        
        cd ~/recon_tool
        echo "${red}[!]Trying to install chaos-client through git"
        git clone https://github.com/projectdiscovery/chaos-client.git
        cd chaos-client/cmd/chaos
        go build
        sudo mv chaos /usr/bin
        echo "${green}][!]Process Finished"
        echo """${red}[!]Note: Sign up a account in chaos site and get an api key and  Put the chaos api key in main shell script [line 269 in flag -key] to run the chaos with authorization"""

        echo "${red}[!]HERE!:get your api key here! [ https://chaos.projectdiscovery.io/#/ ] "

        sleep 7
    
    else 

        echo "${green}[!]Successfully installed chaos"
        sleep 1
        echo """${red}[!]Note: Sign up a account in chaos site and get an api key and  Put the chaos api key in main shell script [line 269 in flag -key] to run the chaos with authorization"""

        echo "${red}[!]HERE!:get your api key here! [ https://chaos.projectdiscovery.io/#/ ] "

        sleep 7

    fi

else

    echo "${green}chaos is already installed"

    echo """${red}[!]Note: Sign up a account in chaos site and get an api key and  Put the chaos api key in main shell script [line 269 in flag -key] to run the chaos with authorization"""

    echo "${red}[!]HERE!:get your api key here! [ https://chaos.projectdiscovery.io/#/ ] "

    sleep 7

fi

echo """${green}[!]Installation process for required tools are completed

=============================================================================================================================================================================================================================="""
