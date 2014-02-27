#!/bin/bash

echo "Process to kill: $1";

if [ $1 = "" ] 
  then
	echo "You must inform the name of job to Kill!";
	exit 0;
fi

/bin/kill `pgrep $1`;

echo "Tree pid's has been killed.";
