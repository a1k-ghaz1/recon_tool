#!/bin/bash

blue=$(tput setaf 4)    #color for blue
red=$(tput setaf 1)     #color for red
yellow=$(tput setaf 3)  #color for yellow
green=$(tput setaf 2)   #color for green
white=$(tput setaf 7)   #color for white
magenta=$(tput setaf 5) #color for magenta
cyan=$(tput setaf 6)     #color for cyan
orange=$(tput setaf 208)

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


while getopts ":d: h:" opt;
do
   case $opt in 

       d)

             domain=$OPTARG
             ;;
       
       h | help )

             echo """${green}$0 [-d Enter your target domain to recon] [-help This will print the usage message and exit] 
      
                                 -d  : To do Recon process for your target website

                                 -help  : This will print the usage message of the script 

                                 By default, outputs are saved in the directory ~/Desktop with the domain name 

             """
             sleep 1
             exit
             ;;

       *) # Invalid option
         
             echo "${red}[!]Invalid option: -$OPTARG"
             echo "${red}[!]Use $0 -help for help"
             exit 1
             ;;
  esac


done

if [ $OPTIND -eq 1 ]; then
  echo "${red}[!]No Arguments are provided"
  echo "${red}[!]To Know usage of  script switch $0 -help "
  exit 1
fi

if [ $domain == "omain" ]; then
  echo "${red}[!]Invalid option --domain"
  echo "${red}[!]To Know usage of  script switch $0 -help "
  exit 1
fi

if [ -z "$domain" ]; then
    echo "${red}[#] Error: No domain name provided for reconnaissance"
    exit 1

else
    sleep 1
    echo "${green}[-] Starting reconnaissance for $domain"
fi

echo "${white}[#] Checking if tools are installed or not.."
sleep 1

tools=("sublist3r" "httprobe" "nmap" "curl" "hydrarecon" "paramspider" "subdomainizer" "subfinder" "waybackurls" "assetfinder" "amass" "httpx" "chaos" "whois" "nslookup" "dnsx" "mapcidr" "ipscraper" "http_sts")

for tool in "${tools[@]}";
do
   if ! command -v "$tool" &> /dev/null;
   then 
       sleep 1
       echo "${red}[-] $tool is not installed.."
       echo "${red}[-] Run the installer shell script again and try manually installing the required tools and check the README.md"
       sleep 3
       exit
   else
       echo "${green}[-] $tool is installed.."
  fi
done

sleep 1

echo "${orange}[#] Reconnaissance process is starting"

sleep 3


if [[ ! -d ~/Desktop/"$domain"_result/hydra_report ]];
then
    mkdir ~/Desktop/"$domain"_result #for saving the results of subdomain enumeration
    echo "${white}[#]Created directory in ~/Desktop/"$domain"_result/hydra_report  to save recon results "
    cd ~/Desktop/"$domain"_result
    mkdir hydra_report
    cd hydra_report
    sleep 1

else
    echo "${green}[#]The direcotry already exist result will be saved in that directory"
    cd ~/Desktop/"$domain"_result/hydra_report
    sleep 1
fi
    

if [[ ! -d ~/Desktop/"$domain"_result/hydra_report/crawler ]];
then
    mkdir ~/Desktop/"$domain"_result/hydra_report/crawler
    cd ~/Desktop/"$domain"_result/hydra_report/crawler
    touch "$domain".urls.txt
    touch js_parser_results.txt
    cd ..
else
    cd ~/Desktop/"$domain"_result/hydra_report/crawler
    if [[ ! -f "$domain".urls.txt && robots_urls.txt && js_parser_result.txt && sitemap_urls.txt ]];
    then
        touch "$domain".urls.txt
        touch js_parser_results.txt
        cd ..
    fi
    
fi

if [[ ! -d ~/Desktop/"$domain"_result/hydra_report/response_body ]];
then
    mkdir ~/Desktop/"$domain"_result/hydra_report/response_body
fi

touch ~/Desktop/"$domain"_result/hydra_report/sublist3r_subdomains.txt

touch ~/Desktop/"$domain"_result/hydra_report/chaos_subdomains.txt

touch ~/Desktop/"$domain"_result/hydra_report/subfinder_subdomains.txt

touch ~/Desktop/"$domain"_result/hydra_report/assetfinder_subdomains.txt

touch ~/Desktop/"$domain"_result/hydra_report/amass_subdomains.txt

touch ~/Desktop/"$domain"_result/hydra_report/hydrarecon_subdomains.txt

touch ~/Desktop/"$domain"_result/hydra_report/subdomainizer_subdomains.txt

touch ~/Desktop/"$domain"_result/hydra_report/all_subdomains.txt

touch ~/Desktop/"$domain"_result/hydra_report/hydrarecon_crawl.txt

touch ~/Desktop/"$domain"_result/hydra_report/paramspider_crawl.txt
xt
touch ~/Desktop/"$domain"_result/hydra_report/waybackurls_crawl.txt

touch ~/Desktop/"$domain"_result/hydra_report/all_crawl.txt

touch ~/Desktop/"$domain"_result/hydra_report/alive_subdomains.txt

touch ~/Desktop/"$domain"_result/hydra_report/nmap_scan_results.txt

touch ~/Desktop/"$domain"_result/hydra_report/httpx_status_code_results.txt

cd ~/Desktop/"$domain"_result/hydra_report

echo """${red}[!]Starting nslookups and whois

=================================================================================================================================================================================================================="""

sleep 2

echo "${green}[-]Doing nslookup and whois for $domain"

nslookup $domain >> "$domain"_lookup.txt

whois $domain >> "$domain"_whois.txt

sleep 2

echo """${green}[-]Finished whois and nslookups

=================================================================================================================================================================================================================="""

echo """${red}[!]Performing Subdomain enumeration for "$domain"

==================================================================================================================================================================================================================="""
sleep 2

sublist3r -d "$domain" -b -v -e baidu,google,yahoo,bing,Ask,Netcraft,Virustotal,DNSdumpster,SSLCertificates,PassiveDNS  -t 15 -o ~/Desktop/"$domain"_result/hydra_report/sublist3r_subdomains.txt 

sleep 1

echo "${green}[-]Subdomain enumeration completed with sublist3r"

sleep 2

echo "${cyan}[-]loading.. Subdomain enumeraion with HydraRecon..."
sleep 2


sleep 1

echo "${orange}[-]Starting Subdomain enumeration results are save in directory ~/Desktop/"$domain"_result/hydra_report "

sleep 1

hydrarecon --basic -d "$domain" -t 1000 -o ~/Desktop/"$domain"_result
 
cd ~/Desktop/"$domain"_result/hydra_report

mv subs."$domain".txt   ~/Desktop/"$domain"_result/hydra_report/hydrarecon_subdomains.txt



sleep 2


echo "${green}[-]Subdomain enumeration completed with HydraRecon.."

sleep 1

echo "${orange}[-]Starting subdomain enumeration with Amass"

amass enum -d "$domain" -v -o amass_subdomains.txt 

echo "${green}[-]Subdomain enumeration completed with Amass"

sleep 1 

echo "${orange}[-]Starting subdomain enumeration with Subfinder"

sleep 1 

subfinder -d "$domain" -v -o subfinder_subdomains.txt

echo "${green}[-]Subdomain enumeration completed with Subfinder"

sleep 1 

echo "${orange}[-]Starting subdomain enumeration with Assetfinder"

assetfinder "$domain" | tee assetfinder_subdomains.txt


echo "${green}[-]Subdomain enumeration completed with Assetfinder"

sleep 1  

echo "${orange}[-]Starting subdomain enumeration with chaos"

chaos -d "$domain" -v -o chaos_subdomains.txt -key  #[!]Enter yout chaos api key for subdomain enumeration

sleep 1

echo "${green}[-]Subdomain enumeration completed with chaos"

sleep 1

echo "${orange}[-]Starting subdomain enumeration with subdomainizer"

sleep 1

subdomainizer -d "$domain" -u "https://"$domain"" -o ~/Desktop/"$domain"_result/hydra_report/subdomainizer_subdomains.txt -sop ~/Desktop/"$domain"_result/hydra_report/subdomainizer_sop.txt

echo  "${green}[-]Finished subdomains enumeration with subdomainizer"

sleep 1

echo "${white}[-]Sorting and listing the unique subdomains..."

sleep 1

sort -u sublist3r_subdomains.txt -o sublist3r_subdomains.txt

sort -u hydrarecon_subdomains.txt -o hydrarecon_subdomains.txt

sort -u subdomainizer_subdomains.txt -o subdomainizer_subdomains.txt

sort -u subfinder_subdomains.txt -o subfinder_subdomains.txt

sort -u assetfinder_subdomains.txt -o assetfinder_subdomains.txt

sort -u amass_subdomains.txt -o amass_subdomains.txt

sort -u chaos_subdomains.txt -o chaos_subdomains.txt

cat sublist3r_subdomains.txt  hydrarecon_subdomains.txt subdomainizer_subdomains.txt  | sort -u > all_subdomains.txt 

cat subfinder_subdomains.txt assetfinder_subdomains.txt amass_subdomains.txt chaos_subdomains.txt | sort -u > all_subdomains.txt

sort -u all_subdomains.txt -o all_subdomains.txt

sleep 3

echo "${white}[-]Sorted and Unique subdomains are saved in all_subdomains.txt"

sleep 1

echo """${green}[-]Subdomain enumeration completed 

========================================================================================================================================================================================================================================"""

sleep 3

cd ~/Desktop/"$domain"_result/hydra_report

echo "${red}[!]Performing nslookup,whois and reverse Dns for found subdomains

=========================================================================================================================================================================================================================================="
ipscraper -l ~/Desktop/"$domain"_result/hydra_report/all_subdomains.txt

echo """${green}[!]Completed the process for all found subdomains

============================================================================================================================================================================================================================================"""

sleep 3

echo """${red}[!]Performing Crawling sites...

=============================================================================================================================================================================================================================================="""

sleep 2

echo "${orange}[-]Crawling sites for "$domain" with Hydrarecon "

sleep 2

hydrarecon --crawl -d "$domain" -t 1000 -o ~/Desktop/"$domain"_result/  #command working 

cd ~/Desktop/"$domain"_result/hydra_report/crawler 

mv "$domain".urls.txt ~/Desktop/"$domain"_result/hydra_report/hydrarecon_crawl.txt

cd ..

sleep 2

echo "${green}[-]Successfully crawled sites with HydraRecon.."

sleep 1

echo "${orange}[-]Crawling sites for "$domain" with ParamSpider"

paramspider -d "$domain" -o ~/Desktop/"$domain"_result/hydra_report/paramspider_crawl.txt

sleep 2

echo "${green}[-]Successfully crawled sites using ParamSpdier.."

sleep 1

echo "${orange}[-]Crawling sites for "$domain" with waybackurls"

waybackurls "$domain" | tee waybackurls_crawl.txt

cd ~/Desktop/"$domain"_result/hydra_report


echo "${orange}Sorting and listing the crawl sites.."

cat hydrarecon_crawl.txt paramspider_crawl.txt waybackurls_crawl.txt| sort -u > all_crawl.txt

sleep 1

echo "${green}[-]Sorted and listed the unique crawl sites in all_crawl.txt"

sleep 1 

echo """${red}[!]Performing to find http status codes

================================================================================================================================================================================================================================================="""

sleep 2

echo "${orange}[-]Checking status code for all_subdomains.txt with httpx"

cat all_subdomains.txt | httpx -o httpx_status_code_results.txt -title -status-code -verbose | tee httpx_status_code_results.txt

echo "${green}[-]successfully found http status code with httpx for all_subdomains"


sleep 1

echo "${orange}[-]Checking status code for all_subdomains.txt with http_sts.sh "

cd ~/Desktop/"$domain"_result/hydra_report

http_sts -l ~/Desktop/"$domain"_result/hydra_report/all_subdomains.txt -o ~/Desktop/"$domain"_result/hydra_report

cd ~/Desktop/"$domain"_result/hydra_report

echo "${green}[-]Successfully found status codes with http_sts.sh"

sleep 2

echo """${green}[-]Porcess finished to find http status codes

==================================================================================================================================================================================================================================================="""



sleep 1

echo """${red}[!]Performing to find alive subdomains

======================================================================================================================================================================================================================================================"""

echo "${orange}[-]Finding alive subdomains for all_subdoamins.txt httprobe"

sleep 2
cd ~/Desktop/"$domain"_result/hydra_report

cat all_subdomains.txt |  httprobe -c 50 -t 2000 | tee -a ~/Desktop/"$domain"_result/hydra_report/alive_subdomains.txt

sleep 2

echo """${green}[-]Successfully found alive subdomains

==========================================================================================================================================================================================================================================================="""

sleep 2

echo """${red}[!]Performing Port scanning and service detetection

=============================================================================================================================================================================================================================================================="""


echo "${orange}[-]Doing a Nmap scan service and detetection for all_subdoamin.txt"

sleep 2

nmap -sV -iL all_subdomains.txt -oN ~/Desktop/"$domain"_result/hydra_report/nmap_scan_results.txt > /dev/null

sleep 1

echo "${green}[-]Nmap scan completed..."

cd ~/recon_tool

echo -e """${white}[#]Compeleted Reconnaisance process and check outputs for ~/Desktop/"$domain"_result/hydra_report and All the best for your bug hunting bruh !

=================================================================================================================================================================================================================================================================""" 

