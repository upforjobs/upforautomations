*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Resource                _keywords.txt
Resource                _mysetup.txt
Library                 String
Library                 SeleniumLibrary
Library                 Collections
Library                 XvfbRobot
Library                 SeleniumLibrary

*** Variables ***
${TMP_PATH}             /tmp

*** Test Cases ***
Login fresh user
          Maximize Browser Window
          Go To          ${TESTURL}
          Click Element          xpath=//div[2]/div[2]/div[1]
          Input Text          id:emailOrUserName          ${user1}
          Input Text          name:password          ${password}
          Click Element          id:login
          Wait Until Element Is Not Visible          class:Login_loginCard__2skrc
          Wait Until Element Is Visible          xpath://div[@class="MiniDashboard_miniDashboard__2g2df"]
          Capture Page Screenshot          miniDashboard-{index}.png
          Click Element          xpath=//h4[contains(text(),'Complete your profile')]
          Wait Until Element Is Not Visible          xpath://div[@class="MiniDashboard_miniDashboard__2g2df"]
          #Profile settings
          Wait Until Element Is Visible          class:BreadCrumb_breadcrumbContainer__1e_Kg
          Capture Page Screenshot          BreadCrumb-{index}.png
          #Click Element          name=firstNameTutorial
          #Wellcome
          Element Should Be Visible          class=CardBody_CardBody__3iy_8
          Element Should Be Visible          class=Personal_welcomeCard__title__3zYEH
          Element Should Be Visible          class: fa-times
          #Click Link          /profile-settings
          Capture Page Screenshot          profile-settings-{index}.png
          #Wait Until Element Is Visible          xpath://div[contains(text(),'Profile Settings')]
          #Element Should Be Visible          xpath://div[contains(text(),'Profile Settings')]
          #Element Text Should Be          xpath://div[contains(text(),'Profile Settings')]          Profile Settings
          Wait Until Element Is Visible          xpath://div[contains(text(),'MODE:')]
          Element Should Be Visible          xpath://div[contains(text(),'MODE:')]
          Element Text Should Be          xpath://div[contains(text(),'MODE:')]          MODE:
          Wait Until Element Is Visible          xpath://div[contains(text(),'visible')]
          Element Should Be Visible          xpath://div[contains(text(),'visible')]
          Element Text Should Be          xpath://div[contains(text(),'visible')]          visible
          Wait Until Element Is Visible          xpath://div[contains(text(),'Users can see you are online')]
          Element Should Be Visible          xpath://div[contains(text(),'Users can see you are online')]
          Element Text Should Be          xpath://div[contains(text(),'Users can see you are online')]          Users can see you are online
          Wait Until Element Is Visible          xpath://div[contains(text(),'HIDE / SHOW')]
          Element Should Be Visible          xpath://div[contains(text(),'HIDE / SHOW')]
          Element Text Should Be          xpath://div[contains(text(),'HIDE / SHOW')]          HIDE / SHOW
          Sleep          1
          Wait Until Element Is Visible          xpath://div[@class="Personal_visibilityContainer__1U-F_"]/div[1]/div[@class="Personal_visibilityTitle__3JU1g"]
          Element Should Be Visible          xpath://div[@class="Personal_visibilityContainer__1U-F_"]/div[1]/div[@class="Personal_visibilityTitle__3JU1g"]
          Element Text Should Be          xpath://div[@class="Personal_visibilityContainer__1U-F_"]/div[1]/div[@class="Personal_visibilityTitle__3JU1g"]          STATUS:
          Element Should Be Visible          class:ProfileSettingRadio_radioContainer1__3HzHx
          #Checkbox Should Be Selected          class:ProfileSettingRadio_radioContainer1__3HzHx
          Wait Until Element Is Visible          xpath://div[@class="Personal_visibilityContainer__1U-F_"]//div[@class="ProfileSettingRadio_heading1__rLfcg"]
          Element Should Be Visible          xpath://div[@class="Personal_visibilityContainer__1U-F_"]//div[@class="ProfileSettingRadio_heading1__rLfcg"]
          Element Text Should Be          xpath://div[@class="Personal_visibilityContainer__1U-F_"]//div[@class="ProfileSettingRadio_heading1__rLfcg"]          Available
          Wait Until Element Is Visible          xpath://div[@class="Personal_visibilityContainer__1U-F_"]/div[1]/div[2]//div[@class="ProfileSettingRadio_heading__3MlCF"]
          Element Should Be Visible          xpath://div[@class="Personal_visibilityContainer__1U-F_"]/div[1]/div[2]//div[@class="ProfileSettingRadio_heading__3MlCF"]
          Element Text Should Be          xpath://div[@class="Personal_visibilityContainer__1U-F_"]/div[1]/div[2]//div[@class="ProfileSettingRadio_heading__3MlCF"]          Available to work
          Element Should Be Enabled          xpath://div[@class="Personal_visibilityContainer__1U-F_"]/div[1]/div[3]//div[@class="ProfileSettingRadio_radioContainer__1UQSK"]
          Wait Until Element Is Visible          xpath://div[contains(text(),'Busy')]
          Element Should Be Visible          xpath://div[contains(text(),'Busy')]
          Element Text Should Be          xpath://div[contains(text(),'Busy')]          Busy
          Wait Until Element Is Visible          xpath://div[contains(text(),'Busy but open to offers')]
          Element Should Be Visible          xpath://div[contains(text(),'Busy but open to offers')]
          Element Text Should Be          xpath://div[contains(text(),'Busy but open to offers')]          Busy but open to offers
          Element Should Be Enabled          xpath://div[@class="Personal_visibilityContainer__1U-F_"]//div[4]//div[@class="ProfileSettingRadio_radioContainer__1UQSK"]
          Wait Until Element Is Visible          xpath://div[contains(text(),'Not Available')]
          Element Should Be Visible          xpath://div[contains(text(),'Not Available')]
          Element Text Should Be          xpath://div[contains(text(),'Not Available')]          Not Available
          #Personal settings
          Wait Until Element Is Visible          xpath://label[contains(text(),'INTRODUCTION')]
          Element Should Be Visible          xpath://label[contains(text(),'INTRODUCTION')]
          Element Text Should Be          xpath://label[contains(text(),'INTRODUCTION')]          INTRODUCTION
          Element Should Be Enabled          id:description
          Wait Until Element Is Visible          xpath://label[contains(text(),'USERNAME')]
          Element Should Be Visible          xpath://label[contains(text(),'USERNAME')]
          Element Text Should Be          xpath://label[contains(text(),'USERNAME')]          USERNAME
          Element Should Be Disabled          id:username
          Wait Until Element Is Visible          xpath://label[contains(text(),'NICKNAME (optional)')]
          Element Should Be Visible          xpath://label[contains(text(),'NICKNAME (optional)')]
          Element Text Should Be          xpath://label[contains(text(),'NICKNAME (optional)')]          NICKNAME (optional)
          Element Should Be Enabled          id:nickname
          Wait Until Element Is Visible          xpath://label[contains(text(),'FIRST NAME')]
          Element Should Be Visible          xpath://label[contains(text(),'FIRST NAME')]
          Element Text Should Be          xpath://label[contains(text(),'FIRST NAME')]          FIRST NAME
          Element Should Be Enabled          id:firstName
          Wait Until Element Is Visible          xpath://label[contains(text(),'LAST NAME')]
          Element Should Be Visible          xpath://label[contains(text(),'LAST NAME')]
          Element Text Should Be          xpath://label[contains(text(),'LAST NAME')]          LAST NAME
          Element Should Be Enabled          id:lastName
          Wait Until Element Is Visible          xpath://label[contains(text(),'DATE OF BIRTH')]
          Element Should Be Visible          xpath://label[contains(text(),'DATE OF BIRTH')]
          Element Text Should Be          xpath://label[contains(text(),'DATE OF BIRTH')]          DATE OF BIRTH
          Element Should Be Enabled          id:dateOfBirth
          Wait Until Element Is Visible          xpath://label[contains(text(),'GENDER')]
          Element Should Be Visible          xpath://label[contains(text(),'GENDER')]
          Element Text Should Be          xpath://label[contains(text(),'GENDER')]          GENDER
          Wait Until Element Is Visible          xpath://div[contains(text(),'Male')]
          Element Should Be Visible          xpath://div[contains(text(),'Male')]
          Element Text Should Be          xpath://div[contains(text(),'Male')]          Male
          Wait Until Element Is Visible          xpath://div[contains(text(),'Female')]
          Element Should Be Visible          xpath://div[contains(text(),'Female')]
          Element Text Should Be          xpath://div[contains(text(),'Female')]          Female
          Wait Until Element Is Visible          xpath://label[contains(text(),'COUNTRY')]
          Element Should Be Visible          xpath://label[contains(text(),'COUNTRY')]
          Element Text Should Be          xpath://label[contains(text(),'COUNTRY')]          COUNTRY
          Element Should Be Enabled          name:country
          Wait Until Element Is Visible          xpath://label[contains(text(),'STATE / PROVINCE (optional)')]
          Element Should Be Visible          xpath://label[contains(text(),'STATE / PROVINCE (optional)')]
          Element Text Should Be          xpath://label[contains(text(),'STATE / PROVINCE (optional)')]          STATE / PROVINCE (optional)
          Element Should Be Enabled          id:state
          Wait Until Element Is Visible          xpath://label[contains(text(),'CITY')]
          Element Should Be Visible          xpath://label[contains(text(),'CITY')]
          Element Text Should Be          xpath://label[contains(text(),'CITY')]          CITY
          Element Should Be Enabled          id:city
          Wait Until Element Is Visible          xpath://label[contains(text(),'POSTAL / ZIP CODE (optional)')]
          Element Should Be Visible          xpath://label[contains(text(),'POSTAL / ZIP CODE (optional)')]
          Element Text Should Be          xpath://label[contains(text(),'POSTAL / ZIP CODE (optional)')]          POSTAL / ZIP CODE (optional)
          Element Should Be Enabled          id:postal
          Wait Until Element Is Visible          xpath://label[contains(text(),'ADDRESS')]
          Element Should Be Visible          xpath://label[contains(text(),'ADDRESS')]
          Element Text Should Be          xpath://label[contains(text(),'ADDRESS')]          ADDRESS
          Element Should Be Enabled          id:street
          Wait Until Element Is Visible          xpath=//label[contains(text(),'LANGUAGE / PROFICIENCY')]
          Element Should Be Visible          xpath=//label[contains(text(),'LANGUAGE / PROFICIENCY')]
          Element Text Should Be          xpath=//label[contains(text(),'LANGUAGE / PROFICIENCY')]          LANGUAGE / PROFICIENCY
          Element Should Be Enabled          id:language__name
          Element Should Be Enabled          id:language__fluency
          #Wait Until Element Is Visible          class:ProfileSettingLanguage_languageButton__1TdIX
          #Element Should Be Visible          class:ProfileSettingLanguage_languageButton__1TdIX
          #Element Text Should Be          class:ProfileSettingLanguage_languageButton__1TdIX          Add Language
          Click Element          xpath=//section[1]/div[2]/div[1]/div[2]/div[4]/div[1]/img[1]
          Input Text          ${CURDIR}          279px-Tesla_Motors.svg
          Press Keys          ENTER          RETURN
          #Choose File          class=Avatar_avatar__container__6SBhX          ${CURDIR}279px-Tesla_Motors.svg
          LogoutKW
          #Choose File          xpath=//section[1]/div[2]/div[1]/div[2]/div[4]/div[1]/img[1]          C:\\Users\\User\\Desktop\\279px-Tesla_Motors.svg

Login password is incorrect
          [Tags]          login
          Maximize Browser Window
          Go To          ${TESTURL}
          Click Element          xpath=//p[contains(.,'Sign In')]
          Login modal dialog
          Input Text          name=emailOrUserName          ${user1}
          Input Text          name=password          invalid
          Click Button          id=login
          Wait Until Element Is Visible          xpath://div[contains(text(),'Password is incorrect')]
          Element Should Be Visible          xpath://div[contains(text(),'Password is incorrect')]
          Element Text Should Be          xpath://div[contains(text(),'Password is incorrect')]          Password is incorrect
          Capture Page Screenshot          password-is-incorrect-{index}.png
          Click Element          xpath://div[contains(text(),'Password is incorrect')]
          Wait Until Element Is Not Visible          xpath://div[contains(text(),'Password is incorrect')]
          Log To Console          Test pass with sucess

Login - missing login details
          [Tags]          login
          Maximize Browser Window
          Go To          ${TESTURL}
          Click Element          xpath=//p[contains(.,'Sign In')]
          Login modal dialog
          Click Button          id:login
          Capture Page Screenshot          login-details-{index}.png
          Wait Until Element Is Visible          id=emailUserError
          Element Should Be Visible          id=emailUserError
          Element Text Should Be          id=emailUserError          * Required          #Please enter login details
          Capture Element Screenshot          id=emailUserError
          Wait Until Element Is Visible          id=passwordError
          Element Should Be Visible          id=passwordError
          Element Text Should Be          id=passwordError          * Required
          Capture Element Screenshot          id=passwordError
          Capture Element Screenshot          class=Login_loginCard__2skrc

Login - User not found
          [Tags]          login
          Maximize Browser Window
          Go To          ${TESTURL}
          Click Element          xpath=//p[contains(.,'Sign In')]
          Login modal dialog
          Input Text          name=emailOrUserName          invalid
          Input Text          name:password          invalid
          Click Button          id:login
          Capture Page Screenshot          login-details-{index}.png
          Wait Until Element Is Visible          xpath://div[contains(text(),'User not found.')]
          Element Should Be Visible          xpath://div[contains(text(),'User not found.')]
          Element Text Should Be          xpath://div[contains(text(),'User not found.')]          User not found.
          Capture Element Screenshot          xpath://div[contains(text(),'User not found.')]

Login with FB
          [Tags]          login
          Maximize Browser Window
          Go To          ${TESTURL}
          Click Element          xpath=//p[contains(.,'Sign In')]
          Login modal dialog
          Wait Until Element Is Visible          class=Login_iconCircle__2dRuM
          Click Element          CLASS=FacebookLogin_facebookLogin__3b1gQ
          Sleep          3
          Switch Window          1
          Capture Page Screenshot          fb-login-{index}.png
          FacebookLogin_facebookLogin__3b1gQ

Login with Google
          [Tags]          login
          Maximize Browser Window
          Go To          ${TESTURL}
          Click Element          xpath=//p[contains(.,'Sign In')]
          Login modal dialog
          Wait Until Element Is Visible          class=GoogleLogin_googleLogin__3meAy
          Click Element          class=GoogleLogin_googleLogin__3meAy
          Sleep          3
          Capture Page Screenshot          google-login-{index}.png

Login with Linkedin
          [Tags]          login
          Maximize Browser Window
          Go To          ${TESTURL}
          Click Element          xpath=//p[contains(.,'Sign In')]
          Login modal dialog
          Wait Until Element Is Visible          class=LinkedinLogin_linkedinLogin__2bBmo
          Click Element          class=LinkedinLogin_linkedinLogin__2bBmo
          Sleep          3
          Capture Page Screenshot          linkedin-login-{index}.png

Login - log out
          [Tags]          login
          Maximize Browser Window
          Go To          ${TESTURL}
          Click Element          xpath=//p[contains(.,'Sign In')]
          Input Text          name=emailOrUserName          ${user1}
          Input Text          name=password          ${password}
          Click Element          id=login
          Wait Until Element Is Visible          xpath://div[@class="MiniDashboard_miniDashboard__2g2df"]
          Click Element          class:Avatar_avatar__container__6SBhX
          Wait Until Element Is Visible          class:Avatar_avatar__container__6SBhX
          Wait Until Element Is Visible          class:navLogoutBtn
          Capture Page Screenshot          click-avatar-picture-logout-{index}.png
          Click Element          class:navLogoutBtn
          Capture Page Screenshot          click-avatar-picture-logout-{index}.png
          #modal logout
          Logout modal
          Click Element          xpath://button[@class="buttonBtn LogoutModal_logoutModalBtn__2fBDP"]
          Wait Until Element Is Visible          xpath=//p[contains(.,'Sign In')]
          Capture Page Screenshot          logout-{index}.png
