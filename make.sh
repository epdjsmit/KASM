#!/bin/bash
while :; do
  case $1 in
      -r|--remnux) remnux="remnux";;
      -c|--cuckoo) cuckoo="cuckoo";;
      -t|--thehiveproject) thehiveproject="thp";;
      -g|--greenbone) greenbone="greenbone";;
      *) break
  esac
  shift
done
echo $remnux $cuckoo $thehiveproject $greenbone > .vars
clear
sleep 2
titles[0]="
     **   **     **      ******** ****     ****
    /**  **     ****    **////// /**/**   **/**
    /** **     **//**  /**       /**//** ** /**
    /****     **  //** /*********/** //***  /**
    /**/**   **********////////**/**  //*   /**
    /**//** /**//////**       /**/**   /    /**
    /** //**/**     /** ******** /**        /**
    //   // //      // ////////  //         // 
"
titles[1]="
    ><<   ><<        ><         ><< <<  ><<       ><<
    ><<  ><<        >< <<     ><<    ><<>< ><<   ><<<
    ><< ><<        ><  ><<     ><<      ><< ><< > ><<
    >< ><         ><<   ><<      ><<    ><<  ><<  ><<
    ><<  ><<     ><<<<<< ><<        ><< ><<   ><  ><<
    ><<   ><<   ><<       ><< ><<    ><<><<       ><<
    ><<     ><<><<         ><<  ><< <<  ><<       ><<
"
titles[2]="
    _|    _|     _|_|       _|_|_|   _|      _|  
    _|  _|     _|    _|   _|         _|_|  _|_|  
    _|_|       _|_|_|_|     _|_|     _|  _|  _|  
    _|  _|     _|    _|         _|   _|      _|  
    _|    _|   _|    _|   _|_|_|     _|      _|  
"
titles[3]="
     _        _______  _______  _______ 
    | \    /\(  ___  )(  ____ \(       )
    |  \  / /| (   ) || (    \/| () () |
    |  (_/ / | (___) || (_____ | || || |
    |   _ (  |  ___  |(_____  )| |(_)| |
    |  ( \ \ | (   ) |      ) || |   | |
    |  /  \ \| )   ( |/\____) || )   ( |
    |_/    \/|/     \|\_______)|/     \|
"
titles[4]="
                ___                       
    _-_-,      -   -_,   -_-/    /\\\\,/\\\\, 
      // ,    (  ~/||   (_ /    /| || ||  
      ||/\\\\   (  / ||  (_ --_   || || ||  
     ~|| <     \/==||    --_ )  ||=|= ||  
      ||/\\\\    /_ _||   _/  )) ~|| || ||  
     _-__,\\\\, (  - \\\\, (_-_-    |, \\\\,\\\\, 
                               _-         
"
titles[5]="
         ___           ___           ___           ___     
        /|  |         /\\  \\         /\\__\\         /\\  \\    
       |:|  |        /::\\  \\       /:/ _/_       |::\\  \\   
       |:|  |       /:/\\:\\  \\     /:/ /\\  \\      |:|:\\  \\  
     __|:|  |      /:/ /::\\  \\   /:/ /::\\  \\   __|:|\\:\\  \\ 
    /\\ |:|__|____ /:/_/:/\\:\\__\\ /:/_/:/\\:\\__\\ /::::|_\\:\\__\\
    \\:\\/:::::/__/ \\:\\/:/  \\/__/ \\:\\/:/ /:/  / \\:\\~~\\  \\/__/
     \\::/~~/~      \\::/__/       \\::/ /:/  /   \\:\\  \\      
      \\:\\~~\\        \\:\\  \\        \\/_/:/  /     \\:\\  \\     
       \\:\\__\\        \\:\\__\\         /:/  /       \\:\\__\\    
        \\/__/         \\/__/         \/__/         \\/__/    
"
titles[6]="
    =========================================
    =  ====  =====  ======      ===  =====  =
    =  ===  =====    ====  ====  ==   ===   =
    =  ==  =====  ==  ===  ====  ==  =   =  =
    =  =  =====  ====  ===  =======  == ==  =
    =     =====  ====  =====  =====  =====  =
    =  ==  ====        =======  ===  =====  =
    =  ===  ===  ====  ==  ====  ==  =====  =
    =  ====  ==  ====  ==  ====  ==  =====  =
    =  ====  ==  ====  ===      ===  =====  =
    =========================================
"
random=$[$RANDOM % ${#titles[@]}]
printf "\n\n  \033[1;33mWelcome to\033[0m\n\n\033[1;34m${titles[$random]}\033[0m\n\n                                              \033[1;33mconfiguration script\033[0m\n"
sleep 4
printf "\n  ###################################################\n  |   \033[1;33mPlease note the following:\033[0m                    |\n  |       -> \033[1;33mConfiguring KASM takes ~10 hours\033[0m       |\n  |       -> \033[1;33mEnsure you have BUILD.md to hand\033[0m       |\n  |       -> \033[1;33mSelect the options as instructed\033[0m       |\n  ###################################################\n"
sleep 2
echo "
    Press ENTER to begin...
"
read input
clear
sudo chmod +x /opt/kasm/kasm/build/*.*
sudo chmod +x /opt/kasm/kasm/build/install/*.*
/opt/kasm/kasm/build/./build.sh