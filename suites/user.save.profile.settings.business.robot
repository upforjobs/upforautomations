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
Register business
          Maximize Browser Window
          Go To          ${TESTURL}
          Click Button          id=hire
          Wait Until Element Is Visible          id=hire
          Wait Until Element Is Visible          class:SignUp_signupCard__8R2Z8
          #username
          ${username} =          Generate Random String          5          [UPPER]
          ${username} =          Set Variable          ${username}
          Set Suite Variable          ${username}
          #email
          ${radnom_email} =          Generate Random String          7          [NUMBERS]
          ${radnom_email}=          Set Variable          ${username}-${radnom_email}${email}
          Set Suite Variable          ${radnom_email}
          Input Text          name:email          ${radnom_email}
          Capture Page Screenshot          email-{index}.png
          Sleep          1
          Input Text          name:username          ${username}
          Capture Page Screenshot          username-{index}.png
          Sleep          1
          Input Password          name:password          ${password}
          Sleep          1
          Click Element          xpath://button[contains(text(),'Sign up')]
          Sleep          1
          Capture Page Screenshot          submit-{index}.png
          Sleep          1
          Wait Until Element Is Visible          class:modal-body
          Sleep          1
          Click Element          xpath://span[contains(text(),'×')]
          Wait Until Element Is Not Visible          class:modal-body

Login
          Click Element          xpath=//div[2]/div[2]/div[1]
          Capture Page Screenshot          login-{index}.png
          Input Text          name:emailOrUserName          ${username}
          Input Text          name:password          ${password}
          Click Element          id:login
          Wait Until Element Is Not Visible          xpath://button[contains(text(),'Login')]
          Capture Page Screenshot          login-user-{index}.png

Profile settings
          New Profile Settings page
          Capture Page Screenshot          profile-settings-tutorial-{index}.png
          Click Element          id=firstName
          Capture Page Screenshot          profile-settings-{index}.png
          Click Element          xpath=//button[contains(.,'Save')]
          Capture Page Screenshot          profile-settings-required-fields-{index}.png
          Log To Console          *Required
          #Required fields
          Capture Page Screenshot          required-{index}.png
          Input Text          id=firstName          ${username}
          Input Text          id=lastName          ${username}
          Input Text          id=dateOfBirth          06-11-1994
          Click Button          id=male
          Click Element          name=country
          Input Text          name=country          Serbia
          Capture Page Screenshot          country-{index}.png
          #Click Element          xpath=//div[contains(.,'Serbia')]
          Scroll Element Into View          id=language__fluency
          Click Element          xpath=//form[1]/div[1]/div[5]/div[1]/div[1]/div[1]/div[1]
          Input Text          id=city          Random
          Input Text          id=street          Random Street
          Capture Page Screenshot          life-{index}.png
          Click Element          css=.ProfileSetting_profileSettingsContainer__gDCen
          Input Text          xpath=//div[@id='language__name']/input          Serbian
          Click Element          xpath=//div[contains(text(),'Serbian')]
          Capture Page Screenshot          language-{index}.png
          Click Element          id=language__fluency
          Click Element          xpath=//form[1]/div[2]/div[2]/div[1]/div[1]/div[2]/div[2]/div[1]          #Fluency Biginner
          Capture Page Screenshot          language-{index}.png
          Input Text          id=description          ${description}
          Capture Page Screenshot          description-{index}.png
          Click Element          xpath=//button[contains(text(),'Save')]
          Sleep          2
          Capture Page Screenshot          saved-profile-settings-{index}.png
          ${alert-success} =          Get Text          xpath://div[contains(text(),'Profile Saved Successfully')]
          Log To Console          ${alert-success}
          Capture Element Screenshot          xpath://div[contains(text(),'Profile Saved Successfully')]
          #avater
          Scroll Element Into View          xpath=//h2[contains(text(),'Profile Settings')]
          Sleep          3
          ${id} =          Generate Random String          2          [NUMBERS]
          Choose File          name:add-photo          ${CURDIR}\\random\\${id}.jpg
          Capture Element Screenshot          name=add-photo
          Sleep          2
          Capture Page Screenshot          capture-{index}.png

Logout
          LogoutKW
