*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Library                 SeleniumLibrary
Resource                _keywords.txt
Resource                _mysetup.txt
Library                 XvfbRobot
Library                 String

*** Variables ***
${TMP_PATH}             /tmp

*** Test Cases ***
Login
          Maximize Browser Window
          Go To          ${TESTURL}
          Wait Until Element Is Visible          xpatg=//a[@id='postAJob']
          Click Element          id=postAJob

Find a job

Single job page
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Details')]
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Upload your submission')]
          Click Element          xpath=//button[contains(text(),'Upload your submission')]
          Wait Until Element Is Visible          id=amount
          ${prize}=          Generate Random String          3          [NUMBERS]
          Input Text          id=amount          ${prize}
          Input Text          id=amount          ${description}
          Wait Until Element Is Visible          xpath=//button[contains(text(),'+ Upload files')]
          ${id} =          Generate Random String          2          [NUMBERS]
          Choose File          name=add-photo          ${CURDIR}\\random\\${id}.jpg
          Sleep          2
          Click Element          xpath=//button[contains(text(),'Apply')]
