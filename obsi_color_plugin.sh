#!/bin/bash


################################# CONTEXT ##############################################

#This script allows you to create groups (Obsidian graph colors) based on the tree structure.

#This is only useful if your graph is representative of your tree structure.

#Copy the obsi_result.json output to .obsidian/graph.json (!!be careful not to delete everything)
#Delete all groups except the / group
#Tip: only add new blocks to graph.json so you don't lose the old colors


################################ FUNCTIONS ###############################################




if [[ ! -d .obsidian ]]
then 
  echo "Folder '.obsidian' not found. Are you in your vault root ?"

# We check if obsidian is running
# more than 1 because grep obsidian is a process
elif [[ $(ps aux | grep obsidian | wc -l) -gt 1 ]]
then
  echo "Obsidian process found. App must be close to modify graph.json"

else 

  #If it already exist we remove it
  if [[ -e /tmp/obsi_result.json ]]
  then 
    rm /tmp/obsi_result.json
  fi


  #display all folders and subfolders 
  #Reverse the output so that subfolders appear before folders
  #remove the md_src folder and subfolder
  ls -R | grep "\./" | sort -r | grep -v "md_src" > /tmp/obsi_group

  #change : for /
  sed -i 's/:/\//' /tmp/obsi_group

#remove the ./ at the beginning of each line
  #choose a random value between 1 and 16777215 for the node color
  ##read obsi_group line by line and write to obsi_result
  while read ligne; do
  echo "
    {
      \"query\": \"path:${ligne:2}\",
      \"color\": {
        \"a\": 1,
        \"rgb\": $(($RANDOM % 167))$(($RANDOM % 999999))
      }
    }," >> /tmp/obsi_result.json
    done < /tmp/obsi_group

  #Display differences between both files
  grep "query" .obsidian/graph.json > /tmp/obsi_graph_query
  grep "query" /tmp/obsi_result.json > /tmp/obsi_result_query
  
  echo -e "Diff graph.json | obsi_result\n"
  diff /tmp/obsi_graph_query /tmp/obsi_result_query

  #Open both files to compare
  gedit .obsidian/graph.json &
  gedit /tmp/obsi_result.json &

fi



#       /\__
#\_____/  _/
# RAITO  /

