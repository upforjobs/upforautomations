*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Library           Collections
Resource          _keywords.txt
Resource          _mysetup.txt
Library           SeleniumLibrary
Library           String
Library           XvfbRobot

*** Variable ***
${TMP_PATH}       /tmp

*** Test Cases ***
