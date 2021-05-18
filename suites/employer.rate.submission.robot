*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Library                 SeleniumLibrary
Library                 String
Library                 XvfbRobot
Resource                _keywords.txt
Resource                _mysetup.txt

*** Variables ***
${TMP_PATH}             /tmp

*** Test Cases ***
Login
          Maximize Browser Window
          Go To          ${TESTURL}
          Wait Until Element Is Visible          class=Login_headingText__2QdrP
          Input Text          id=emailOrUserName          ufj
          Input Text          id=password          ${ufjpass}
          Submit Form
          Login Business KW
