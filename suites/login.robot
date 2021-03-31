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
Login password is incorrect
          [Tags]          login
          Maximize Browser Window
          Go To          ${TESTURL}
          Wait Until Element Is Visible          xpath=//p[contains(.,'Sign In')]
          Click Element          xpath=//p[contains(.,'Sign In')]
          Login modal dialog
          Input Text          name=emailOrUserName          ${freelancer}
          Input Text          name=password          invalid
          Click Button          id=login
          Wait Until Element Is Visible          xpath://div[contains(text(),'Password is incorrect')]
          Element Should Be Visible          xpath://div[contains(text(),'Password is incorrect')]
          Log To Console          xpath://div[contains(text(),'Password is incorrect')]
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
          Wait Until Element Is Visible          xpath=//div[@id='facebookLogin']
          Click Element          xpath=//div[@id='facebookLogin']
          Sleep          3
          Capture Page Screenshot          fb-login-{index}.png

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
          Sleep          5
          Capture Page Screenshot          linkedin-login-{index}.png

Login username - log out
          [Tags]          login
          Login Freelancer KW
          LogoutKW

Login email - log out
          [Tags]          login
          Maximize Browser Window
          Go To          ${TESTURL}
          Wait Until Element Is Visible          xpath=//p[contains(.,'Sign In')]
          Click Element          xpath=//p[contains(.,'Sign In')]
          Login modal dialog
          Input Text          name=emailOrUserName          ${ufjfreelancer}${gmail}
          Input Text          name=password          ${password}
          Click Element          id=login
          Sleep          3
          mini-dashboard
          LogoutKW
