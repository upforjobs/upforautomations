*** Settings ***
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
          Navheader Unregistered

business
          Login Business KW
          #Navheader Business
          Wait Until Element Is Visible          id=nav-bar
          Element Should Be Visible          id=nav-bar
          Wait Until Element Is Visible          class=logoContainer
          Element Should Be Visible          class=logoContainer
          #search input
          Wait Until Element Is Visible          tag=input
          Element Should Be Visible          tag=input
          Element Should Be Enabled          tag=input
          Wait Until Element Is Visible          class=searchBox
          Element Should Be Visible          class=searchBox
          Wait Until Element Is Visible          class=searchContainer
          Element Should Be Visible          class=searchContainer
          Wait Until Element Is Visible          class=howItWorks
          Element Should Be Visible          class=howItWorks
          Element Should Be Enabled          class=howItWorks
          Wait Until Element Is Visible          id=postAJobLink
          Element Should Be Visible          id=postAJobLink
          Element Should Be Enabled          id=postAJobLink
          Wait Until Element Is Visible          id=findAJobLink
          Element Should Be Visible          id=findAJobLink
          Element Should Be Enabled          id=findAJobLink
          Wait Until Element Is Visible          class=signInWrapper
          Element Should Be Visible          class=signInWrapper
          Element Should Be Enabled          class=signInWrapper
          Capture Element Screenshot          id=nav-bar
          Sleep          1
          Wait Until Element Is Visible          xpath=//header/nav[@id='nav-bar']/div[1]/div[2]
          Wait Until Element Is Visible          id=switchUserEntity
          Element Should Be Visible          id=switchUserEntity
          Wait Until Element Is Visible          id=switchUserEntity
          Element Should Be Visible          id=switchUserEntity
          Element Should Be Enabled          id=switchUserEntity
          Wait Until Element Is Visible          class=postBtn          #Post a Job btn
          Element Should Be Visible          class=postBtn
          Element Should Be Enabled          class=postBtn
          Wait Until Element Is Visible          class:fa-bell
          Element Should Be Visible          class=fa-bell
          Element Should Be Enabled          class=fa-bell
          Wait Until Element Is Visible          class=fa-comment-dots
          Element Should Be Visible          class=fa-comment-dots
          Element Should Be Enabled          class=fa-comment-dots
          Wait Until Element Is Visible          class=justify-content-center
          Element Should Be Visible          class=justify-content-center
          Element Should Be Enabled          class=justify-content-center
          Wait Until Element Is Visible          class=languageShorcut
          Element Should Be Visible          class=languageShorcut
          Element Should Be Enabled          class=languageShorcut
          Wait Until Element Is Visible          class=globeIcon
          Element Should Be Visible          class=globeIcon
          Element Should Be Enabled          class=globeIcon
          Wait Until Element Is Visible          class=profileImg
          Element Should Be Visible          class=profileImg
          Element Should Be Enabled          class=profileImg
          Wait Until Element Is Visible          id=sideMenuToggleIcon
          Element Should Be Visible          id=sideMenuToggleIcon
          Element Should Be Enabled          id=sideMenuToggleIcon
          Capture Element Screenshot          id=nav-bar

freelancer
          Login Freelancer KW
          Navheader Freelancer
          LogoutKW
