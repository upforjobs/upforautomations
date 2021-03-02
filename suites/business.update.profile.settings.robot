*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Library                 SeleniumLibrary
Resource                _keywords.txt
Resource                _mysetup.txt
Library                 XvfbRobot

*** Variables ***
${TMP_PATH}             /tmp

*** Test Cases ***
Login
          Login Business KW

Go to Profile settings \ page
          Wait Until Element Is Visible          xpath=//h4[contains(text(),'Complete your profile')]
          Click Element          xpath=//h4[contains(text(),'Complete your profile')]
          Capture Page Screenshot          profile-settings-{index}.png
          Profile Settings page
