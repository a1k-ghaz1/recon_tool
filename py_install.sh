#!/bin/bash

blue=$(tput setaf 4)    #color for blue
red=$(tput setaf 1)     #color for red
yellow=$(tput setaf 3)  #color for yellow
green=$(tput setaf 2)   #color for green
white=$(tput setaf 7)   #color for white
magenta=$(tput setaf 5) #color for magenta
cyan=$(tput setaf 6)     #color for cyan
orange=$(tput setaf 208) #color for orange

clear

echo """${white}

______                       _____           _ 
| ___ \                     |_   _|         | |
| |_/ /___  ___ ___  _ __     | | ___   ___ | |
|    // _ \/ __/ _ \| '_ \    | |/ _ \ / _ \| |
| |\ \  __/ (_| (_) | | | |   | | (_) | (_) | |
\_| \_\___|\___\___/|_| |_|   \_/\___/ \___/|_| [v2.2.1]
                                               
                                               
                            Made by ♥ sanjai kumar @ https://github.com/sanjai-AK47               
                
"""



echo "${white}[#]Updating your OS!"

sleep 5
sudo apt-get -y update &> /dev/null

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

sleep 2
echo "${white}[#]Installing and upgrading pip"

if ! command -v "pip" &> /dev/null;
then
    echo "${red}[-]Warning: ! pip is not installed ..."
    sleep 1 
    echo "${green}[-]Installing pip.."
    sudo apt-get -y install python3-pip &> /dev/null
    sleep 1 
    echo "${green}[-]Successfully Installed pip"
    
else
    echo "${green}[-]Pip is already installed"
    sleep 2
    read -p "${yellow}[-]Do you want to upgrade pip(y/n):" ans

    if [[ "$ans" == "y" || "$ans" == "Y" || "$ans" == "yes"|| "$ans" == "YES" ]];

    then

        echo "${green}[-]Upgrading pip.."
        sleep 1
        sudo apt-get -y upgrade python3-pip &> /dev/null
        sleep 1 
        echo "${green}[-]Upgraded pip successfully.."

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
        echo "${green}[-]Continuing the process for installation and didn't upgrading pip"

    fi

fi


sleep 2

echo "${white}[#]Installing and upgrading the git"


if ! command -v "git" &> /dev/null;
then
    echo "${red}[-]! git is not installed ..."
    sleep 1 
    echo "${green}[-]Installing git.."
    sudo apt-get -y install git &> /dev/null
    sleep 1 
    echo "${green}[-]Successfully Installed git"
    
else
    echo "${green}[-]git is already installed"
    sleep 2
    read -p "${yellow}[-]Do you want to upgrade git(y/n):" ans

    if [[ "$ans" == "y" || "$ans" == "Y" || "$ans" == "yes"|| "$ans" == "YES" ]];

    then

        echo "${green}[-]Upgrading git.."
        sleep 1
        sudo apt-get -y upgrade git &> /dev/null
        sleep 1 
        echo "${green}Upgraded git successfully.."

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
        echo "${green}[-]Continuing the process for installation and didn't upgrading git"
        
    fi

fi


sleep 2



echo """
"""
sleep 1

echo "${orange}[#]Checking for required tools.."

sleep 3

echo """${white}[#]Rquired Tools are:
      
      [-]Sublist3r 
      [-]HydraRecon
      [-]Nmap
      [-]Paramspider
      [-]curl  
      [-]SubDomainizer 
      [-]nslookup
      [-]whois
      [-]ipscraper
      [-]http_sts
                         """

sleep 2
      
echo "${red}[!]Performing Installation for required tools

================================================================================================================================================================================================================= "

sleep 2

if [ ! -d ~/recon_tool/Sublist3r ];
then
    echo "${white}[-]Installing Sublist3r"
    git clone https://github.com/aboul3la/Sublist3r.git &> /dev/null
    cd ~/recon_tool/Sublist3r
    sudo pip install -r requirements.txt &> /dev/null
    sleep 1
    echo "${green}[-]Successfully Installed Sublist3r"
    echo "${white}[-]Making Paramspider as command"
    sleep 1
    cd /usr/local/bin
    sudo ln -s ~/recon_tool/Sublist3r/sublist3r.py sublist3r
    chmod +x sublist3r
    cd ~/recon_tool
    sleep 1
    echo "${green}Successfuuly maked Sublist3r as command"
else
    echo "${white}[-]Sublist3r already Installed and checking whether it as command"
    if ! command -v "sublist3r" &> /dev/null;
    then
        echo "${red}[-]Since it is not a command and now making it as command please wait"
        cd /usr/local/bin
        sudo ln -s ~/recon_tool/Sublist3r/sublist3r.py paramspider
        chmod +777 sublist3r
        cd ~/recon_tool
        sleep 1
        echo "${green}[-]Successfully created command Sublist3r" 
    else
        echo "${green}[-]Sublist3r is already a command"
    fi
fi



if ! command -v "nmap" &> /dev/null;
then
    echo "${white}[-]Installing Nmap.."
    sleep 1
    sudo pip install python-nmap &> /dev/null && sudo pip install --upgrade python3-nmap &> /dev/null
    sudo pip install nmap &> /dev/null && sudo pip install --upgrade python3-nmap &> /dev/null
    sudo pip install python-nmap &> /dev/null && sudo pip install --upgrade nmap &> /dev/null
    sudo pip install nmap &> /dev/null && sudo pip install --upgrade nmap &> /dev/null
    sleep 1
    echo "${green}[-]Successfully Installed Nmap.."
else
    echo "${magenta}[-]Nmap already Installed.."
fi

if ! command -v "curl" &> /dev/null;
then
    echo "${white}[-]Installing curl command.."
    sleep 2
    sudo apt-get -y install curl &> /dev/null && sudo apt-get -y install --upgrade curl &> /dev/null
    sleep 1
    echo "${green}[-]Successfully Installed curl.."
else
    echo "${yellow}[-]Curl already Installed.."
fi

if [ ! -d ~/recon_tool/HydraRecon ];
then
    echo "${white}[-]Installing Hydrarecon"
    git clone https://github.com/aufzayed/HydraRecon.git  &> /dev/null
    cd HydraRecon
    sudo pip install -r requirements.txt &> /dev/null
    echo "${white}[-]Making HydraRecon as command ..please wait"
    cd /usr/local/bin
    sudo ln -s ~/recon_tool/HydraRecon/hydrarecon.py hydrarecon
    chmod +777 hydrarecon
    cd ~/recon_tool
    echo "${green}[-]Sucessfully Installed HydraRecon and maked as command"
    sleep 3
else
    echo "${blue}[-]Hydrarecon already Installed and checking whether it is a command"
    sleep 1
    if ! command -v hydrarecon &> /dev/null;
    then
        echo "${red}[-]Since it is not a command and now making it as command please wait"
        cd /usr/local/bin
        sudo ln -s ~/recon_tool/HydraRecon/hydrarecon.py hydrarecon
        chmod +777 hydrarecon
        cd ~/recon_tool
        echo "${green}[-]Successfully created command hydrarecon"
    else
        sleep 1
        
        echo "${green}[-]hydrarecon is already a command"
        
    fi
        
    
    sleep 3
fi



if [ ! -d ~/recon_tool/ParamSpider ];
then
    echo "${white}[-]Installing Paramspider"
    git clone https://github.com/devanshbatham/ParamSpider &> /dev/null
    cd ~/recon_tool/ParamSpider
    sudo pip install -r requirements.txt &> /dev/null
    sleep 1
    echo "${green}[-]Successfully Installed ParamSpider"
    echo "${white}[-]Making Paramspider as command"
    sleep 1
    cd /usr/local/bin
    sudo ln -s ~/recon_tool/ParamSpider/paramspider.py paramspider
    chmod +x paramspider
    cd ~/recon_tool
    sleep 1
    echo "${green}Successfuuly maked paramspider as command"
else
    echo "${white}[-]Paramspider already Installed and checking whether it as command"
    if ! command -v paramspider &> /dev/null;
    then
        echo "${red}[-]Since it is not a command and now making it as command please wait"
        cd /usr/local/bin
        sudo ln -s ~/recon_tool/ParamSpider/paramspider.py paramspider
        chmod +777 paramspider
        cd ~/recon_tool
        sleep 1
        echo "${green}[-]Successfully created command paramspider" 
    else
        echo "${green}[-]paramspider is already a command"
    fi
fi
    

if [ ! -d ~/recon_tool/SubDomainizer ];
then
    echo "${white}[-]Installing SubDomainizer"
    git clone https://github.com/nsonaniya2010/SubDomainizer.git  &> /dev/null
    cd SubDomainizer
    sudo pip install -r requirements.txt &> /dev/null
    echo "${white}[-]Making SubDomainizer as command ..please wait"
    cd /usr/local/bin
    sudo ln -s ~/recon_tool/SubDomainizer/SubDomainizer.py subdomainizer
    chmod +777 subdomainizer
    cd ~/recon_tool
    ch
    echo "${green}[-]Sucessfully Installed SubDomainizer and maked as command"
    sleep 3
else
    echo "${blue}[-]SubDomainizer already Installed and checking whether it is a command"
    sleep 1
    if ! command -v subdomainizer &> /dev/null;
    then
        echo "${red}[-]Since it is not a command and now making it as command please wait"
        cd /usr/local/bin
        sudo ln -s ~/recon_tool/SubDomainizer/SubDomainizer.py subdomainizer
        chmod +777 subdomainizer
        cd ~/recon_tool
        echo "${green}[-]Successfully created command SubDomainizer as command"
    else
        sleep 1
        
        echo "${green}[-]SubDomainizer is already a command"
        
    fi
        
    
    sleep 3
fi

sleep 2

chmod +xxx main.sh




if ! command -v "http_sts" &> /dev/null;
then
    echo "${red}[!]Note making http_sts script as command"
    chmod +xxx http_sts
    sudo mv http_sts /usr/bin
    echo "${green}[!]Checking http_sts maked as command"
    if ! command -v "ipscraper" &> /dev/null;
    then
        echo "${red}[!]Please make the ipscraper shell script manually as command: sudo mv http_sts /usr/bin "
    else
        echo "${green}[!]Successfully installed http_sts"

    fi

else

    echo "${green}[!]Already installed  http_sts"

fi


if ! command -v "ipscraper" &> /dev/null;
then
    echo "${red}[!]Note making ipscraper script as command"
    chmod +xxx ipscraper
    sudo mv ipscraper /usr/bin
    echo "${green}[!]Checking http_sts maked as command"
    if ! command -v "ipscraper" &> /dev/null;
    then
        echo "${red}[!]Please make the ipscraper shell script manually as command: sudo mv ipscraper /usr/bin "
    else
        
        echo "${green}[!]Successfully installed ipscraper"
    fi

else    

    echo "${green}[!]Already installed ipscraper"

fi

if ! command -v "nslookup" &> /dev/null;
then
    echo "${red}[!]Install the dnsutils "
    sudo apt-get install dnsutils &> /dev/null
else

    echo "${green}[!]nslookup already installed"

fi

if ! command -v "whois" &> /dev/null;
then
    echo "${red}[!]Installing whois"
    sudo apt-get -y install whois &> /dev/null
    echo "${green}[!]Installed whois"
else

    echo "${green}[!]whois already installed"

fi
sleep 1

echo """${green}[!]Installation of tools completed

=========================================================================================================================================================================================================="""

sleep 5
clear


echo """${white}

______                       _____           _ 
| ___ \                     |_   _|         | |
| |_/ /___  ___ ___  _ __     | | ___   ___ | |
|    // _ \/ __/ _ \| '_ \    | |/ _ \ / _ \| |
| |\ \  __/ (_| (_) | | | |   | | (_) | (_) | |
\_| \_\___|\___\___/|_| |_|   \_/\___/ \___/|_| [v2.2.1]
                                               
                                               
                            Made by ♥ sanjai kumar @ https://github.com/sanjai-AK47               
                
"""

sleep 3

echo """${white}[#]Installation completed for required Tools:

      [-]Sublist3r 
      [-]HydraRecon
      [-]Nmap
      [-]Paramspider
      [-]curl  
      [-]SubDomainizer  
      [-]nslookup
      [-]whois
      [-]ipscraper
      [-]http_sts


                        """
echo """${red}[-]Note:[!]You should not Delete any directory or file of tools in recon_tool directory that will cause the symplink error and 

                if you have any error in installation try to install the requred tool manually and make as command in Terminall to use
           
===================================================================================================================================================================================================================================================="""

       
