*** Settings ***
Documentation     in this test we are testing Login form
...               Landing page
...               post a job page
...               my jobs page
...               transaction page with paypal
...               logout
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Test Setup
Library           SeleniumLibrary
Library           String
Library           XvfbRobot
Resource          _mysetup.txt
Resource          _keywords.txt
Library           Collections

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Login
