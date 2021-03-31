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
Post a Job - 1 step * Required
          [Documentation]          User go to post a job and interact with alert messages *Required and *Too Long
          ...          This is negative test case for the 1st step post a job.
          Maximize Browser Window
          Go To          ${TESTURL}/post-job
          Navheader Unregistered
          Breadcrumb post a job
          Post a job header
          Describe and attach section
          Select Category and Skills section
          Select Job Type section
          Capture Page Screenshot          postt-a-job/step-1-{index}.png
          #allert messages * Required
          Scroll Element Into View          xpath=//h3[contains(text(),'Select Job Type')]
          Input Text          id=skills          Skills
          Sleep          1
          Press Keys          id=skills          RETURN
          Sleep          3
          #Input Text          name=title
          Wait Until Element Is Visible          xpath=//form[1]/div[1]/div[1]/div[1]          #title
          Element Should Be Visible          xpath=//form[1]/div[1]/div[1]/div[1]
          Element Text Should Be          xpath=//form[1]/div[1]/div[1]/div[1]          * Required
          ${title-alert} =          Get Text          xpath=//form[1]/div[1]/div[1]/div[1]
          Log To Console          ${title-alert}
          Wait Until Element Is Visible          xpath=//form[1]/div[1]/div[1]/div[2]
          Element Text Should Be          xpath=//form[1]/div[1]/div[1]/div[2]          * Required
          ${description-alert} =          Get Text          xpath=//form[1]/div[1]/div[1]/div[2]
          Log To Console          ${description-alert}
          #Select Category and Skills
          Wait Until Element Is Visible          xpath=//form[1]/div[2]/div[1]/div[1]/div[2]
          Element Text Should Be          xpath=//form[1]/div[2]/div[1]/div[1]/div[2]          * Required
          ${category-alert} =          Get Text          xpath=//form[1]/div[2]/div[1]/div[1]/div[2]
          Log To Console          ${category-alert}
          #Select Job Type
          Wait Until Element Is Visible          xpath=//form[1]/div[3]/div[2]
          Element Text Should Be          xpath=//form[1]/div[3]/div[2]          * Required
          ${job-type-alert} =          Get Text          xpath=//form[1]/div[3]/div[2]
          Log To Console          ${job-type-alert}
          Sleep          1
          Capture Page Screenshot          clear-title-{index}.png

Post a Job - 1 step * Too Short
          Maximize Browser Window
          Go To          ${TESTURL}/post-job
          Navheader Unregistered
          Breadcrumb post a job
          Post a job header
          Describe and attach section
          Select Category and Skills section
          Select Job Type section
          ${random_title}          Generate Random String          1          [LETTERS]
          Capture Page Screenshot          clear-{index}.png
          Input Text          xpath://input[@name="title"]          ${random_title}
          Capture Page Screenshot          title-{index}.png
          Wait Until Element Is Visible          xpath=//form[1]/div[1]/div[1]/div[1]
          Element Text Should Be          xpath=//form[1]/div[1]/div[1]/div[1]          * Too Short
          Capture Page Screenshot          title-{index}.png
          ${random_description}          Generate Random String          1          [LETTERS]
          Input Text          xpath=//form[1]/div[1]/div[1]/textarea[1]          ${random_description}
          Capture Page Screenshot          description-{index}.png
          Wait Until Element Is Visible          xpath=//form[1]/div[1]/div[1]/div[2]
          Element Text Should Be          xpath=//form[1]/div[1]/div[1]/div[2]          * Too Short
          Capture Page Screenshot          step1-too-short-{index}.png

Post a Job - 1 step * Too Long
          Maximize Browser Window
          Go To          ${TESTURL}/post-job
          Navheader Unregistered
          Breadcrumb post a job
          Post a job header
          Describe and attach section
          Select Category and Skills section
          Select Job Type section
          Clear Element Text          xpath=//form[1]/div[1]/div[1]/input[1]
          ${random_title}=          Generate Random String          100          [LETTERS]
          Input Text          name=title          ${random_title}
          Capture Page Screenshot          title-{index}.png
          Wait Until Element Is Visible          xpath=//div[contains(text(),'* Too Long')]
          Element Text Should Be          xpath=//div[contains(text(),'* Too Long')]          * Too Long
          ${random_description}=          Generate Random String          5000          [LETTERS]
          Input Text          xpath=//form[1]/div[1]/div[1]/textarea[1]          ${random_description}
          Capture Page Screenshot          description-{index}.png
          Wait Until Element Is Visible          xpath=//form[1]/div[1]/div[1]/div[2]
          Element Text Should Be          xpath=//form[1]/div[1]/div[1]/div[2]          * Too Long
          Clear Element Text          name=title
          Clear Element Text          xpath=//form[1]/div[1]/div[1]/textarea[1]

*** Keywords ***
