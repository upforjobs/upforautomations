*** Settings ***
Documentation     In theis test
...               we are testin login form
...               nav header elements
Suite Setup       Open Chrome Browsers
Suite Teardown    Close All Browsers
Resource          _keywords.txt
Resource          _mysetup.txt
Library           SeleniumLibrary
Library           String
Library           Collections

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Login
    UFJLogin

Unregistered
    Navheader Unregistered

Business
    Login Business KW
    Navheader Business
    LogoutKW

Freelancer
    Login Freelancer KW
    Navheader Freelancer
    LogoutKW
