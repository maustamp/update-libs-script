#!/bin/bash

# set vars
MY_DIRECTORY=${PWD##*/}
GO_MOD=go.mod
LOG=update_logs.txt

echo "Update $MY_DIRECTORY libs" |& tee -a 

# update and log libraries
echo -e "\n --- Update go-meli-toolkit" |& tee -a $LOG
go get -u github.com/mercadolibre/go-meli-toolkit |& tee -a $LOG

echo -e "\n --- Update fury_go-platform" |& tee -a $LOG
go get -u github.com/mercadolibre/fury_go-platform |& tee -a $LOG

echo -e "\n --- Update fury_go-platform-pci" |& tee -a $LOG
go get -u github.com/mercadolibre/fury_go-platform-pci |& tee -a $LOG

echo -e "\n --- Update fury_gateway-kit" |& tee -a $LOG
go get -u github.com/mercadolibre/fury_gateway-kit |& tee -a $LOG

echo -e "\n --- Update fury_gateway-pci-toolkit" |& tee -a $LOG
go get -u github.com/mercadolibre/fury_gateway-pci-toolkit |& tee -a $LOG

echo -e "\n --- Run go mod tidy" |& tee -a $LOG
go mod tidy -v |& tee -a $LOG

# checks
echo -e "\n --- Run checks" |& tee -a $LOG

CHECK1="fury_go-core"
echo -e "\nSearching [${CHECK1}]"
if grep "$CHECK1" $GO_MOD
then
    echo -e "\n - $CHECK1 found" |& tee -a $LOG
else
    echo -e "\n - $CHECK1 lib not found" |& tee -a $LOG
fi

CHECK2="go-platform"
echo -e "\nSearching [${CHECK2}]"
if grep "$CHECK2" $GO_MOD
then
    echo -e "\n - $CHECK2 found" |& tee -a $LOG
else
    echo -e "\n - $CHECK2 lib not found" |& tee -a $LOG
fi

CHECK3="go-meli-toolkit"
echo -e "\nSearching [${CHECK3}]"
if grep "$CHECK3" $GO_MOD
then
    echo -e "\n - $CHECK3 found" |& tee -a $LOG
else
    echo -e "\n - $CHECK3 lib not found" |& tee -a $LOG
fi





# TODO
# go list -m all | grep -e dgrijalva/jwt-go -e gorilla/websocket -e satori/go.uuid