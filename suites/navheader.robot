*** Settings ***
Documentation           In theis test
...                     we are testin login form
...                     nav header elements
Suite Setup             Open Chrome Browsers
Suite Teardown          Close All Browsers
Resource                _keywords.txt
Resource                _mysetup.txt
Library                 SeleniumLibrary
Library                 String
Library                 Collections
Library                 XvfbRobot

*** Variables ***
${TMP_PATH}             /tmp

*** Test Cases ***
unregistered
          Maximize Browser Window
          Go To          ${TESTURL}
          Wait Until Element Is Visible          class=Login_headingText__2QdrP
          Input Text          id=emailOrUserName          ufj
          Input Text          id=password          ${ufjpass}
          Submit Form
          Capture Page Screenshot          enterthe-website-{index}.png
          Navheader Unregistered

business
          Login Business KW
          Navheader Business
          LogoutKW

freelancer
          Login Freelancer KW
          Navheader Freelancer
          LogoutKW
