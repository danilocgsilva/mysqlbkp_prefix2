#!/bin/bash

## version
VERSION="1.0.0"

## Echoes 0 if non existent. Echoes 1 if ok.
checks_mysql_config_editor () {
  if which mysql_config_editor > /dev/null
  then
    echo 1
  else
    echo 0
  fi
}

##
exit_case_mysql_config_editor_not_exists () {
  if [ $(checks_mysql_config_editor) = 0 ]
  then
    echo Sorry, this script needs the mysql_config_editor utility to works and can\'t proced. Install this utility first.
    exit
  fi
}

##
tables_loop () {
  mysql --login-path=$login_path $dbname -e "SHOW TABLES" | sed -n /^$dbprefix/p
}

##
do_backup () {
  for i in $(tables_loop)
  do
    table_full_path=$backup_location'/'$i.sql
    mysqldump --login-path=$login_path $dbname $i > $table_full_path
    echo Table $i backuped in $table_full_path
  done
}

##
exit_if_backup_location_not_exists () {
  if [ ! -d $backup_location ]
  then
    echo The provided backup location does not exists.
    exit
  fi
}

## Main function
mslbkpprefix () {
  exit_case_mysql_config_editor_not_exists

  local login_path
  local dbprefix
  local dbname
  local backup_location

  read -p "Provides the login-path value: " login_path
  read -p "Provides the database name: " dbname
  read -p "Provides the database prefix: " dbprefix
  read -p "Provides the backup location: " backup_location

  exit_if_backup_location_not_exists

  do_backup
}

## detect if being sourced and
## export if so else execute
## main function with args
if [[ /usr/local/bin/shellutil != /usr/local/bin/shellutil ]]; then
  export -f mslbkpprefix
else
  mslbkpprefix "${@}"
  exit 0
fi
