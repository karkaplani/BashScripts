#!/bin/bash
#Assignment: Lab9
#Student Name: Abdullah Ilgun
#Student Number: 040991363
#Lab Section: 324
#Script Name: mycalc.sh
#Date: 25.11.2020
#Description: This script is used to do adding or subtraction calculations with two numbers. It works with either three or 
#no parameters passed to the script. If three parameters, gives the result immediately. If there are no parameters, provides 
#a menu to input the numbers as well as the operators, and returns the calculation result. A user can do more than one calculation
#as he wants.  

#Below two methods take two parameters and return either sum or subtraction of them. 
sum() {
    ARG1=$1
    ARG2=$2
    ((SUM=ARG1+ARG2))
    echo "The sum of $ARG1 plus $ARG2 equals $SUM"
}

subtract(){
    ARG1=$1
    ARG2=$2
    ((RESULT=ARG1-ARG2))
    echo "The result of $ARG1 minus $ARG2 equals $RESULT"
}

#This is executed when there is no parameters are passed to the program.
noParameter() {

	REGEX=^[0-9]+$ #Will be used to test if a variable is a number or not throughout the function.

	until [[ $CHOICE == 'X' || $CHOICE == 'x' ]] #If the first input is x or X, terminates the program.
	 do
	 	echo "C) Calculation"
	    echo "X) Exit" 
	    echo -e "Your choice: \c " ; read CHOICE

		while [[ $CHOICE == 'C' || $CHOICE == 'c' ]] #If the first input is c or C, it executes. Otherwise, first menu shows up again.
		do 
		    clear
			echo -e "Please enter an integer number or X to exit: \c " 
		    read FIRSTNUM

			if [[ $FIRSTNUM == 'X' || $FIRSTNUM == 'x' ]] #This statement is used few more times to terminate the program.
			then exit
			fi

			while [[ $FIRSTNUM =~ $REGEX ]] #Tests if the input is a number.
			do
			    clear
				echo "+) Add"
			    echo "-) Subtract"
			    echo "X) Exit"
			    echo -e "Your choice: \c " ; read OPERAND

				if [[ $OPERAND == 'X' || $OPERAND == 'x' ]]
				then exit
				fi

				while [[ $OPERAND == '+' || $OPERAND == '-' ]] #Tests if the input is an allowed operator.
				do
				    clear
					echo -e "Please enter the second number or X to exit: \c "
				    read SECONDNUM

					if [[ $SECONDNUM == 'X' || $SECONDNUM == 'x' ]]
					then exit
					fi

					while [[ $SECONDNUM =~ $REGEX ]]
					do
                        clear  
						if [[ $OPERAND == '+' ]] #Calls the sum function if the operand input is '+' by passing the number inputs.
						then 
							sum $FIRSTNUM $SECONDNUM
							sleep 3 ; clear ; noParameter
						elif [[ $OPERAND == '-' ]] #Calls the subtract function.
						then 
							subtract $FIRSTNUM $SECONDNUM	
							sleep 3 ; clear ; noParameter #Waits three sec, and displays this function again.
						fi
					done
				done
			done
		done
	 done	
	 exit #If the choice input at the first is x or X, terminates the program. 
	 #At first, there's no need for the exit statement, but if the user wants to do another calculation, 
	 #a bug occurs, and to prevent that bug, this exit statement is used. 
}

REGEX=^[0-9]+$ #Will be used to test if the parameters passed to the program are numbers.

if [[ $# -eq 3 ]] && [[ $1 =~ $REGEX ]] && [[ $3 =~ $REGEX ]] #If there are 3 params passed, and first and second params are numbers, this is executed.
then 

	if [ $2 == + ] #Tests if the operator is either + or - and calls the appropriate function accordingly.
	then sum $1 $3
	elif [ $2 == - ]
	then subtract $1 $3
	else echo "You've entered a wrong operator!"
	fi

elif [ $# -eq 0 ] #Executes when there's no parameter is passed. 
then
	 noParameter

else #Executes if the parameter number or types are wrong. 
	echo "Parameter amount or types are wrong!"
fi
