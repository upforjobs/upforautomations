*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Resource          _mysetup.txt
Library           SeleniumLibrary
Library           String
Resource          _keywords.txt
Library           Collections

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Login
    Maximize Browser Window
    Go To    ${TESTURL}
    Wait Until Element Is Visible    class=Login_headingText__2QdrP
    Input Text    id=emailOrUserName    ufj
    Input Text    id=password    ${ufjpass}
    Submit Form
    Login Business KW

Post a job
    Navheader Business
    Wait Until Element Is Visible    id=postAJob
    Click Element    id=postAJob
    Breadcrumb post a job

Job Description
    ${letter}    Generate Random String    1    [LETTERS]
    ${letter1}    Generate Random String    1    [LETTERS]
    ${letter2}    Generate Random String    1    [LETTERS]
    Job Description page
    Scroll Element Into View    xpath=//p[contains(text(),'Start a contest?')]
    Click Element    xpath=//p[contains(text(),'Start a contest?')]
    Capture Page Screenshot    title-{index}.png
    Wait Until Element Is Visible    class=JobForm_chooseOneOfContests__1DVKC
    Wait Until Element Is Visible    xpath=//h3[contains(text(),'Choose one of our most popular contests and post i')]
    Element Text Should Be    xpath=//h3[contains(text(),'Choose one of our most popular contests and post i')]    Choose one of our most popular contests and post it in just one click. Hassle-Free job post.
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Logo Design, Illustration')]
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Content Writing / Blog')]
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Voice over Contests')]
    Wait Until Element Is Visible    //h3[contains(text(),'SELECT CATEGORY AND SUBCATEGORY *')]
    Scroll Element Into View    //h3[contains(text(),'SELECT CATEGORY AND SUBCATEGORY *')]
    Sleep    1
    Capture Page Screenshot    title-{index}.png
    Wait Until Element Is Visible    id=category
    Element Should Be Visible    id=category
    Element Should Be Enabled    id=category
    Wait Until Element Is Visible    id=skills
    Element Should Be Enabled    id=skills
    Input Text    id=skills    ${letter}a${letter1}a${letter2}a
    Press Keys    id=skills    RETURN
    Sleep    1
    ${number_title}=    Generate Random String    5    [NUMBERS]
    ${random_title}=    Generate Random String    2    [LETTERS]
    Element Should Be Visible    id=jobTitle
    Element Should Be Enabled    id=jobTitle
    Input Text    id=jobTitle    No: ${number_title} Testing Contest
    Capture Page Screenshot    title-{index}.png
    Element Should Be Visible    id=jobDescription
    Element Should Be Enabled    id=jobDescription
    ${random_description}=    Generate Random String    20    [LETTERS]
    Input Text    id=jobDescription    My page is based on scientific and belief announcements or publicationsy${number_title} ${random_title} ${description}
    Capture Page Screenshot    title-{index}.png
    Sleep    1
    ${id} =    Generate Random String    2    [NUMBERS]
    Element Should Be Enabled    id=upload
    Choose File    id=upload    ${CURDIR}\\random\\${id}.jpg
    Capture Page Screenshot    uploaded-file-{index}.png
    Click Element    xpath=//button[contains(text(),'Continue to Terms & Price')]
    Capture Page Screenshot    uploaded-file-{index}.png
