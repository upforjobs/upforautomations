*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Resource          _keywords.txt
Resource          _mysetup.txt
Library           SeleniumLibrary
Library           String

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Login
    [Tags]    saveSettings
    UFJLogin

Register user
    [Tags]    saveSettings
    Wait Until Element Is Visible    xpath=//p[contains(.,'Sign In')]
    Click Element    xpath=//p[contains(.,'Sign In')]
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Signup')]
    Click Element    xpath=//div[contains(text(),'Signup')]
    Sign in modal
    Click Element    name=get-hired
    #username
    ${no} =    Generate Random String    4    [LETTERS]
    ${no} =    Set Variable    ${no}
    Set Suite Variable    ${no}
    #email
    Input Text    name:username    ${freelancer}${no}
    Capture Page Screenshot    username-{index}.png
    Input Text    name:email    ${freelancer}${no}${freelancer_email}
    Capture Page Screenshot    email-{index}.png
    Input Password    name:password    ${password}
    Click Element    id=createAccount
    Capture Page Screenshot    submit-{index}.png
    #Click Element    xpath://span[contains(text(),'×')]
    #Wait Until Element Is Not Visible    class:modal-body
    Sleep    5
    Click Element    class=close
    #    xpath=//span[contains(text(),'×')]

Login user
    [Tags]    saveSettings
    Sleep    5
    Wait Until Element Is Visible    xpath=//p[contains(.,'Sign In')]
    Element Should Be Visible    xpath=//p[contains(.,'Sign In')]
    Click Element    xpath=//p[contains(.,'Sign In')]
    Capture Page Screenshot    login-{index}.png
    Login modal dialog
    Input Text    name:emailOrUserName    ${freelancer}${no}
    Input Text    name:password    ${password}
    Click Element    id:login
    Wait Until Element Is Not Visible    xpath://button[contains(text(),'Login')]
    Capture Page Screenshot    login-user-{index}.png

Required fields
    [Documentation]    In this test we are verify and assert elements on the page
    ...    Verify and assert alert message with the text for required fields.
    ...    Assert and verify alert message for DOB
    New Profile Settings page
    Capture Page Screenshot    profile-settings-tutorial-{index}.png
    Click Element    id=firstName
    Element Should Be Enabled    id=firstName
    Element Should Be Enabled    id=lastName
    Element Should Be Enabled    id=MALE
    Element Should Be Enabled    id=FEMALE
    Element Should Be Enabled    id=dateOfBirth
    Element Should Be Enabled    id=description
    Element Should Be Enabled    name=country
    Element Should Be Enabled    id=state
    Element Should Be Enabled    id=city
    Element Should Be Enabled    id=postal
    Element Should Be Enabled    id=street
    Element Should Be Enabled    id=language__name
    Scroll Element Into View    xpath=//button[contains(.,'Save')]
    Click Element    xpath=//button[contains(.,'Save')]
    Capture Page Screenshot    required-fields-{index}.png
    Log To Console    *Required
    #Required fields
    Wait Until Element Is Visible    xpath=//label/div    #First Name
    Element Text Should Be    xpath=//label/div    * Required
    Wait Until Element Is Visible    xpath=//div[2]/label/div    #Last Name
    Element Text Should Be    xpath=//div[2]/label/div    * Required
    Wait Until Element Is Visible    xpath=//div[3]/div/label/div    #Username
    Element Text Should Be    xpath=//div[contains(text(),'* Invalid date')]    * Invalid date
    Wait Until Element Is Visible    xpath=//div[4]/div/label/div    #Introduction
    Element Text Should Be    xpath=//div[4]/div/label/div    * Required
    Wait Until Element Is Visible    xpath=//div[5]/div/label/div    #Country
    Element Text Should Be    xpath=//div[5]/div/label/div    * Required
    Capture Page Screenshot    required-{index}.png
    Scroll Element Into View    xpath=//label/div
    Capture Page Screenshot    required-{index}.png
    Wait Until Element Is Visible    xpath=//div[6]/div/label/div    #City
    Element Text Should Be    xpath=//div[6]/div/label/div    * Required
    Wait Until Element Is Visible    xpath=//div[7]/div/label/div    #Address
    Element Text Should Be    xpath=//div[7]/div/label/div    * Required
    Wait Until Element Is Visible    xpath=//div[8]/label/div    #Languages
    Element Text Should Be    css=.Form_formRow__1Vd1z > label > .FormError_error__9PrCS    * At least one language is required
    Wait Until Element Is Visible    xpath=//form/div[3]
    Element Text Should Be    css=.Form_mainError__mfwgq    Some items need your attention
    #Date of birth
    Capture Page Screenshot    dob-{index}.png
    Input Text    id=dateOfBirth    06/11/2008
    Sleep    2
    Element Text Should Be    xpath=//div[contains(text(),'* Must be 16+')]    * Must be 16+
    Capture Page Screenshot    dob-{index}.png
    Clear Element Text    id=dateOfBirth
    Input Text    id=dateOfBirth    06-11-0012
    Wait Until Element Is Visible    xpath=//div[3]/div/label/div    #* Invalid date
    Element Text Should Be    xpath=//div[3]/div/label/div    * Invalid date
    Capture Page Screenshot    dob-{index}.png
    Clear Element Text    id=dateOfBirth
    Capture Page Screenshot    clearDOB-{index}.png

Profile Settings
    [Documentation]    In this test we are testing entering text in all input fields
    ...    assert and verifyy that Alert message with the text for success is present.
    [Tags]    saveSettings
    Capture Page Screenshot    profile-settings-{index}.png
    Input Text    id=firstName    ${freelancer}${no}
    Input Text    id=lastName    ${freelancer}${no}
    Click Button    id=FEMALE
    Input Text    id=dateOfBirth    06-11-1994
    Input Text    id=description    ${description1} ${description}
    Capture Page Screenshot    gender-{index}.png
    #Country
    Scroll Element Into View    id=language__fluency
    Click Element    name=country
    Input Text    name=country    United States
    Capture Page Screenshot    country-{index}.png
    Click Element    css=.DropDownSearch_item__5UoLs:nth-child(1)    #United States
    Wait Until Element Is Not Visible    xpath=//div[5]/div/label/div    #Country
    Element Should Not Be Visible    xpath=//div[5]/div/label/div
    #Input Text    id=state    Nevada
    Input Text    name=city    La
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Las Vegas')]
    Click Element    xpath=//div[contains(text(),'Las Vegas')]
    Input Text    id=postal    postal
    Input Text    id=street    Random Street
    Element Should Be Enabled    css=.MultipleSelectSearch_input__34N1Q
    #language
    Scroll Element Into View    xpath=//button[contains(.,'Save')]
    Capture Page Screenshot    description-{index}.png
    Click Element    css=.MultipleSelectSearch_input__34N1Q
    Input Text    css=.MultipleSelectSearch_input__34N1Q    Eng
    Wait Until Element Is Visible    xpath=//div[contains(text(),'English')]
    Click Element    xpath=//div[contains(text(),'English')]
    Capture Page Screenshot    language-{index}.png
    Click Element    xpath=//p[contains(.,'Fluency')]
    Click Element    xpath=//div[contains(text(),'Native')]    #Fluency Native
    Sleep    2
    Capture Page Screenshot    language-{index}.png
    Click Element    xpath=//button[contains(text(),'Save')]
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Profile Saved Successfully')]
    ${alert-success} =    Get Text    xpath=//div[contains(text(),'Profile Saved Successfully')]
    Log To Console    ${alert-success}
    Capture Element Screenshot    xpath://div[contains(text(),'Profile Saved Successfully')]
    Capture Page Screenshot    saved-profile-settings-{index}.png
    Click Element    xpath=//div[contains(text(),'Profile Saved Successfully')]

Upload Avatar Picture
    [Documentation]    In this test we are testing upload avatar picture.
    #Scroll Element Into View    xpath=//h2[contains(text(),'Professional Settings')]
    Wait Until Element Is Visible    xpath=//h2[contains(text(),'Professional Settings')]
    Sleep    1
    ${id} =    Generate Random String    1    [NUMBERS]
    Choose File    name:add-photo    ${CURDIR}\\random\\avatars\\female\\0${id}.jpg
    Capture Element Screenshot    name=add-photo
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Profile Image Updated Successfully')]
    Element Text Should Be    xpath=//div[contains(text(),'Profile Image Updated Successfully')]    Profile Image Updated Successfully
    Click Element    xpath=//div[contains(text(),'Profile Image Updated Successfully')]
    Sleep    2
    Capture Page Screenshot    capture-{index}.png

Professional page
    [Tags]    saveSettings
    Wait Until Element Is Visible    xpath=//h2[contains(text(),'Professional Settings')]
    Scroll Element Into View    xpath=//h2[contains(text(),'Professional Settings')]
    Click Link    /profile-settings/professional
    #Professional Settings
    Professional Settings page

Require fields
    Click Button    xpath=//button[contains(text(),'Update')]
    Wait Until Element Is Visible    xpath=//div[contains(text(),'* Required')]
    Element Should Be Visible    xpath=//div[contains(text(),'* Required')]
    Element Text Should Be    xpath=//div[contains(text(),'* Required')]    * Required
    Wait Until Element Is Visible    xpath=//div[contains(text(),'* Required minimum 1 Profession')]
    Element Should Be Visible    xpath=//div[contains(text(),'* Required minimum 1 Profession')]
    Element Text Should Be    xpath=//div[contains(text(),'* Required minimum 1 Profession')]    * Required minimum 1 Profession
    Wait Until Element Is Visible    xpath=//div[contains(text(),'* Required minimum 4 skills')]
    Element Should Be Visible    xpath=//div[contains(text(),'* Required minimum 4 skills')]
    Element Text Should Be    xpath=//div[contains(text(),'* Required minimum 4 skills')]    * Required minimum 4 skills
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Some items need your attention')]
    Element Should Be Visible    xpath=//div[contains(text(),'Some items need your attention')]
    Element Text Should Be    xpath=//div[contains(text(),'Some items need your attention')]    Some items need your attention

Test input
    ${professionTitle} =    Generate Random String    5    [LETTERS]
    ${professionTitle} =    Set Variable    ${professionTitle}
    Set Suite Variable    ${professionTitle}
    Input Text    id=professionTitle    ${professionqa} ${professionTitle}
    ${radnom_amount} =    Generate Random String    2    [NUMBERS]
    ${radnom_amount}=    Set Variable    ${radnom_amount}
    Set Suite Variable    ${radnom_amount}
    Clear Element Text    id=rateAmount
    Input Text    id=rateAmount    ${radnom_amount}
    Capture Page Screenshot    rate-{index}.png
    Input Text    id=tagline    ${no}a${no} ${professionTitle}
    Click Element    xpath=//div[@id='profession']/div
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Programming & Tech')]
    Click Element    xpath=//div[contains(text(),'Programming & Tech')]
    Capture Page Screenshot    profession-{index}.png
    Scroll Element Into View    id=submit
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Expertise')]
    Click Element    xpath=//div[contains(text(),'Expertise')]
    Capture Page Screenshot    expertise-{index}.png
    Click Element    xpath=//div[contains(text(),'QA & Testing')]
    Capture Page Screenshot    1-{index}.png
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Expertise')]
    Click Element    xpath=//div[contains(text(),'Expertise')]
    Click Element    xpath=//div[contains(text(),'Web Development')]
    Capture Page Screenshot    2-{index}.png
    Sleep    1
    Capture Page Screenshot    closing-dropdown-expertise-{index}.png
    Input Text    id=skills    Selenium
    Sleep    1
    Click Element    xpath=//div[contains(text(),'Selenium Webdriver')]
    Sleep    1
    Input Text    xpath=//div[5]/div[1]/div[1]/div[1]/div[1]/input[1]    Automation
    Click Element    xpath=//div[contains(text(),'Test Automation')]
    Sleep    1
    Input Text    id=skills    test
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Test Plan Writing')]
    Click Element    xpath=//div[contains(text(),'Test Plan Writing')]
    Input Text    id=skills    test
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Software Testing')]
    Click Element    xpath=//div[contains(text(),'Software Testing')]
    Sleep    1
    Click Button    id=submit
    Sleep    2
    ${alert-success} =    Get Text    xpath=//div[contains(text(),'Profile Saved Successfully')]
    Log To Console    ${alert-success}
    Capture Page Screenshot    professional-settings-{index}.png
    Click Element    xpath=//div[contains(text(),'Profile Saved Successfully')]

Emails & Notifications
    Click Link    /profile-settings/notifications
    Capture Page Screenshot    email-and-notifications-{index}.png
    Wait Until Element Is Visible    xpath=//h2[contains(text(),'Emails & Notifications')]
    Element Should Be Visible    xpath=//h2[contains(text(),'Emails & Notifications')]
    Element Text Should Be    xpath=//h2[contains(text(),'Emails & Notifications')]    Emails & Notifications
    Wait Until Element Is Visible    xpath=//div[contains(text(),'What Notifications You Want to Receive')]
    Element Should Be Visible    xpath=//div[contains(text(),'What Notifications You Want to Receive')]
    Element Text Should Be    xpath=//div[contains(text(),'What Notifications You Want to Receive')]    What Notifications You Want to Receive
    Element Should Be Enabled    xpath=//div[contains(text(),'What Notifications You Want to Receive')]
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Emails for active Jobs')]
    Element Should Be Visible    xpath=//div[contains(text(),'Emails for active Jobs')]
    Element Text Should Be    xpath=//div[contains(text(),'Emails for active Jobs')]    Emails for active Jobs
    Element Should Be Enabled    xpath=//div[contains(text(),'Emails for active Jobs')]
    Element Should Be Visible    xpath=//div[1]/div[2]/div[1]/div[2]/i[1]
    Element Should Be Enabled    xpath=//div[1]/div[2]/div[1]/div[2]/i[1]
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Emails for similar Jobs')]
    Element Should Be Visible    xpath=//div[contains(text(),'Emails for similar Jobs')]
    Element Text Should Be    xpath=//div[contains(text(),'Emails for similar Jobs')]    Emails for similar Jobs
    Element Should Be Enabled    xpath=//div[contains(text(),'Emails for similar Jobs')]
    Element Should Be Visible    xpath=//div[1]/div[3]/div[1]/div[2]/i[1]
    Element Should Be Enabled    xpath=//div[1]/div[3]/div[1]/div[2]/i[1]
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Recommended Businesses')]
    Element Should Be Visible    xpath=//div[contains(text(),'Recommended Businesses')]
    Element Text Should Be    xpath=//div[contains(text(),'Recommended Businesses')]    Recommended Businesses
    Element Should Be Enabled    xpath=//div[contains(text(),'Recommended Businesses')]
    Element Should Be Visible    xpath=//div[1]/div[4]/div[1]/div[2]/i[1]
    Element Should Be Enabled    xpath=//div[1]/div[4]/div[1]/div[2]/i[1]
    Wait Until Element Is Visible    xpath=//div[contains(text(),'UpRated Freelancer achieved notification')]
    Element Should Be Visible    xpath=//div[contains(text(),'UpRated Freelancer achieved notification')]
    Element Text Should Be    xpath=//div[contains(text(),'UpRated Freelancer achieved notification')]    UpRated Freelancer achieved notification
    Element Should Be Enabled    xpath=//div[contains(text(),'UpRated Freelancer achieved notification')]
    Element Should Be Visible    xpath=//div[1]/div[5]/div[1]/div[2]/i[1]
    Element Should Be Enabled    xpath=//div[1]/div[5]/div[1]/div[2]/i[1]
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Freelancer Reminder Email')]
    Element Should Be Visible    xpath=//div[contains(text(),'Freelancer Reminder Email')]
    Element Text Should Be    xpath=//div[contains(text(),'Freelancer Reminder Email')]    Freelancer Reminder Email
    Element Should Be Enabled    xpath=//div[contains(text(),'Freelancer Reminder Email')]
    Element Should Be Visible    xpath=//div[1]/div[6]/div[1]/div[2]/i[1]
    Element Should Be Enabled    xpath=//div[1]/div[6]/div[1]/div[2]/i[1]
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Digest Emails for Available Jobs')]
    Element Should Be Visible    xpath=//div[contains(text(),'Digest Emails for Available Jobs')]
    Element Text Should Be    xpath=//div[contains(text(),'Digest Emails for Available Jobs')]    Digest Emails for Available Jobs
    Element Should Be Enabled    xpath=//div[contains(text(),'Digest Emails for Available Jobs')]
    Element Should Be Visible    xpath=//div[1]/div[7]/div[1]/div[2]/i[1]
    Element Should Be Enabled    xpath=//div[1]/div[7]/div[1]/div[2]/i[1]
    Wait Until Element Is Visible    xpath=//div[2]/div[3]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]
    Element Should Be Visible    xpath=//div[2]/div[3]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]
    Element Text Should Be    xpath=//div[2]/div[3]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]    Turn off all notifications
    Element Should Be Visible    xpath=//div[1]/div[2]/div[2]/div[1]/div[2]/i[1]
    Element Should Be Enabled    xpath=//div[1]/div[2]/div[2]/div[1]/div[2]/i[1]
    Wait Until Element Is Visible    xpath=//p[contains(text(),'* for security and update notifications some email')]
    Element Should Be Visible    xpath=//p[contains(text(),'* for security and update notifications some email')]
    Element Text Should Be    xpath=//p[contains(text(),'* for security and update notifications some email')]    * for security and update notifications some emails can't be turned off
    Element Should Be Enabled    xpath=//p[contains(text(),'* for security and update notifications some email')]

Social impact score
    Navheader Freelancer
    Wait Until Element Is Visible    id=profileDropdown
    Click Element    id=profileDropdown
    Wait Until Element Is Visible    id=socialImpactScores
    Click Element    id=socialImpactScores
    #Social Impact Score Page
    Wait Until Element Is Visible    xpath=//h2[contains(text(),'Social Impact Scores')]
    Element Should Be Visible    xpath=//h2[contains(text(),'Social Impact Scores')]
    Element Text Should Be    xpath=//h2[contains(text(),'Social Impact Scores')]    Social Impact Scores
    Wait Until Element Is Visible    xpath=//h2[contains(text(),'Sustainable Entrepreneurship Score')]
    Element Should Be Visible    xpath=//h2[contains(text(),'Sustainable Entrepreneurship Score')]
    Element Text Should Be    xpath=//h2[contains(text(),'Sustainable Entrepreneurship Score')]    Sustainable Entrepreneurship Score
    Element Text Should Be    xpath=//body[1]/div[1]/div[1]/section[1]/div[2]/div[3]/div[1]/div[2]/div[1]/p[1]    Sustainable entrepreneurship is your continuing commitment to behave ethically and contribute to economic development while improving the quality of life of your workforce, their families, the local and global community as well as future generations.

Logout
    LogoutKW
