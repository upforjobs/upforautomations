*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Resource                _keywords.txt
Resource                _mysetup.txt
Library                 SeleniumLibrary
Library                 String
Library                 XvfbRobot

*** Variables ***
${TMP_PATH}             /tmp

*** Test Cases ***
Login with old password
          UFJLogin
          Click Element          xpath=//p[contains(.,'Sign In')]
          Login modal dialog
          Input Text          id=emailOrUserName          freelancer10
          Input Text          id=password          Password##99
          Submit Form
          Sleep          5
          Capture Page Screenshot          landing-page-{index}.png
          Click Element          xpath=//h4[contains(text(),'Complete your profile')]
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Profile & Personal Settings')]
          Click Element          xpath=//a[contains(text(),'Password & Security')]
          Sleep          5
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Password & Security')]
          Capture Page Screenshot          password-page-{index}.png
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Change Password')]
          Element Should Be Visible          xpath=//div[contains(text(),'Change Password')]
          Element Text Should Be          xpath=//div[contains(text(),'Change Password')]          Change Password
          Wait Until Element Is Visible          xpath=//label[contains(text(),'Current Password')]
          Element Should Be Visible          xpath=//label[contains(text(),'Current Password')]
          Element Text Should Be          xpath=//label[contains(text(),'Current Password')]          Current Password
          Element Should Be Enabled          xpath=//input[@id='currentPassword']
          Wait Until Element Is Visible          xpath=//label[contains(text(),'New Password')]
          Element Should Be Visible          xpath=//label[contains(text(),'New Password')]
          Element Text Should Be          xpath=//label[contains(text(),'New Password')]          New Password
          Element Should Be Enabled          xpath=//input[@id='password']
          Wait Until Element Is Visible          xpath=//label[contains(text(),'Confirm Password')]
          Element Should Be Visible          xpath=//label[contains(text(),'Confirm Password')]
          Element Text Should Be          xpath=//label[contains(text(),'Confirm Password')]          Confirm Password
          Element Should Be Enabled          xpath=//input[@id='confirmedPassword']
          Element Should Be Enabled          xpath=//button[contains(text(),'Update')]
          Click Element          xpath=//button[contains(text(),'Update')]
          Wait Until Element Is Visible          xpath=//p[contains(text(),'Current password is required!')]
          Element Should Be Visible          xpath=//p[contains(text(),'Current password is required!')]
          Element Text Should Be          xpath=//p[contains(text(),'Current password is required!')]          Current password is required!
          Wait Until Element Is Visible          xpath=//p[contains(text(),'New password is required!')]
          Element Should Be Visible          xpath=//p[contains(text(),'New password is required!')]
          Element Text Should Be          xpath=//p[contains(text(),'New password is required!')]          New password is required!
          Wait Until Element Is Visible          xpath=//p[contains(text(),'Confirm password is required!')]
          Element Should Be Visible          xpath=//p[contains(text(),'Confirm password is required!')]
          Element Text Should Be          xpath=//p[contains(text(),'Confirm password is required!')]          Confirm password is required!
          Capture Page Screenshot          password-error-message-{index}.png
          Click Element          xpath=//form[1]/div[1]/div[1]/i[1]
          Click Element          xpath=//form[1]/div[2]/div[1]/i[1]
          Click Element          xpath=//form[1]/div[3]/div[1]/i[1]
          Capture Page Screenshot          fa-fa-eye-{index}.png

Password short
          #error
          Input Text          xpath=//input[@id='currentPassword']          invalid
          Input Text          xpath=//input[@id='password']          s
          Input Text          xpath=//input[@id='confirmedPassword']          invalid
          Click Element          xpath=//button[contains(text(),'Update')]
          Wait Until Element Is Visible          xpath=//p[contains(text(),'Too Short!')]
          Element Should Be Visible          xpath=//p[contains(text(),'Too Short!')]
          Element Text Should Be          xpath=//p[contains(text(),'Too Short!')]          Too Short!
          Wait Until Element Is Visible          xpath=//p[contains(text(),'Passwords must match')]
          Element Should Be Visible          xpath=//p[contains(text(),'Passwords must match')]
          Element Text Should Be          xpath=//p[contains(text(),'Passwords must match')]          Passwords must match
          Capture Page Screenshot          password-error-message-{index}.png

New Password
          Clear Element Text          xpath=//input[@id='currentPassword']
          Clear Element Text          xpath=//input[@id='password']
          Clear Element Text          xpath=//input[@id='confirmedPassword']
          Capture Page Screenshot          clear-input-fields{index}.png
          Input Text          xpath=//input[@id='currentPassword']          invalid
          Input Text          xpath=//input[@id='password']          invalidrandom
          Input Text          xpath=//input[@id='confirmedPassword']          random
          Click Element          xpath=//button[contains(text(),'Update')]
          Capture Page Screenshot          clear-input-fields{index}.png
          Wait Until Element Is Visible          xpath=//p[contains(text(),'Password must contain min 8 characters: at least o')]
          Element Should Be Visible          xpath=//p[contains(text(),'Password must contain min 8 characters: at least o')]
          Element Text Should Be          xpath=//p[contains(text(),'Password must contain min 8 characters: at least o')]          Password must contain min 8 characters: at least one lowercase letter, one uppercase letter, one numeric digit, and one special character
          Wait Until Element Is Visible          xpath=//p[contains(text(),'Passwords must match')]
          Element Should Be Visible          xpath=//p[contains(text(),'Passwords must match')]
          Element Text Should Be          xpath=//p[contains(text(),'Passwords must match')]          Passwords must match

Current Password
          Clear Element Text          xpath=//input[@id='currentPassword']
          Clear Element Text          xpath=//input[@id='password']
          Clear Element Text          xpath=//input[@id='confirmedPassword']
          Capture Page Screenshot          clear-input-fields{index}.png
          Input Text          xpath=//input[@id='currentPassword']          invalid
          Input Text          xpath=//input[@id='password']          Password##88
          Input Text          xpath=//input[@id='confirmedPassword']          Password##88
          Click Element          xpath=//button[contains(text(),'Update')]
          Capture Page Screenshot          clear-input-fields{index}.png
          Wait Until Element Is Visible          xpath=//p[contains(text(),'Password is incorrect')]
          Element Should Be Visible          xpath=//p[contains(text(),'Password is incorrect')]
          Element Text Should Be          xpath=//p[contains(text(),'Password is incorrect')]          Password is incorrect
          #old password is not correct
