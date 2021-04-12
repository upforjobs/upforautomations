*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Library                 SeleniumLibrary
Library                 XvfbRobot
Resource                _mysetup.txt
Resource                _keywords.txt
Library                 String

*** Variables ***
${TMP_PATH}             /tmp

*** Test Cases ***
Loginufj
          Maximize Browser Window
          Go To          ${TESTURL}
          Wait Until Element Is Visible          class=Login_headingText__2QdrP
          Input Text          id=emailOrUserName          ufj
          Input Text          id=password          ${ufjpass}
          Submit Form

Register business
          Hire KW
          #username
          ${username} =          Generate Random String          3          [UPPER]
          ${username} =          Set Variable          ${username}
          Set Suite Variable          ${username}
          #email
          ${radnom_email} =          Generate Random String          7          [NUMBERS]
          ${radnom_email}=          Set Variable          ${username}-${radnom_email}${email}
          Set Suite Variable          ${radnom_email}
          Input Text          name:email          ${radnom_email}
          Capture Page Screenshot          email-{index}.png
          Sleep          1
          Input Text          name:username          ${business}${username}
          Capture Page Screenshot          username-{index}.png
          Sleep          1
          Input Password          name:password          ${password}
          Sleep          1
          Click Element          css=.signUp
          Sleep          1
          Capture Page Screenshot          submit-{index}.png

Login
          Sleep          3
          Click Element          xpath=//p[contains(.,'Sign In')]
          Login modal dialog
          Capture Page Screenshot          login-{index}.png
          Input Text          name:emailOrUserName          ${business}${username}
          Input Text          name:password          ${password}
          Click Element          id:login
          Wait Until Element Is Not Visible          xpath://button[contains(text(),'Login')]
          Capture Page Screenshot          login-user-{index}.png

Profile settings
          Profile Settings page
          Capture Page Screenshot          profile-settings-{index}.png
          Input Text          id=firstName          ${business}${username}
          Input Text          id=lastName          ${business}${username}
          Click Button          id=MALE
          Input Text          id=dateOfBirth          06-11-1994
          Input Text          id=description          ${description}
          #Country
          Scroll Element Into View          id=language__fluency
          Click Element          name=country
          Input Text          name=country          United States
          Capture Page Screenshot          country-{index}.png
          Click Element          css=.DropDownSearch_item__5UoLs:nth-child(1)          #United States
          Wait Until Element Is Not Visible          xpath=//div[5]/div/label/div          #Country
          Element Should Not Be Visible          xpath=//div[5]/div/label/div
          Input Text          id=state          Nevada
          Input Text          id=city          Las Vegas
          Input Text          id=postal          postal
          Input Text          id=street          Random Street
          Element Should Be Enabled          css=.MultipleSelectSearch_input__34N1Q
          #language
          Scroll Element Into View          xpath=//button[contains(.,'Save')]
          Capture Page Screenshot          description-{index}.png
          Click Element          css=.MultipleSelectSearch_input__34N1Q
          Input Text          css=.MultipleSelectSearch_input__34N1Q          Eng
          Wait Until Element Is Visible          xpath=//div[contains(text(),'English')]
          Click Element          xpath=//div[contains(text(),'English')]
          Capture Page Screenshot          language-{index}.png
          Click Element          xpath=//p[contains(.,'Fluency')]
          Click Element          xpath=//div[contains(text(),'Native')]          #Fluency Native
          Sleep          2
          Capture Page Screenshot          language-{index}.png
          Click Element          xpath=//button[contains(text(),'Save')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Profile Saved Successfully')]
          ${alert-success} =          Get Text          xpath=//div[contains(text(),'Profile Saved Successfully')]
          Log To Console          ${alert-success}
          Capture Element Screenshot          xpath://div[contains(text(),'Profile Saved Successfully')]
          Capture Page Screenshot          saved-profile-settings-{index}.png

Upload Avatar Picture
          [Documentation]          In this test we are testing upload avatar picture.
          Scroll Element Into View          xpath=//h2[contains(text(),'Professional Settings')]
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Professional Settings')]
          Sleep          2
          ${id} =          Generate Random String          2          [NUMBERS]
          Choose File          name:add-photo          ${CURDIR}\\random\\${id}.jpg
          Capture Element Screenshot          name=add-photo
          Sleep          2
          Capture Page Screenshot          capture-{index}.png

Logout
          LogoutKW
