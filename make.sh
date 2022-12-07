#!/bin/bash
while :; do
    case $1 in
        -c|--cuckoo) cuckoo="cuckoo";;
        -g|--greenbone) greenbone="greenbone";;
        -r|--remnux) remnux="remnux";;
        -t|--thehiveproject) thehiveproject="thp";;
        *) break
    esac
    shift
done
echo $cuckoo $greenbone $remnux $thehiveproject > .vars
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
//   // //      // ////////  //         // "
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
rand=$[$RANDOM % ${#titles[@]}]
echo "

${titles[$rand]}

"
sleep 10
echo "\n\n
  ##########################################################
  ---- Welcome to KASM-Workstation configuration script ----
  ##########################################################"
sleep 2
echo "  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ##########################################################"
echo "  |      Please note the following:                        |"
echo "  |          -> Configuring KASM takes ~10 hours           |"
echo "  |          -> Ensure you have BUILD.md to hand           |"
echo "  |          -> Select the options as instructed           |"
echo "  ##########################################################
"
sleep 2
echo "
      Press ENTER to begin...
"
read input
clear
sudo chmod +x /opt/kasm/kasm/build/*.*
sudo chmod +x /opt/kasm/kasm/build/install/*.*
/opt/kasm/kasm/build/./init.sh