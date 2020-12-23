*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          _mysetup.txt
Resource          _keywords.txt
Library           XvfbRobot
Library           String

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Post a Job - 1 step * Required
    [Documentation]    User go to post a job and interact with alert messages *Required and *Too Long
    ...    This is negative test case for the 1st step post a job.
    Maximize Browser Window
    Go To    ${TESTURL}/postt-a-job/step-1
    Click Element    class:PostAJobStep1_btnNext__29SID
    Capture Page Screenshot    postt-a-job/step-1-{index}.png
    #allert messages * Required
    Wait Until Element Is Visible    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]
    Element Text Should Be    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]    * Required
    Wait Until Element Is Visible    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]
    Element Text Should Be    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]    * Required
    Element Should Be Disabled    xpath://button[@class="buttonBtn PostAJobStep1_btnNext__29SID"]
    #edit form    title/description
    #clear / edit
    SeleniumLibrary.Clear Element Text    xpath://input[@id="title"]
    Input Text    id:title    .
    Clear Element Text    id:title
    Sleep    prelounch
    Capture Page Screenshot    clear-title-{index}.png
    Clear Element Text    id:description

Post a Job - 1 step * Too Long
    Maximize Browser Window
    Go To    ${TESTURL}/postt-a-job/step-1
    ${random_title}    Generate Random String    101    [LETTERS]
    Input Text    id:title    ${random_title}
    Capture Page Screenshot    title-{index}.png
    ${random_description}    Generate Random String    5001    [LETTERS]
    Input Text    id:description    ${random_description}
    Capture Page Screenshot    title-{index}.png
    Wait Until Element Is Visible    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]
    Element Text Should Be    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]    * Too Long
    Capture Page Screenshot    description-{index}.png
    Wait Until Element Is Visible    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]
    Element Text Should Be    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]    * Too Long

Post a Job - 1 step * Too Short
    Maximize Browser Window
    Go To    ${TESTURL}/postt-a-job/step-1
    ${random_title}    Generate Random String    1    [LETTERS]
    Input Text    id:title    ${random_title}
    Capture Page Screenshot    title-{index}.png
    ${random_description}    Generate Random String    1    [LETTERS]
    Input Text    id:description    ${random_description}
    Capture Page Screenshot    title-{index}.png
    Click Element    class:PostAJobStep1_btnNext__29SID
    Wait Until Element Is Visible    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]
    Element Text Should Be    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]    * Too Short
    Capture Page Screenshot    description-{index}.png
    Wait Until Element Is Visible    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]
    Element Text Should Be    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]    * Too Short

Post a Job - 1 step * Invalid characters
    Maximize Browser Window
    Go To    ${TESTURL}/postt-a-job/step-1
    Input Text    id:title    ~^!%#*&@$(*&#(!@#*^&*%@#&!@#/.,?><
    Capture Page Screenshot    title-{index}.png
    Input Text    id:description    ~^!%#*&@$(*&#(!@#*^&*%@#&!@#/.,?><
    Capture Page Screenshot    title-{index}.png
    Click Element    class:PostAJobStep1_btnNext__29SID
    Wait Until Element Is Visible    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]
    Element Text Should Be    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]    * Invalid characters
    Capture Page Screenshot    description-{index}.png
    Wait Until Element Is Visible    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]
    Element Text Should Be    xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]    * Invalid characters

Post a Job - 1 step
    [Documentation]    User go to post a job 1st step [tag] postajob
    ...    - add title
    ...    - add description
    [Tags]    postajob
    Maximize Browser Window
    Go To    ${TESTURL}/postt-a-job/step-1
    ${url} =    Get Location
    Log to console    ${url}
    Click Element    class:PostAJobStep1_btnNext__29SID
    Capture Page Screenshot    postt-a-job/step-1-{index}.png
    Element Text Should Be    xpath://h2[contains(text(),'Describe & Attach files')]    Describe & Attach files
    ${random_title}    Generate Random String    20    [LETTERS]
    Input Text    id:title    ${random_title}
    Capture Page Screenshot    title-{index}.png
    ${random_description}    Generate Random String    50    [LETTERS]
    Input Text    id:description    ${random_description}
    Capture Page Screenshot    title-{index}.png
    Sleep    4
    #define button
    Click Element    xpath://button[@class="buttonBtn PostAJobStep1_btnNext__29SID"]

Post a Job - 2nd step
    [Tags]    postajob
    ${url} =    Get Location
    Log to console    ${url}
    # 2nd step page
    Wait Until Element Is Visible    xpath://h2[contains(text(),'Select category')]
    Element Text Should Be    xpath://h2[contains(text(),'Select category')]    Select category
    Wait Until Element Is Visible    xpath://p[contains(text(),'Graphic & Design')]
    Element Text Should Be    xpath://p[contains(text(),'Graphic & Design')]    Graphic & Design
    Wait Until Element Is Visible    xpath://p[contains(text(),'Writing & Translation')]
    Element Text Should Be    xpath://p[contains(text(),'Writing & Translation')]    Writing & Translation
    Wait Until Element Is Visible    xpath://p[contains(text(),'Digital Marketing')]
    Element Text Should Be    xpath://p[contains(text(),'Digital Marketing')]    Digital Marketing
    Wait Until Element Is Visible    xpath://p[contains(text(),'Programming & Tech')]
    Element Text Should Be    xpath://p[contains(text(),'Programming & Tech')]    Programming & Tech
    Wait Until Element Is Visible    xpath://p[contains(text(),'Business')]
    Element Text Should Be    xpath://p[contains(text(),'Business')]    Business
    Wait Until Element Is Visible    xpath://p[contains(text(),'Music & Audio')]
    Element Text Should Be    xpath://p[contains(text(),'Music & Audio')]    Music & Audio
    Wait Until Element Is Visible    xpath://p[contains(text(),'Lifestyle')]
    Element Text Should Be    xpath://p[contains(text(),'Lifestyle')]    Lifestyle
    Wait Until Element Is Visible    xpath://p[contains(text(),'Other')]
    Element Text Should Be    xpath://p[contains(text(),'Other')]    Other
    Wait Until Element Is Visible    xpath://a[contains(text(),'Back')]
    Element Should Be Enabled    xpath://a[contains(text(),'Back')]
    Element Text Should Be    xpath://a[contains(text(),'Back')]    Back
    Wait Until Element Is Visible    xpath://button[contains(text(),'Next')]
    Element Should Be Disabled    xpath://button[contains(text(),'Next')]
    Element Text Should Be    xpath://button[contains(text(),'Next')]    Next
    #set 2nd step
    Click Element    id:vector
    Capture Page Screenshot    vector-{index}.png
    Element Should Be Visible    xpath://div[@class="MultipleSelectHeading_multipleSelectHeading__1WmGV PostAJobStep2_subCategorySelectHeading__2im8-"]
    Click Element    xpath://div[@class="MultipleSelectHeading_multipleSelectHeading__1WmGV PostAJobStep2_subCategorySelectHeading__2im8-"]
    Sleep    5
    Click Element    xpath://div[@class="MultipleSelectDropdown_multipleSelectDropdown__2q2u6 PostAJobStep2_subCategoryDropdown__TiR8g"]/button[2]//i[@class="light undefined fas fa-check checkmarkIcon"]
    Click Element    xpath://button[2]//i[@class="light undefined fas fa-check checkmarkIcon"]
    Click Element    xpath://button[1]//i[@class="light undefined fas fa-check checkmarkIcon"]
    Click Element    xpath://div[@class="MultipleSelectHeading_multipleSelectHeading__1WmGV PostAJobStep2_subCategorySelectHeading__2im8-"]/h2
    Capture Page Screenshot    vector-{index}.png
    Input Text    xpath://input[@class="input undefined"]    Skills
    Click Element    xpath://i[@class="light undefined fa fa-plus"]
    Element Should Be Visible    xpath://div[@class="PostAJobStep2_categoryData__1Aa-r"]/p
    Capture Page Screenshot    skills-{index}.png
    Click Element    xpath://i[@class="light undefined fa fa-times undefined"]
    Element Should Not Be Visible    xpath://div[@class="Tag_tag__3sBKJ "]/p
    Capture Page Screenshot    skills-{index}.png
    Click Element    xpath://button[@class="buttonBtn PostAJobStep2_btnNext__CywN3"]

Post a Job - 3rd step
    [Tags]    postajob
    ${url} =    Get Location
    Log to console    ${url}
    Wait Until Element Is Visible    xpath://h2[contains(text(),'Select the type of job')]
    Element Text Should Be    xpath://h2[contains(text(),'Select the type of job')]    Select the type of job
    Element Should Be Visible    class:JobTypeCard_jobTypeCard__3s3DX
    Element Text Should Be    xpath://h2[contains(text(),'Post a project?')]    Post a project?
    Element Text Should Be    xpath://h2[contains(text(),'Start a contest?')]    Start a contest?
    Element Should Be Visible    xpath://a[contains(text(),'Back')]
    Element Should Be Enabled    xpath://a[contains(text(),'Back')]
    Element Should Be Visible    xpath://button[contains(text(),'Next')]
    Element Should Be Disabled    xpath://button[contains(text(),'Next')]
    Scroll Element Into View    xpath://button[contains(text(),'Next')]
    Capture Page Screenshot    3rd step-{index}.png
    Click Element    xpath://h2[contains(text(),'Post a project?')]
    Element Should Be Enabled    xpath://button[contains(text(),'Next')]
    Click Element    xpath://button[contains(text(),'Next')]

Post a Job - 4th step
    [Tags]    postajob
    ${url} =    Get Location
    Log to console    ${url}
    Wait Until Element Is Visible    xpath://h2[contains(text(),'Add Contest Prize and Duration')]
    Element Text Should Be    xpath://h2[contains(text(),'Add Contest Prize and Duration')]    Add Contest Prize and Duration
    Capture Page Screenshot    Add-Contest-Prize-and-Duration-{index}.png

*** Keywords ***
