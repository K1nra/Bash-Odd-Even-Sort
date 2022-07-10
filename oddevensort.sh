#!/bin/bash
#
# Before you add this code to yours, make sure to change any occuration of "myArray" by the array you need to apply the sorting to
# Can be done easily in Visual Studio Code with CTRL + SHIFT + H 
#

function swapValues { #Swap the values of the two inputs Takes two arguments : $1 First position, $2 Second position. Saves the first position in $temp
    temp=${myArray[$1]}
    myArray[$1]=${myArray[$2]}
    myArray[$2]=$temp
}

gate=0
while (( gate == 0 )) #While loop which ends when both of the "For" loops doesn't find any change to make in their scope (which means the array is sorted)
do
    gate=1
    for ((i=1;i<$((${#myArray[@]}-1)); i+=2)) #Odd Loop
    do
        if [[ "${myArray[$i]}" -gt "${myArray[$(($i+1))]}" ]]; then
            swapValues "$i" "(($i+1))"
            gate=0
        fi
    done
    for ((i=0;i<$((${#myArray[@]}-1)); i+=2)) #Even Loop
    do
        if [[ "${myArray[$i]}" -gt "${myArray[$(($i+1))]}" ]]; then
            swapValues "$i" "(($i+1))"
            gate=0
        fi
    done   
done
