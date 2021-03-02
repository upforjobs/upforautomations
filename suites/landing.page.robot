*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Library                 SeleniumLibrary
Library                 String
Library                 XvfbRobot
Resource                _mysetup.txt
Resource                _keywords.txt

*** Variables ***
${TMP_PATH}             /tmp

*** Test Cases ***
Sign In
          Maximize Browser Window
          Go To          ${TESTURL}
          Wait Until Element Is Visible          xpath=//p[contains(.,'Sign In')]
          Click Element          xpath=//p[contains(.,'Sign In')]
          Login modal dialog

Register modal
          Maximize Browser Window
          Go To          ${TESTURL}
          Wait Until Element Is Visible          xpath=//p[contains(.,'Sign In')]
          Click Element          xpath=//p[contains(.,'Sign In')]
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Signup')]
          Click Element          xpath=//a[contains(text(),'Signup')]
          Register modal dialog

Forgot password
          Maximize Browser Window
          Go To          ${TESTURL}
          Wait Until Element Is Visible          xpath=//p[contains(.,'Sign In')]
          Click Element          xpath=//p[contains(.,'Sign In')]
          Click Element          xpath://button[contains(text(),'Forgot Password?')]
          #forgot password modal dialog
          Forgot Password modal dialog

Hire
          Maximize Browser Window
          Go To          ${TESTURL}
          Wait Until Element Is Visible          id=hire
          Element Should Be Enabled          id=hire
          Element Text Should Be          id=hire          Hire
          Click Button          id=hire
          Sign in modal

Get hire
          Maximize Browser Window
          Go To          ${TESTURL}
          Wait Until Element Is Visible          id=getHired
          Element Should Be Enabled          id=getHired
          Element Text Should Be          id=getHired          Get Hired
          Click Button          id=getHired
          Get Hired modal

*** Keywords ***
