#!/bin/bash
FILE_CREDENTIALS=../../credentials.json
case $1 in
  "CREATE")
   echo "CREATE"
   if [ -f "$FILE_CREDENTIALS" ];
    then
      terraform init
      terraform plan
      terraform apply -auto-approve
   else
   echo "NO SE ENCONTRO CREDENCIALES GCP, $FILE_CREDENTIALS"
   fi
  ;;
  "DESTROY")
   echo "DESTROY"
     if [ -f "$FILE_CREDENTIALS" ];
    then
      terraform destroy -auto-approve
   else
   echo "NO SE ENCONTRO CREDENCIALES GCP, $FILE_CREDENTIALS"
   fi
  ;;
  *)
   echo "OPCION NO VALIDA"
  ;;
esac