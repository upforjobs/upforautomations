*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Library                 SeleniumLibrary
Library                 String
Library                 XvfbRobot
Resource                _keywords.txt
Resource                _mysetup.txt

*** Variables ***
${TMP_PATH}             /tmp

*** Test Cases ***
Login
          Login Freelancer KW

Go to Profile settings page Freelancer
          Click Link          /profile-settings
          #Wait Until Element Is Visible          xpath://div[1]/div[1]/div[1]/div[2]
          #Click Element          xpath://div[1]/div[1]/div[1]/div[2]
          Capture Page Screenshot          profile-settings-{index}.png
          #Profile settings root freelancer
          Wait Until Element Is Visible          xpath://div[2]/div[2]/div[1]/div[2]
          Element Should Be Visible          xpath://div[2]/div[2]/div[1]/div[2]
          Element Text Should Be          xpath://div[contains(text(),'Profile Settings')]          Profile Settings
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
          #Element Text Should Be          xpah://div[contains(text(),'GENDER:')]          gender:
          Wait Until Element Is Visible          xpath://div[contains(text(),'Male')]
          Element Should Be Visible          xpath://div[contains(text(),'Male')]
          Element Text Should Be          xpath://div[contains(text(),'Male')]          Male
          Wait Until Element Is Visible          xpath://div[contains(text(),'Female')]
          Element Should Be Visible          xpath://div[contains(text(),'Female')]
          Element Text Should Be          xpath://div[contains(text(),'Female')]          Female
          Wait Until Element Is Visible          xpath://div[contains(text(),'STATUS:')]
          Element Should Be Visible          xpath://div[contains(text(),'STATUS:')]
          Element Text Should Be          xpath://div[contains(text(),'STATUS:')]          STATUS:
          Wait Until Element Is Visible          xpath://div[1]/div[2]/div[2]/div[2]/div[1]/div[2]
          Element Should Be Visible          xpath://div[1]/div[2]/div[2]/div[2]/div[1]/div[2]
          Element Text Should Be          xpath://div[1]/div[2]/div[2]/div[2]/div[1]/div[2]          Available
          Wait Until Element Is Visible          xpath://div[contains(text(),'Available to work')]
          Element Should Be Visible          xpath://div[contains(text(),'Available to work')]
          Element Text Should Be          xpath://div[contains(text(),'Available to work')]          Available to work
          Wait Until Element Is Visible          xpath://div[2]/div[3]/div[1]/div[2]
          Element Should Be Visible          xpath://div[2]/div[3]/div[1]/div[2]
          Element Text Should Be          xpath://div[2]/div[3]/div[1]/div[2]          Busy
          Wait Until Element Is Visible          xpath://div[contains(text(),'Busy but open to offers')]
          Element Should Be Visible          xpath://div[contains(text(),'Busy but open to offers')]
          Element Text Should Be          xpath://div[contains(text(),'Busy but open to offers')]          Busy but open to offers
          Wait Until Element Is Visible          xpath://div[contains(text(),'Not Available')]
          Element Should Be Visible          xpath://div[contains(text(),'Not Available')]
          Element Text Should Be          xpath://div[contains(text(),'Not Available')]          Not Available
          Wait Until Element Is Visible          xpath://div[contains(text(),'Not available to work')]
          Element Should Be Visible          xpath://div[contains(text(),'Not available to work')]
          Element Text Should Be          xpath://div[contains(text(),'Not available to work')]          Not available to work
          Wait Until Element Is Visible          xpath://div[contains(text(),'HIDE / SHOW')]
          Element Should Be Visible          xpath://div[contains(text(),'HIDE / SHOW')]
          Element Text Should Be          xpath://div[contains(text(),'HIDE / SHOW')]          HIDE / SHOW
          Wait Until Element Is Visible          xpath://button[contains(text(),'Edit Visibility')]
          Element Should Be Visible          xpath://button[contains(text(),'Edit Visibility')]
          Element Text Should Be          xpath://button[contains(text(),'Edit Visibility')]          Edit Visibility
          Element Should Be Enabled          xpath://button[contains(text(),'Edit Visibility')]

Profile Settings
          [Documentation]          In this test we are testing entering text in all input fields
          ...          assert and verifyy that Alert message with the text for success is present.
          [Tags]          saveSettings
          Capture Page Screenshot          profile-settings-{index}.png
          Input Text          id=firstName          ${username}
          Input Text          id=lastName          ${username}
          Click Button          id=male
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
          Element Should Be Enabled          id=language__name
          #language
          Scroll Element Into View          xpath=//button[contains(.,'Save')]
          Capture Page Screenshot          description-{index}.png
          Input Text          id=language__name          English
          Click Element          xpath=//div[contains(text(),'Serbian')]
          Capture Page Screenshot          language-{index}.png
          Click Element          id=language__fluency
          Click Element          xpath=//div[contains(text(),'Native')]          #Fluency Biginner
          Sleep          2
          Wait Until Element Is Visible          xpath=//div[8]/div/div/div[3]
          Element Should Be Enabled          xpath=//div[8]/div/div/div[3]
          Capture Page Screenshot          language-{index}.png
          Click Element          xpath=//button[contains(text(),'Save')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Profile Saved Successfully')]
          ${alert-success} =          Get Text          xpath=//div[contains(text(),'Profile Saved Successfully')]
          Log To Console          ${alert-success}
          Capture Element Screenshot          xpath://div[contains(text(),'Profile Saved Successfully')]
          Capture Page Screenshot          saved-profile-settings-{index}.png

test - Upload Avatar Picture
          [Documentation]          In this test we are testing upload avatar picture.
          Scroll Element Into View          xpath=//h2[contains(text(),'Profile Settings')]
          Sleep          3
          ${id} =          Generate Random String          2          [NUMBERS]
          Choose File          name:add-photo          ${CURDIR}\\random\\${id}.jpg
          Capture Element Screenshot          name=add-photo
          Sleep          2
          Capture Page Screenshot          capture-{index}.png
