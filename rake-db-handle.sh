#!/bin/bash
#Auteur : Florent Grognet
#Scirpt for an easier handling of ruby-on-rails : rake db:xx commands

#Constants
USAGE="${0##*/} -r -s -b -l \n
		\t-r : database reset \n
		\t-s : importing seeds \n
		\t-b : bundle execution \n
		\t-l : system rake use (/usr/bin/rake)
		"
LRAKE="/usr/bin/rake"
RAKE="./bin/rake"
BUNDLE="bundle exec"

#Flags
r=0
s=0
b=0
l=0

#Set flags corresponding to arguments
 while getopts ":rsbl" option
 do
     case $option in
    	 r)
    	    r=1
    	    ;;
    	 s)
    	    s=1
    	    ;;
    	 b)
    	    b=1
    	    ;;
    	 l)
    	    l=1
    	    ;;
    	 \?)
    	    echo -e $USAGE
    	    exit 1
    	    ;;
    esac
 done

#Agruments control
if [ $r -eq 0 ]
then 
  if [ $s -eq 0 ]
  then
    echo -e $USAGE
    exit 1
  fi
fi

#Rake selection
if [ $l -eq 1 ]
then
  $RAKE = $LRAKE
fi

#Database commands
if [ $b -eq 0 ]
then
  if [ $r -eq 1 ]
  then
	  $RAKE db:migrate:reset
  fi
  if [ $s -eq 1 ]
  then
	  $RAKE db:seeds
  fi	
else
  if [ $r -eq 1 ]
  then
	  $BUNDLE $RAKE db:migrate:reset
  fi
  if [ $s -eq 1 ]
  then
	  $BUNDLE $RAKE db:seeds
  fi
fi

exit 0
