#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

INPUT=$1
if [[ -z "$1" ]]
 then
    echo "Please provide an element as an argument."
fi

NAMETEST=$($PSQL "SELECT name FROM elements WHERE name='$INPUT'")
SYMBOLTEST=$($PSQL "SELECT symbol FROM elements WHERE symbol='$INPUT'")
ANTEST=""

if [[ $INPUT =~ ^[0-9]+$ ]]
then
ANTEST=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number='$INPUT'")
fi

#atomic_number
if ! [[ -z $NAMETEST ]]
then
AN=$($PSQL "SELECT atomic_number FROM elements WHERE name='$INPUT'")
NAME=$($PSQL "SELECT name FROM elements WHERE name='$INPUT'")
SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name='$INPUT'")
COMMODITY=$($PSQL "SELECT commodity FROM properties WHERE atomic_number=$AN")
AM=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$AN")
MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$AN")
BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$AN")

echo "The element with atomic number $AN is $NAME ($SYMBOL). It's a $COMMODITY, with a mass of $AM amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
fi

#symbol
if ! [[ -z $SYMBOLTEST ]]
then

AN=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$INPUT'")
NAME=$($PSQL "SELECT name FROM elements WHERE symbol='$INPUT'")
SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol='$INPUT'")
COMMODITY=$($PSQL "SELECT commodity FROM properties WHERE atomic_number=$AN")
AM=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$AN")
MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$AN")
BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$AN")

echo "The element with atomic number $AN is $NAME ($SYMBOL). It's a $COMMODITY, with a mass of $AM amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."


fi


#name
if ! [[ -z $ANTEST ]]
then

AN=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number='$INPUT'")
NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number='$INPUT'")
SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number='$INPUT'")
COMMODITY=$($PSQL "SELECT commodity FROM properties WHERE atomic_number=$AN")
AM=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$AN")
MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$AN")
BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$AN")

echo "The element with atomic number $AN is $NAME ($SYMBOL). It's a $COMMODITY, with a mass of $AM amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."

fi

#else

if [[ -z "$ANTEST" && -z "$SYMBOLTEST" && -z "$NAMETEST" && ! -z "$INPUT" ]]
then
echo "I could not find that element in the database."
fi





