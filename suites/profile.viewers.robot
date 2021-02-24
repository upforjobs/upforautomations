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
Login
          Maximize Browser Window
          Go To          ${TESTURL}
          Click Element          id=login
          Login modal dialog
          Input Text          name=emailOrUserName          ${business}
          Input Text          name=password          ${password}
          Click Element          id=login
          mini-dashboard
          Click Element          link=Hi ${business},
          Wait Until Element Is Visible          link=View Public Profile
          Element Should Be Enabled          link=View Public Profile
          Element Text Should Be          link=View Public Profile          View Public Profile
          Wait Until Element Is Visible          link=Profile Settings
          Element Should Be Enabled          link=Profile Settings
          Element Text Should Be          link=Profile Settings          Profile Settings
          Wait Until Element Is Visible          link=My Profile Viewers
          Element Should Be Enabled          link=My Profile Viewers
          Element Text Should Be          link=My Profile Viewers          My Profile Viewers
          Capture Page Screenshot          profile-page-{index}.png

Go to Profile viewers
          Click Element          link=My Profile Viewers
          Wait Until Element Is Visible          link=Up For Jobs
          Wait Until Element Is Visible          link=My Profile Viewers
          Wait Until Element Is Visible          class=ProfileViewers_profileViewsInfo__1b-Aq
          Wait Until Element Is Visible          class=ProfileViewers_completeGuide__20nmc
          Wait Until Element Is Visible          class=ProfileViewers_profileViewersGraph__2cqto
          Wait Until Element Is Visible          class=ProfileViewers_profileViewerCardContainer__3IG8X
          Sleep          1
          Capture Page Screenshot          profile-viewers-page-{index}.png
          Scroll Element Into View          class=ProfileViewers_profileViewerCardContainer__3IG8X
          Sleep          1
          Scroll Element Into View          xpath=//body/div[@id='root']/div[1]/section[1]/div[2]/div[2]/div[3]/div[3]/div[1]/a[1]/div[1]
          Capture Page Screenshot          profile-viewers-page-{index}.png

Logout
          LogoutKW
