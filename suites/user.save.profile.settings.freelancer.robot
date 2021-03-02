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
Register user
          [Tags]          saveSettings
          Get Hired KW
          #username
          ${username} =          Generate Random String          5          [UPPER]
          ${username} =          Set Variable          ${username}
          Set Suite Variable          ${username}
          #email
          ${radnom_email} =          Generate Random String          7          [NUMBERS]
          ${radnom_email}=          Set Variable          ${username}-${radnom_email}${email}
          Set Suite Variable          ${radnom_email}
          Input Text          name:username          ${username}
          Capture Page Screenshot          username-{index}.png
          Input Text          name:email          ${radnom_email}
          Capture Page Screenshot          email-{index}.png
          Input Password          name:password          ${password}
          Click Element          id=createAccount
          Capture Page Screenshot          submit-{index}.png
          #Click Element          xpath://span[contains(text(),'×')]
          #Wait Until Element Is Not Visible          class:modal-body

Login user
          [Tags]          saveSettings
          Wait Until Element Is Visible          xpath=//p[contains(.,'Sign In')]
          Click Element          xpath=//p[contains(.,'Sign In')]
          Capture Page Screenshot          login-{index}.png
          Login modal dialog
          Input Text          name:emailOrUserName          ${username}
          Input Text          name:password          ${password}
          Click Element          id:login
          Wait Until Element Is Not Visible          xpath://button[contains(text(),'Login')]
          Capture Page Screenshot          login-user-{index}.png

Required fields
          [Documentation]          In this test we are verify and assert elements on the page
          ...          Verify and assert alert message with the text for required fields.
          ...          Assert and verify alert message for DOB
          New Profile Settings page
          Capture Page Screenshot          profile-settings-tutorial-{index}.png
          Click Element          id=firstName
          Element Should Be Enabled          id=firstName
          Element Should Be Enabled          id=lastName
          Element Should Be Enabled          id=male
          Element Should Be Enabled          id=female
          Element Should Be Enabled          id=dateOfBirth
          Element Should Be Enabled          id=description
          Element Should Be Enabled          name=country
          Element Should Be Enabled          id=state
          Element Should Be Enabled          id=city
          Element Should Be Enabled          id=postal
          Element Should Be Enabled          id=street
          Element Should Be Enabled          id=language__name
          Scroll Element Into View          xpath=//button[contains(.,'Save')]
          Click Element          xpath=//button[contains(.,'Save')]
          Capture Page Screenshot          required-fields-{index}.png
          Log To Console          *Required
          #Required fields
          Wait Until Element Is Visible          xpath=//label/div          #First Name
          Element Text Should Be          xpath=//label/div          * Required
          Wait Until Element Is Visible          xpath=//div[2]/label/div          #Last Name
          Element Text Should Be          xpath=//div[2]/label/div          * Required
          Wait Until Element Is Visible          xpath=//div[3]/div/label/div          #Username
          Element Text Should Be          xpath=//div[3]/div/label/div          * Must be 18+
          Wait Until Element Is Visible          xpath=//div[4]/div/label/div          #Introduction
          Element Text Should Be          xpath=//div[4]/div/label/div          * Required
          Wait Until Element Is Visible          xpath=//div[5]/div/label/div          #Country
          Element Text Should Be          xpath=//div[5]/div/label/div          * Required
          Capture Page Screenshot          required-{index}.png
          Scroll Element Into View          xpath=//label/div
          Capture Page Screenshot          required-{index}.png
          Wait Until Element Is Visible          xpath=//div[6]/div/label/div          #City
          Element Text Should Be          xpath=//div[6]/div/label/div          * Required
          Wait Until Element Is Visible          xpath=//div[7]/div/label/div          #Address
          Element Text Should Be          xpath=//div[7]/div/label/div          * Required
          Wait Until Element Is Visible          xpath=//div[8]/label/div          #Languages
          Element Text Should Be          css=.Form_formRow__1Vd1z > label > .FormError_error__9PrCS          * At least one language is required
          Wait Until Element Is Visible          xpath=//form/div[3]
          Element Text Should Be          css=.Form_mainError__mfwgq          Some items need your attention
          #Date of birth
          Capture Page Screenshot          dob-{index}.png
          Input Text          id=dateOfBirth          06-11-1500
          Wait Until Element Is Visible          xpath=//div[3]/div/label/div          #* Exceeds Max Age
          Element Text Should Be          xpath=//div[3]/div/label/div          * Exceeds Max Age
          Capture Page Screenshot          dob-{index}.png
          Clear Element Text          id=dateOfBirth
          Input Text          id=dateOfBirth          06-11-0012
          Wait Until Element Is Visible          xpath=//div[3]/div/label/div          #* Invalid date
          Element Text Should Be          xpath=//div[3]/div/label/div          * Invalid date
          Capture Page Screenshot          dob-{index}.png
          Clear Element Text          id=dateOfBirth
          Capture Page Screenshot          clearDOB-{index}.png

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
          Input Text          xpath=//div[@id='language__name']/input          Serbian
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

Upload Avatar Picture
          [Documentation]          In this test we are testing upload avatar picture.
          Scroll Element Into View          xpath=//h2[contains(text(),'Profile Settings')]
          Sleep          3
          ${id} =          Generate Random String          2          [NUMBERS]
          Choose File          name:add-photo          ${CURDIR}\\random\\${id}.jpg
          Capture Element Screenshot          name=add-photo
          Sleep          2
          Capture Page Screenshot          capture-{index}.png

Professional page
          [Tags]          saveSettings
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Profile Settings')]
          Scroll Element Into View          xpath=//h2[contains(text(),'Profile Settings')]
          Click Link          /profile-settings/professional
          #Professional Settings
          Professional Settings page

Require fields
          Click Button          xpath=//button[contains(text(),'Update')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'* Required')]
          Element Should Be Visible          xpath=//div[contains(text(),'* Required')]
          Element Text Should Be          xpath=//div[contains(text(),'* Required')]          * Required
          Wait Until Element Is Visible          xpath=//div[contains(text(),'* required minimum 1 Professions')]
          Element Should Be Visible          xpath=//div[contains(text(),'* required minimum 1 Professions')]
          Element Text Should Be          xpath=//div[contains(text(),'* required minimum 1 Professions')]          * required minimum 1 Professions
          Wait Until Element Is Visible          xpath=//div[contains(text(),'* required minimum 2 skill')]
          Element Should Be Visible          xpath=//div[contains(text(),'* required minimum 2 skill')]
          Element Text Should Be          xpath=//div[contains(text(),'* required minimum 2 skill')]          * required minimum 2 skill
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Some items need your attention')]
          Element Should Be Visible          xpath=//div[contains(text(),'Some items need your attention')]
          Element Text Should Be          xpath=//div[contains(text(),'Some items need your attention')]          Some items need your attention

Test input
          ${professionTitle} =          Generate Random String          5          [UPPER]
          ${professionTitle} =          Set Variable          ${professionTitle}
          Set Suite Variable          ${professionTitle}
          Input Text          id=professionTitle          Virual Trainer ${professionTitle}
          ${radnom_amount} =          Generate Random String          2          [NUMBERS]
          ${radnom_amount}=          Set Variable          ${radnom_amount}
          Set Suite Variable          ${radnom_amount}
          Clear Element Text          id=rateAmount
          Input Text          id=rateAmount          ${radnom_amount}
          Capture Page Screenshot          rate-{index}.png
          #Click Element          xpath=//div[contains(text(),'Profession')]
          Click Element          xpath=//div[@id='profession']/div
          Capture Page Screenshot          profession-{index}.png
          Click Element          xpath=//div[4]
          Capture Page Screenshot          programming-and-tech-{index}.png
          Scroll Element Into View          xpath=//button[contains(text(),'Save')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Expertise')]
          Click Element          xpath=//div[contains(text(),'Expertise')]
          Capture Page Screenshot          expertise-{index}.png
          Click Element          xpath=//p[contains(text(),'Mobile development')]
          Capture Page Screenshot          1-{index}.png
          Click Element          xpath=//p[contains(text(),'Desktop Software development')]
          Capture Page Screenshot          2-{index}.png
          Click Element          xpath=//p[contains(text(),'Desktop Software development')]
          Capture Page Screenshot          3-{index}.png
          Click Element          xpath=//p[contains(text(),'QA & Testing')]
          Capture Page Screenshot
          Sleep          1
          Click Element          xpath=//b[contains(text(),'Sub Categories (optional)')]
          Input Text          xpath=//form[1]/div[1]/div[5]/div[1]/div[1]/div[1]/div[1]/input[1]          Selenium
          Sleep          1
          Click Element          xpath=//form[1]/div[1]/div[5]/div[1]/div[1]/div[1]/div[1]/i[1]
          Sleep          1
          Input Text          xpath=//form[1]/div[1]/div[5]/div[1]/div[1]/div[1]/div[1]/input[1]          Automation
          Click Element          xpath=//form[1]/div[1]/div[5]/div[1]/div[1]/div[1]/div[1]/i[1]
          Sleep          1
          Input Text          xpath=//form[1]/div[1]/div[5]/div[1]/div[1]/div[1]/div[1]/input[1]          ${professionTitle}
          Click Element          xpath=//form[1]/div[1]/div[5]/div[1]/div[1]/div[1]/div[1]/i[1]
          Click Button          xpath=//button[contains(text(),'Save')]
          Sleep          2
          ${alert-success} =          Get Text          xpath://div[contains(text(),'Profile Saved Successfully')]
          Log To Console          ${alert-success}
          Capture Page Screenshot          professional-settings-{index}.png

ID Verification
          Click Link          /profile-settings/identification
          ID Verification page
          Click Button          xpath=//button[contains(text(),'Save')]
          #alert messages
          Wait Until Element Is Visible          xpath=//div[contains(text(),'* minimum of 2 documents required')]
          Element Text Should Be          xpath=//div[contains(text(),'* minimum of 2 documents required')]          * minimum of 2 documents required
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Some items need your attention')]
          Element Text Should Be          xpath=//div[contains(text(),'Some items need your attention')]          Some items need your attention
          Click Element          xpath=//input[@id='passport']
          Click Button          xpath=//button[contains(text(),'Save')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'* minimum of 1 documents required')]
          Element Text Should Be          xpath=//div[contains(text(),'* minimum of 1 documents required')]          * minimum of 1 documents required
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Some items need your attention')]
          Element Text Should Be          xpath=//div[contains(text(),'Some items need your attention')]          Some items need your attention
          #add documents
          ${id} =          Generate Random String          2          [NUMBERS]
          Set Suite Variable          ${id}
          Choose File          id:file-drop          ${CURDIR}\\random\\${id}.jpg
          Scroll Element Into View          xpath=//button[contains(text(),'Save')]
          Capture Page Screenshot          upload-{index}.png
          Sleep          3
          Element Should Not Be Visible          xpath=//div[contains(text(),'No ID Documents Found')]          No ID Documents Found
          Click Button          xpath=//button[contains(text(),'Save')]
          Scroll Element Into View          xpath=//button[contains(text(),'Save')]
          Sleep          2
          Capture Page Screenshot          save-id-{index}.png

Emails & Notifications
          Click Link          /profile-settings/notifications
          Capture Page Screenshot          email-and-notifications-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Email & Notification')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Email & Notification')]
          Element Text Should Be          xpath=//h2[contains(text(),'Email & Notification')]          Email & Notification
          Element Should Be Enabled          xpath=//h2[contains(text(),'Email & Notification')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'What Notifications You Want to Receive')]
          Element Should Be Visible          xpath=//div[contains(text(),'What Notifications You Want to Receive')]
          Element Text Should Be          xpath=//div[contains(text(),'What Notifications You Want to Receive')]          What Notifications You Want to Receive
          Element Should Be Enabled          xpath=//div[contains(text(),'What Notifications You Want to Receive')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Emails for active Jobs')]
          Element Should Be Visible          xpath=//div[contains(text(),'Emails for active Jobs')]
          Element Text Should Be          xpath=//div[contains(text(),'Emails for active Jobs')]          Emails for active Jobs
          Element Should Be Enabled          xpath=//div[contains(text(),'Emails for active Jobs')]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/i[1]
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/i[1]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Emails for similar Jobs')]
          Element Should Be Visible          xpath=//div[contains(text(),'Emails for similar Jobs')]
          Element Text Should Be          xpath=//div[contains(text(),'Emails for similar Jobs')]          Emails for similar Jobs
          Element Should Be Enabled          xpath=//div[contains(text(),'Emails for similar Jobs')]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]/i[1]
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]/i[1]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Recommended Businesses')]
          Element Should Be Visible          xpath=//div[contains(text(),'Recommended Businesses')]
          Element Text Should Be          xpath=//div[contains(text(),'Recommended Businesses')]          Recommended Businesses
          Element Should Be Enabled          xpath=//div[contains(text(),'Recommended Businesses')]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[4]/div[1]/div[1]/div[1]/i[1]
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[4]/div[1]/div[1]/div[1]/i[1]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'UpRated Freelancer achieved notification')]
          Element Should Be Visible          xpath=//div[contains(text(),'UpRated Freelancer achieved notification')]
          Element Text Should Be          xpath=//div[contains(text(),'UpRated Freelancer achieved notification')]          UpRated Freelancer achieved notification
          Element Should Be Enabled          xpath=//div[contains(text(),'UpRated Freelancer achieved notification')]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[5]/div[1]/div[1]/div[1]/i[1]
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[5]/div[1]/div[1]/div[1]/i[1]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Freelancer Reminder Email')]
          Element Should Be Visible          xpath=//div[contains(text(),'Freelancer Reminder Email')]
          Element Text Should Be          xpath=//div[contains(text(),'Freelancer Reminder Email')]          Freelancer Reminder Email
          Element Should Be Enabled          xpath=//div[contains(text(),'Freelancer Reminder Email')]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[6]/div[1]/div[1]/div[1]/i[1]
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[6]/div[1]/div[1]/div[1]/i[1]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Digest Emails for Available Jobs')]
          Element Should Be Visible          xpath=//div[contains(text(),'Digest Emails for Available Jobs')]
          Element Text Should Be          xpath=//div[contains(text(),'Digest Emails for Available Jobs')]          Digest Emails for Available Jobs
          Element Should Be Enabled          xpath=//div[contains(text(),'Digest Emails for Available Jobs')]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[7]/div[1]/div[1]/div[1]/i[1]
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[7]/div[1]/div[1]/div[1]/i[1]
          #dropdown
          Click Element          class=ProfileEmailNotification_accordionToggle__2LkJT
          Click Element          class=DropDown_head__uLqnn
          Capture Page Screenshot          dropdown-{index}.png
          Capture Element Screenshot          class=DropDown_list_container__2XJvT
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Instantly')]
          Element Should Be Visible          xpath=//div[contains(text(),'Instantly')]
          Element Text Should Be          xpath=//div[contains(text(),'Instantly')]          Instantly
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Every Hour')]
          Element Should Be Visible          xpath=//div[contains(text(),'Every Hour')]
          Element Text Should Be          xpath=//div[contains(text(),'Every Hour')]          Every Hour
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/div[2]/div[3]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/div[2]/div[3]
          Element Text Should Be          xpath=//div[contains(text(),'Default')]          Default

Social Links
          Click Link          /profile-settings/social-links
          Capture Page Screenshot          social-links-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Social Links')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Social Links')]
          Element Text Should Be          xpath=//h2[contains(text(),'Social Links')]          Social Links
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[1]          These are apps and websites you've connected with UpForJobs.
          #fb
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/img[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/img[1]
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]          ${notconnected}
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]          ${fbsocial}
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/button[1]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/button[1]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/button[1]/div[1]          Link Now
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/button[1]/div[1]
          #instagram
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div[1]/img[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div[1]/img[1]
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div[1]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div[1]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div[1]/div[1]          ${notconnected}
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div[1]/div[2]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div[1]/div[2]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div[1]/div[2]          ${insocial}
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div[1]/button[1]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div[1]/button[1]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div[1]/button[1]/div[1]          Link Now
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div[1]/button[1]/div[1]
          #Linked In
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/img[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/img[1]
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/div[1]          ${notconnected}
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/div[2]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/div[2]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/div[2]          ${lnsocial}
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/button[1]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/button[1]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/button[1]/div[1]          Link Now
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/button[1]/div[1]
          #YouTube
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[4]/div[1]/img[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[4]/div[1]/img[1]
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[4]/div[1]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[4]/div[1]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[4]/div[1]/div[1]          ${notconnected}
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[4]/div[1]/div[2]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[4]/div[1]/div[2]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[4]/div[1]/div[2]          ${ytsocial}
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[4]/div[1]/button[1]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[4]/div[1]/button[1]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[4]/div[1]/button[1]/div[1]          Link Now
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[2]/div[4]/div[1]/button[1]/div[1]

Payment Settings
          Click Link          /profile-settings/payments
          Capture Page Screenshot
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Payment Settings')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Payment Settings')]
          Element Text Should Be          xpath=//h2[contains(text(),'Payment Settings')]          Payment Settings
          ${balance} =          Get Text          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]/div[1]/div[2]
          Log To Console          ${balance}
          Capture Element Screenshot          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]
          #Your Payment Methods & Settings
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Your Payment Methods & Settings')]
          Element Should Be Visible          xpath=//div[contains(text(),'Your Payment Methods & Settings')]
          Element Text Should Be          xpath=//div[contains(text(),'Your Payment Methods & Settings')]          Your Payment Methods & Settings
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Wallet')]
          Element Should Be Visible          xpath=//div[contains(text(),'Wallet')]
          Element Text Should Be          xpath=//div[contains(text(),'Wallet')]          Wallet
          Wait Until Element Is Visible          xpath=//div[contains(text(),'your Current Balance is:')]
          Element Should Be Visible          xpath=//div[contains(text(),'your Current Balance is:')]
          Element Text Should Be          xpath=//div[contains(text(),'your Current Balance is:')]          your Current Balance is:
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Your payment methods')]
          Element Should Be Visible          xpath=//div[contains(text(),'Your payment methods')]
          Element Text Should Be          xpath=//div[contains(text(),'Your payment methods')]          Your payment methods
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Manage Finances')]
          Element Should Be Visible          xpath=//button[contains(text(),'Manage Finances')]
          Element Text Should Be          xpath=//button[contains(text(),'Manage Finances')]          Manage Finances
          Element Should Be Enabled          xpath=//button[contains(text(),'Manage Finances')]
          #paypal
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[2]/div[1]/img[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[2]/div[1]/img[1]
          #american express
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[3]/div[1]/img[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[3]/div[1]/img[1]
          #iPay
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[4]/div[1]/img[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[4]/div[1]/img[1]
          #mastercard
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[5]/div[1]/img[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[5]/div[1]/img[1]
          #visa
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[6]/div[1]/img[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[6]/div[1]/img[1]
          #curecny type
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Currency Type')]
          Element Should Be Visible          xpath=//div[contains(text(),'Currency Type')]
          Element Text Should Be          xpath=//div[contains(text(),'Currency Type')]          Currency Type
          #dropdown
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[2]/div[1]
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[2]/div[1]
          Scroll Element Into View          xpath=//button[contains(text(),'View History')]
          Click Element          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[2]/div[1]
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[2]/div[2]/div[2]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[2]/div[2]/div[2]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[2]/div[2]/div[2]/div[1]          USD
          Element Should Be Visible          xpath=//div[contains(text(),'EUR')]
          Element Text Should Be          xpath=//div[contains(text(),'EUR')]          EUR
          Element Should Be Visible          xpath=//div[contains(text(),'INR')]
          Element Text Should Be          xpath=//div[contains(text(),'INR')]          INR
          Capture Element Screenshot          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[2]/div[2]
          Click Element          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[2]/div[2]/div[1]/img[1]
          Sleep          1
          #Payments & Transactions History
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Payments & Transactions History')]
          Element Should Be Visible          xpath=//div[contains(text(),'Payments & Transactions History')]
          Element Text Should Be          xpath=//div[contains(text(),'Payments & Transactions History')]          Payments & Transactions History
          Wait Until Element Is Visible          xpath=//button[contains(text(),'View History')]
          Element Should Be Enabled          xpath=//button[contains(text(),'View History')]
          Element Text Should Be          xpath=//button[contains(text(),'View History')]          View History

Password & Security
          Click Link          /profile-settings/security
          Capture Page Screenshot          password-and-security-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Password & Security')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Password & Security')]
          Element Text Should Be          xpath=//h2[contains(text(),'Password & Security')]          Password & Security
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Password & Two Factor Authentication')]
          Element Should Be Visible          xpath=//div[contains(text(),'Password & Two Factor Authentication')]
          Element Text Should Be          xpath=//div[contains(text(),'Password & Two Factor Authentication')]          Password & Two Factor Authentication
          #Login Devices
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Login Devices')]
          Element Should Be Visible          xpath=//div[contains(text(),'Login Devices')]
          Element Text Should Be          xpath=//div[contains(text(),'Login Devices')]          Login Devices
          Capture Element Screenshot          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]
          #Login
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]          Login
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Change Password')]
          Element Should Be Visible          xpath=//div[contains(text(),'Change Password')]
          Element Text Should Be          xpath=//div[contains(text(),'Change Password')]          Change Password
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Choose a stronger password')]
          Element Should Be Visible          xpath=//div[contains(text(),'Choose a stronger password')]
          Element Text Should Be          xpath=//div[contains(text(),'Choose a stronger password')]          Choose a stronger password
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[1]/button[1]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[1]/button[1]/div[1]
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[1]/button[1]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[1]/button[1]/div[1]          Edit
          Click Element          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[1]/button[1]/div[1]
          Wait Until Element Is Visible          id=password
          Element Should Be Visible          id=password
          Element Should Be Enabled          id=password
          Wait Until Element Is Visible          id=confirmedPassword
          Element Should Be Visible          id=confirmedPassword
          Element Should Be Enabled          id=confirmedPassword
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[4]/div[1]/div[2]/form[1]/button[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[4]/div[1]/div[2]/form[1]/button[1]
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[4]/div[1]/div[2]/form[1]/button[1]
          Capture Element Screenshot          xpath=//body/div[@id='root']/div[1]/section[1]/div[2]/div[3]/div[1]/div[1]/div[3]
          Click Element          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[4]/div[1]/div[2]/form[1]/button[1]
          Element Text Should Not Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[4]/div[1]/div[2]/form[1]/button[1]          Edit
          #alert message - Required!
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[4]/div[1]/div[2]/form[1]/div[1]/div[2]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[4]/div[1]/div[2]/form[1]/div[1]/div[2]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[4]/div[1]/div[2]/form[1]/div[1]/div[2]          Required!
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[4]/div[1]/div[2]/form[1]/div[2]/div[2]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[4]/div[1]/div[2]/form[1]/div[2]/div[2]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[4]/div[1]/div[2]/form[1]/div[2]/div[2]          Required!
          Element Text Should Be          xpath=//div[contains(text(),'Close')]          Close
          Capture Element Screenshot          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]
          Scroll Element Into View          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[1]
          #Two Factor Authentication
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[1]          Two Factor Authentication
          #Delivery Preference
          Wait Until Element Is Visible          xpath=//p[contains(text(),'Delivery Preference')]
          Element Should Be Visible          xpath=//p[contains(text(),'Delivery Preference')]
          Element Text Should Be          xpath=//p[contains(text(),'Delivery Preference')]          Delivery Preference
          Wait Until Element Is Visible          xpath=//span[contains(text(),'(Email)')]
          Element Should Be Visible          xpath=//span[contains(text(),'(Email)')]
          Element Text Should Be          xpath=//span[contains(text(),'(Email)')]          (Email)
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[2]/div[1]/button[1]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[2]/div[1]/button[1]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[2]/div[1]/button[1]/div[1]          Edit
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[2]/div[1]/button[1]/div[1]
          Wait Until Element Is Visible          xpath=//p[contains(text(),'Email Address')]
          Element Should Be Visible          xpath=//p[contains(text(),'Email Address')]
          Element Text Should Be          xpath=//p[contains(text(),'Email Address')]          Email Address
          Wait Until Element Is Visible          xpath=//span[contains(text(),'(${radnom_email})')]
          Element Should Be Visible          xpath=//span[contains(text(),'(${radnom_email})')]
          Element Text Should Be          xpath=//span[contains(text(),'(${radnom_email})')]          (${radnom_email})
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[3]/div[1]/button[1]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[3]/div[1]/button[1]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[3]/div[1]/button[1]/div[1]          Edit
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[3]/div[1]/button[1]/div[1]
          Wait Until Element Is Visible          xpath=//p[contains(text(),'Phone Number')]
          Element Should Be Visible          xpath=//p[contains(text(),'Phone Number')]
          Element Text Should Be          xpath=//p[contains(text(),'Phone Number')]          Phone Number
          Wait Until Element Is Visible          xpath=//span[contains(text(),'(No phone number saved)')]
          Element Should Be Visible          xpath=//span[contains(text(),'(No phone number saved)')]
          Element Text Should Be          xpath=//span[contains(text(),'(No phone number saved)')]          (No phone number saved)
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[4]/div[1]/button[1]/div[1]
          Element Should Be Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[4]/div[1]/button[1]/div[1]
          Element Text Should Be          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[4]/div[1]/button[1]/div[1]          Edit
          Element Should Be Enabled          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[4]/div[1]/button[1]/div[1]
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]
          Scroll Element Into View          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]
          Capture Element Screenshot          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]
          Click Element          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[2]/div[1]/button[1]/div[1]
          Click Element          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[3]/div[1]/button[1]/div[1]
          Click Element          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]/div[4]/div[1]/button[1]/div[1]
          Scroll Element Into View          xpath=//p[contains(text(),'Phone Number')]
          Capture Element Screenshot          xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[4]

Side Main Menu
          Sleep          5
          Click Element          xpath=//i[@id='sideMenuToggleIcon']
          Wait Until Element Is Visible          xpath=//header/div[1]/div[2]/a[5]
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Portfolio')]
          #side main menu
          Wait Until Element Is Visible          xpath=//header/div[1]/div[1]/div[1]/a[1]/img[1]
          Wait Until Element Is Visible          id=homeLink
          Element Should Be Enabled          id=homeLink
          Wait Until Element Is Visible          id=profileLink
          Element Should Be Enabled          id=profileLink
          Wait Until Element Is Visible          id=profileSettingsLink
          Element Should Be Enabled          id=profileSettingsLink
          Wait Until Element Is Visible          class=sideMenuIconWrapper
          Element Should Be Enabled          class=sideMenuIconWrapper
          Element Text Should Be          class=sideMenuIconWrapper          CLOSE MENU
          Wait Until Element Is Visible          id=logoutLink
          Element Should Be Enabled          id=logoutLink
          Element Text Should Be          id=logoutLink          Logout
          Click Element          link:Portfolio

Portfolio
          Sleep          5
          #breadcrumbs
          Portfolio Breadcrumbs
          Raw Portfolio page
          #create collection
          Click Element          xpath=//div[1]/div[1]/div[2]/div[1]/div[2]/button[1]
          Sleep          3
          Create Collection page
          #Create Collection
          ${number_title}          Generate Random String          1          [NUMBERS]
          ${random_title}          Generate Random String          5          [LETTERS]
          Input Text          id=title          No ${number_title} Collection ${random_title}
          Capture Page Screenshot          title-{index}.png
          #description
          ${number_description}          Generate Random String          1          [LETTERS]
          ${random_description}          Generate Random String          5          [LETTERS]
          Input Text          id=description          No ${number_description} Collection ${description1} ${random_description}
          Scroll Element Into View          xpath=//form[1]/div[2]/div[1]/img[1]
          Capture Page Screenshot          description-{index}.png
          #command
          ${id} =          Generate Random String          1          [NUMBERS]
          Choose File          class=ManagePortfolio_FileInputSquare__input__39gdc          ${CURDIR}\\random\\c0${id}.jpg
          Wait Until Element Is Visible          xpath=//body/div[@id='root']/div[1]/div[1]/div[2]/div[1]/div[4]/form[1]/div[2]/div[1]/div[1]
          Capture Element Screenshot          xpath=//body/div[@id='root']/div[1]/div[1]/div[2]/div[1]/div[4]/form[1]/div[2]/div[1]/div[1]
          #          //form[1]/div[2]/div[2]/div[1]
          Sleep          2
          Scroll Element Into View          xpath=//div[1]/div[1]/div[2]/div[1]/div[5]/div[1]
          Capture Page Screenshot          capture-{index}.png
          Click Button          xpath=//form[1]/div[3]/button[1]
          #Save collection
          Element Should Be Enabled          xpath=//div[1]/div[1]/div[2]/div[1]/div[3]/div[3]/button[1]
          Click Button          xpath=//div[1]/div[1]/div[2]/div[1]/div[3]/div[3]/button[1]
          #modal
          Portfolio modal
          #command
          Click Element          xpath=//div[1]/div[1]/div[2]/div[1]/div[4]/div[1]/div[2]/div[3]/a[2]/button[1]
          Wait Until Element Is Visible          class=Profile_profileRightSideContainer__A6iXd
          Capture Element Screenshot          class=Profile_profileRightSideContainer__A6iXd

Create Portfolio
          Create Multiple Portfolio
          Create Multiple Portfolio
          Create Multiple Portfolio
          Create Multiple Portfolio

Post a Contest
          Post a Job Contest

Post a Project
          Post a Job Project
          1st step
          2nd step
          3rd step Contest
          4th step page Project

Logout again
          [Tags]          saveSettings
          LogoutKW

*** Keywords ***
