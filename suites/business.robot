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
register
          Hire KW
          Input Text          name:email          ${ufjfreelancer}${gmail}
          Capture Page Screenshot          email-{index}.png
          Sleep          1
          Input Text          name:username          Freelancer
          Capture Page Screenshot          username-{index}.png
          Sleep          1
          Input Password          name:password          ${password}
          Sleep          1
          Click Element          css=.signUp
          Sleep          1
          Capture Page Screenshot          submit-{index}.png

login
          Click Element          xpath=//p[contains(.,'Sign In')]
          Login modal dialog
          Capture Page Screenshot          login-{index}.png
          Input Text          name:emailOrUserName          Freelancer
          Input Text          name:password          ${password}
          Click Element          id:login
          Wait Until Element Is Not Visible          xpath://button[contains(text(),'Login')]
          Capture Page Screenshot          login-user-{index}.png

avatar
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Profile & Personal Settings')]
          Scroll Element Into View          xpath=//h2[contains(text(),'Profile & Personal Settings')]
          Sleep          1
          #Wait Until Element Is Visible          name=add-photo
          ${id} =          Generate Random String          2          [NUMBERS]
          Choose File          name=add-photo          ${CURDIR}\\random\\${id}.jpg
          Capture Element Screenshot          name=add-photo
          Sleep          1
          Capture Page Screenshot          capture-{index}.png

Profile settings
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Profile & Personal Settings')]
          Input Text          id=firstName          ${freelancer}
          Input Text          id=lastName          ${freelancer}
          Click Element          xpath=//input[@id='female']          #female
          Input Text          xpath=//input[@id='dateOfBirth']          06-11-1994
          Input Text          id=description          ${description1}
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
          Input Text          css=.MultipleSelectSearch_input__34N1Q          English
          Click Element          xpath=//div[contains(text(),'English')]
          Capture Page Screenshot          language-{index}.png
          Click Element          xpath=//p[contains(.,'Fluency')]
          Click Element          xpath=//div[2]/div/div[4]          #Fluency Native
          Sleep          2
          Capture Page Screenshot          language-{index}.png
          Click Element          xpath=//button[contains(text(),'Save')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Profile Saved Successfully')]
          ${alert-success} =          Get Text          xpath=//div[contains(text(),'Profile Saved Successfully')]
          Log To Console          ${alert-success}
          Capture Element Screenshot          xpath://div[contains(text(),'Profile Saved Successfully')]
          Capture Page Screenshot          saved-profile-settings-{index}.png

logout
          LogoutKW
