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
Login as employer
          Login Business KW
          mini-dashboard
          Click Link          /profile-viewers

Go to Profile Viewer page
          Wait Until Element Is Visible          link=Up For Jobs
          Wait Until Element Is Visible          link=My Profile Viewers
          Wait Until Element Is Visible          class=ProfileViewers_profileViewsInfo__1b-Aq
          Wait Until Element Is Visible          class=ProfileViewers_completeGuide__20nmc
          Wait Until Element Is Visible          class=ProfileViewers_profileViewersGraph__2cqto
          Capture Element Screenshot          class=ProfileViewers_profileViewersGraph__2cqto
          Wait Until Element Is Visible          class=ProfileViewers_profileViewerCardContainer__3IG8X
          Sleep          1
          Capture Page Screenshot          profile-viewers-page-{index}.png
          Scroll Element Into View          class=ProfileViewers_profileViewerCardContainer__3IG8X
          Sleep          1
          Scroll Element Into View          xpath=//body/div[@id='root']/div[1]/section[1]/div[2]/div[2]/div[3]/div[3]/div[1]/a[1]/div[1]
          Capture Page Screenshot          profile-viewers-page-{index}.png
          Wait Until Element Is Visible          class=ProfileViewerCard_profileViewerCard__2hL7Y

Go to freelancer Public view
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[2]/div[3]/div[1]/div[1]/a[1]/div[1]
          Click Element          xpath=//section[1]/div[2]/div[2]/div[3]/div[1]/div[1]/a[1]/div[1]
          Wait Until Element Is Visible          xpath=//section[1]/div[1]/div[1]/div[1]/div[1]
          Capture Page Screenshot          freelancer-public-page-{index}.png
          Sleep          10
          #Console log
          LogoutKW
