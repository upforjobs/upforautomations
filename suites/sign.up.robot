*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Library                 SeleniumLibrary
Resource                _keywords.txt
Resource                _mysetup.txt
Library                 String
Library                 XvfbRobot

*** Variables ***
${TMP_PATH}             /tmp

*** Test Cases ***
Login as employer
          UFJLogin

Sign in \ - submit
          Wait Until Element Is Visible          xpath=//p[contains(.,'Sign In')]
          Click Element          xpath=//p[contains(.,'Sign In')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Signup')]
          Click Element          xpath=//div[contains(text(),'Signup')]
          Sign in modal
          Clear Element Text          name:email
          Clear Element Text          name:username
          Clear Element Text          name:password
          Click Element          css=.signUp
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Username must not contain underscores at the begin')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Email is a required field')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Password is a required field')]
          Element Text Should Be          xpath=//div[contains(text(),'Username must not contain underscores at the begin')]          Username must not contain underscores at the beginning or end          #Email field is required
          Element Text Should Be          xpath=//div[contains(text(),'Email is a required field')]          Email is a required field          #Password field is required
          Element Text Should Be          xpath=//div[contains(text(),'Password is a required field')]          Password is a required field          #Username field is required
          Capture Element Screenshot          class=SignUp_signupCard__8R2Z8
          Capture Page Screenshot          incorrect-input-fields-{index}.png
          Log To Console          Username must not contain underscores at the beginning or end
          Log To Console          Email is a required field
          Log To Console          Password is a required field
