#!/bin/bash
#Name: Abdullah Ilgun
#Number: 040991363
#Course: CST8102
#Section: 320
#Description: This scripts takes the student grades as inputs, calculates and provides the average grade letter(A,B,C,D,F).

#These commands prompt user to add the marks. 
echo -e "Enter the assignment mark(0-40): \c "; read ASSIGNMENT
echo -e "Enter test 1 mark(0-15): \c "; read TEST1
echo -e "Enter test 2 mark(0-15): \c "; read TEST2
echo -e "Enter final exam mark(0-30): \c "; read FINALTEST

#Summing all the grades, and assigning to the TOTALGRADE variable.
((TOTALGRADE=$ASSIGNMENT+$TEST1+$TEST2+$FINALTEST))

#These if statments determine what is the letter equivalent of the users total grade.
if [ $TOTALGRADE -ge 90 -a $TOTALGRADE -le 100 ]
then FINALGRADE=A+
elif [ $TOTALGRADE -ge 85 -a $TOTALGRADE -le 89 ]
then FINALGRADE=A
elif [ $TOTALGRADE -ge 80 -a $TOTALGRADE -le 84 ] 
then FINALGRADE=A-
elif [ $TOTALGRADE -ge 77 -a $TOTALGRADE -le 79 ]
then FINALGRADE=B+
elif [ $TOTALGRADE -ge 73 -a $TOTALGRADE -le 76 ]
then FINALGRADE=B
elif [ $TOTALGRADE -ge 70 -a $TOTALGRADE -le 72 ]
then FINALGRADE=B-
elif [ $TOTALGRADE -ge 67 -a $TOTALGRADE -le 69 ]
then FINALGRADE=C+
elif [ $TOTALGRADE -ge 63 -a $TOTALGRADE -le 66 ]
then FINALGRADE=C
elif [ $TOTALGRADE -ge 60 -a $TOTALGRADE -le 62 ]
then FINALGRADE=C-
elif [ $TOTALGRADE -ge 57 -a $TOTALGRADE -le 59 ]
then FINALGRADE=D+
elif [ $TOTALGRADE -ge 53 -a $TOTALGRADE -le 56 ]
then FINALGRADE=D
elif [ $TOTALGRADE -ge 50 -a $TOTALGRADE -le 52 ]
then FINALGRADE=D-
elif [ $TOTALGRADE -ge 0 -a $TOTALGRADE -le 49 ]
then FINALGRADE=F
fi

#Printing user's total and final (letter) grade in a new line. 
echo -e  "\nYour final numeric grade is $TOTALGRADE, and your final letter grade is $FINALGRADE."	








