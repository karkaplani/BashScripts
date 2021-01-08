#!/bin/bash
#Assignment: Lab8
#Student Name: Abdullah Ilgun
#Student Number: 040991363
#Section: CST8102 324
#Script Name: myscript.sh
#Submission Date: 1.12.2020
#Description: This script provides user a menu for user management. Takes user input letter through A to F and executes different user management commands accordingly. 

#The menu should be displayed once, before getting into the loop.
echo "Choose one of the following options:"
echo "A Create a user account"
echo "B Delete a user account"
echo "C Change supplementary group for a user account"
echo "D Change initial group for a user account"
echo "E Change default login shell for a user account"
echo "F Change account expiration date for a user account"
echo "Q Quit"
echo -e "What would you like to do?: \c " ; read CHOICE

#As long as the choice is Q or q, it keeps executing.
while [ $CHOICE != 'q' ] && [ $CHOICE != 'Q' ]
do 
clear #Clears the screen after a choice is made.
echo You entered: $CHOICE 
sleep 3 
 
    if [[ $CHOICE == 'a' ]] || [[ $CHOICE == 'A' ]] #To create a user account.
    then
	   echo -e "Username: \c " ; read USERNAME 
	   echo -e "Users home directory: \c " ; read HOMEDIRECT
	   echo -e "Deault login shell: \c "; read DEFAULTSHELL
	   sudo useradd -d "$HOMEDIRECT" -m -s "$DEFAULTSHELL" "$USERNAME"
	   echo User $USERNAME successfully added. 

    elif [[ $CHOICE == 'b' ]] || [[ $CHOICE == 'B' ]] #To delete a user account
    then 
           echo -e "Which user do you want to delete?: \c " ; read USERTODELETE
           sudo userdel -r "$USERTODELETE" #Deletes user's home folder as well 
	   echo User $USERTODELETE successfully deleted. 

    elif [[ $CHOICE == 'c' ]] || [[ $CHOICE == 'C' ]] #Changes user's sup group
    then 
           echo -e "Username: \c " ; read CUSERNAME
           echo -e "Supplementary Group Name: \c " ; read GROUPNAME 
           sudo usermod -G "$GROUPNAME" "$CUSERNAME"
	   echo User $CUSERNAME added to $GROUPNAME

    elif [[ $CHOICE == 'd' ]] || [[ $CHOICE == 'D' ]] #Changes initial group
    then 
           echo -e "Username: \c " ; read DUSERNAME
           echo -e "Initial Group Name: \c "; read DGROUPNAME 	   
	   sudo usermod -g "$DGROUPNAME" "$DUSERNAME" 
	   echo Initial group of user $DUSERNAME changed to $DGROUPNAME

    elif [[ $CHOICE == 'e' ]] || [[ $CHOICE == 'E' ]] #Changes user's shell
    then 
	   echo -e "Username: \c " ; read EUSERNAME
           echo -e "Shell Name: \c " ; read SHELLNAME
           sudo usermod -s "$SHELLNAME" "$EUSERNAME"
	   echo Default shell of $EUSERNAME changed to $SHELLNAME

    elif [[ $CHOICE == 'f' ]] || [[ $CHOICE == 'F' ]] #Changes user expiry date
    then 
           echo -e "Username: \c " ; read FUSERNAME 
           echo -e "Expiration Date: \c " ; read EXPDATE
	   sudo usermod -e "$EXPDATE" "$FUSERNAME"
	   echo Expiry date of $FUSERNAME changed to $EXPDATE

    #If choice is not the one of the provided letters in the menu. 	   
    else 
	   echo "Invalid option!" 
    fi

#Menu is displayed again after an operation has done.      
echo "Choose one of the following options:"
echo "A Create a user account"
echo "B Delete a user account"
echo "C Change supplementary group for a user account"
echo "D Change initial group for a user account"
echo "E Change default login shell for a user account"
echo "F Change account expiration date for a user account"
echo "Q Quit"
echo -e "What would you like to do?: \c " ; read CHOICE
done

echo "Bye!"
