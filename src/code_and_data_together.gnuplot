$DATABLOCK << EOD  
cats 4 2  
dogs 1 4  
EOD  
plot $DATABLOCK using 2:3:1 with labels
pause -1
