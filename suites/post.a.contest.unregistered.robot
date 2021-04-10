*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Library                 SeleniumLibrary
Resource                _mysetup.txt
Resource                _keywords.txt
Library                 XvfbRobot
Library                 String

*** Variables ***
${TMP_PATH}             /tmp

*** Test Cases ***
Login to the website
          Maximize Browser Window
          Go To          ${TESTURL}
          Wait Until Element Is Visible          class=Login_headingText__2QdrP
          Input Text          id=emailOrUserName          ufj
          Input Text          id=password          ${ufjpass}
          Submit Form

Post a Job - 1 step * Required
          [Documentation]          In this test we are testing \ Required fields and alert messages , adding an deliting skills
          ...          - clicking on the Continue button
          ...          alert message will be present for
          ...
          ...          1. Category
          ...          2. Job Title
          ...          - add and delete text
          ...          - too short
          ...          -too long
          ...          3. Job description
          ...          - too short
          ...          -too long
          ...          4. Skills
          ...          In second scenario we test Skills
          ...          user will add more than 11 skils and triger alert message
          ...          - Maximum of 10 skills can be selected
          ...          test deleting sufficient skills on 10 and assert that alert message with the text
          ...          - Maximum of 10 skills can be selected should not be visible.
          Navheader Unregistered
          Click Element          id=postAJobLink
          Breadcrumb post a job
          Post a job header
          Job Description page
          Capture Page Screenshot          post-a-job/job description-{index}.png
          #allert messages * Required
          Click Element          xpath=//button[contains(text(),'Continue to Terms & Price')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),"Can't proceed, Complete Job Description first.")]
          ${alert} =          Get Text          xpath=//div[contains(text(),"Can't proceed, Complete Job Description first.")]
          Log To Console          ${alert}
          Capture Element Screenshot          xpath=//div[contains(text(),"Can't proceed, Complete Job Description first.")]
          Click Element          xpath=//div[contains(text(),"Can't proceed, Complete Job Description first.")]
          Wait Until Element Is Not Visible          xpath=//div[contains(text(),"Can't proceed, Complete Job Description first.")]
          Wait Until Element Is Visible          xpath=//p[contains(text(),'Post a project?')]
          Scroll Element Into View          xpath=//p[contains(text(),'Post a project?')]
          Click Element          xpath=//p[contains(text(),'Post a project?')]
          Wait Until Element Is Visible          xpath=//form[1]/div[3]/div[1]/div[1]/div[2]
          Element Text Should Be          xpath=//form[1]/div[3]/div[1]/div[1]/div[2]          * Required
          Wait Until Element Is Visible          xpath=//form[1]/div[4]/div[1]/div[1]
          Element Text Should Be          xpath=//form[1]/div[4]/div[1]/div[1]          * Required
          Wait Until Element Is Visible          xpath=//form[1]/div[4]/div[1]/div[2]
          Element Text Should Be          xpath=//form[1]/div[4]/div[1]/div[2]          * Required
          #add skills
          Input Text          id=skills          Skills
          Press Keys          id=skills          RETURN
          Input Text          id=skills          a
          Wait Until Element Is Visible          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Click Element          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Input Text          id=skills          ce
          Wait Until Element Is Visible          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Click Element          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Input Text          id=skills          de
          Wait Until Element Is Visible          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Click Element          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Input Text          id=skills          er
          Wait Until Element Is Visible          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Click Element          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Input Text          id=skills          fa
          Wait Until Element Is Visible          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Click Element          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Input Text          id=skills          go
          Wait Until Element Is Visible          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Click Element          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Input Text          id=skills          ho
          Wait Until Element Is Visible          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Click Element          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[7]
          Input Text          id=skills          in
          Wait Until Element Is Visible          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Click Element          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[7]
          Input Text          id=skills          ja
          Wait Until Element Is Visible          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Click Element          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[7]
          Input Text          id=skills          ko
          Wait Until Element Is Visible          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Click Element          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Input Text          id=skills          mo
          Wait Until Element Is Visible          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Click Element          //form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[7]
          Input Text          id=skills          na
          Wait Until Element Is Visible          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Click Element          //form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[7]
          Input Text          id=skills          ot
          Wait Until Element Is Visible          xpath=//form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[1]
          Click Element          //form[1]/div[3]/div[3]/div[1]/div[1]/div[2]/div[7]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Maximum of 10 skills can be selected')]
          ${title-alert} =          Get Text          xpath=//div[contains(text(),'Maximum of 10 skills can be selected')]
          Log To Console          ${title-alert}
          #remove skills
          Click Element          xpath=//form[1]/div[3]/div[3]/div[2]/div[1]/i[1]          #remove skills
          Click Element          xpath=//form[1]/div[3]/div[3]/div[2]/div[1]/i[1]
          Click Element          xpath=//form[1]/div[3]/div[3]/div[2]/div[1]/i[1]
          Capture Page Screenshot          delete-skills{index}.png
          #end skills
          Wait Until Element Is Not Visible          xpath=//div[contains(text(),'Maximum of 10 skills can be selected')]
          #Input Text          name=title
          Capture Page Screenshot          clear-title-{index}.png

Post a Job - 1 step * Too Short
          Navheader Unregistered
          Breadcrumb post a job
          Post a job header
          Scroll Element Into View          xpath=//button[contains(text(),'Continue to Terms & Price')]
          ${random_title}          Generate Random String          1          [LETTERS]
          Capture Page Screenshot          clear-{index}.png
          Input Text          xpath=//input[@id='jobTitle']          ${random_title}
          Capture Page Screenshot          title-{index}.png
          Wait Until Element Is Visible          xpath=//form[1]/div[1]/div[1]/div[1]
          Element Text Should Be          xpath=//form[1]/div[1]/div[1]/div[1]          * Too Short
          Clear Element Text          id=jobDescription
          Capture Page Screenshot          title-{index}.png
          ${random_description}          Generate Random String          1          [LETTERS]
          Input Text          xpath=//textarea[@id='jobDescription']          ${random_description}
          Capture Page Screenshot          description-{index}.png
          Wait Until Element Is Visible          xpath=//form[1]/div[1]/div[1]/div[2]
          Element Text Should Be          xpath=//form[1]/div[1]/div[1]/div[2]          * Too Short
          Capture Page Screenshot          step1-too-short-{index}.png
          Clear Element Text          xpath=//textarea[@id='jobDescription']

Post a Job - 1 step * Too Long
          Navheader Unregistered
          Breadcrumb post a job
          Post a job header
          Scroll Element Into View          xpath=//button[contains(text(),'Continue to Terms & Price')]
          Clear Element Text          xpath=//input[@id='jobTitle']
          ${random_title}=          Generate Random String          101          [LETTERS]
          Input Text          name=title          ${random_title}
          Capture Page Screenshot          title-{index}.png
          Wait Until Element Is Visible          xpath=//div[contains(text(),'* Too Long')]
          Element Text Should Be          xpath=//div[contains(text(),'* Too Long')]          * Too Long
          ${random_description}=          Generate Random String          5001          [LETTERS]
          Input Text          xpath=//textarea[@id='jobDescription']          ${random_description}
          Capture Page Screenshot          description-{index}.png
          Element Text Should Be          xpath=//form[1]/div[1]/div[1]/div[2]          * Too Long
          Clear Element Text          name=title
          Clear Element Text          xpath=//textarea[@id='jobDescription']

*** Keywords ***
