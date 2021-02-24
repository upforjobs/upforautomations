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
          Click Link          /profile-settings
          Capture Page Screenshot          profile-settings-{index}.png
          Wait Until Element Is Visible          xpath://div[contains(text(),'Profile Settings')]
          Element Should Be Visible          xpath://div[contains(text(),'Profile Settings')]
          Element Text Should Be          xpath://div[contains(text(),'Profile Settings')]          Profile Settings
          Wait Until Element Is Visible          xpath://div[contains(text(),'MODE:')]
          Element Should Be Visible          xpath://div[contains(text(),'MODE:')]
          Element Text Should Be          xpath://div[contains(text(),'MODE:')]          MODE:
          Wait Until Element Is Visible          xpath://div[contains(text(),'visible')]
          Element Should Be Visible          xpath://div[contains(text(),'visible')]
          Element Text Should Be          xpath://div[contains(text(),'visible')]          visible
          Wait Until Element Is Visible          xpath://div[contains(text(),'Users can see you are online')]
          Element Should Be Visible          xpath://div[contains(text(),'Users can see you are online')]
          Element Text Should Be          xpath://div[contains(text(),'Users can see you are online')]          Users can see you are online
          Wait Until Element Is Visible          xpath://div[contains(text(),'GENDER:')]
          Element Should Be Visible          xpath://div[contains(text(),'GENDER:')]
          Element Text Should Be          xpah://div[contains(text(),'GENDER:')]          GENDER:
          Wait Until Element Is Visible          xpath://div[contains(text(),'Male')]
          Element Should Be Visible          xpath://div[contains(text(),'Male')]
          Element Text Should Be          xpath://div[contains(text(),'Male')]          Male
          Wait Until Element Is Visible          xpath://div[contains(text(),'Female')]
          Element Should Be Visible          xpath://div[contains(text(),'Female')]
          Element Text Should Be          xpath://div[contains(text(),'Female')]          Female
          Sleep          10
          Wait Until Element Is Visible
          Element Should Be Visible
          Element Text Should Be          \          STATUS:
          Wait Until Element Is Visible
          Element Should Be Visible
          Element Text Should Be
          Wait Until Element Is Visible
          Element Should Be Visible
          Element Text Should Be
          Wait Until Element Is Visible
          Element Should Be Visible
          Element Text Should Be
          Wait Until Element Is Visible
          Element Should Be Visible
          Element Text Should Be
