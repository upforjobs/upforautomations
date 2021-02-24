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
          Go To          ${TESTURL}/post-a-job/step-1
          Header Post a Job
          Click Element          class:PostAJobStep1_btnNext__29SID
          Capture Page Screenshot          postt-a-job/step-1-{index}.png
          #allert messages * Required
          Wait Until Element Is Visible          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]
          Element Text Should Be          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]          * Required
          ${alert} =          Get Text          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]
          Log To Console          ${alert}
          Wait Until Element Is Visible          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]
          Element Text Should Be          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]          * Required
          ${alert} =          Get Text          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]
          Log To Console          ${alert}
          Element Should Be Disabled          xpath://button[@class="buttonBtn PostAJobStep1_btnNext__29SID"]
          #edit form          title/description
          #clear / edit
          SeleniumLibrary.Clear Element Text          xpath://input[@id="title"]
          Input Text          id:title          .
          Clear Element Text          id:title
          Sleep          1
          Capture Page Screenshot          clear-title-{index}.png
          Clear Element Text          id:description

Post a Job - 1 step * Too Long
          Maximize Browser Window
          Go To          ${TESTURL}/post-a-job/step-1
          Header Post a Job
          ${random_title}          Generate Random String          101          [LETTERS]
          Input Text          id:title          ${random_title}
          Capture Page Screenshot          title-{index}.png
          ${random_description}          Generate Random String          5001          [LETTERS]
          Input Text          id:description          ${random_description}
          Capture Page Screenshot          title-{index}.png
          Wait Until Element Is Visible          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]
          Element Text Should Be          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]          * Too Long
          Click Element          id:title
          Capture Page Screenshot          description-{index}.png
          Wait Until Element Is Visible          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]
          Element Text Should Be          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]          * Too Long

Post a Job - 1 step * Too Short
          Maximize Browser Window
          Go To          ${TESTURL}/post-a-job/step-1
          Header Post a Job
          ${random_title}          Generate Random String          1          [LETTERS]
          Clear Element Text          id=title
          Clear Element Text          id=description
          Capture Page Screenshot          clear-{index}.png
          Click Element          xpath://input[@id="title"]
          Input Text          id=title          ${random_title}
          Capture Page Screenshot          title-{index}.png
          ${random_description}          Generate Random String          39          [LETTERS]
          Input Text          id=description          ${random_description}
          Capture Page Screenshot          title-{index}.png
          #Click Element          class:PostAJobStep1_btnNext__29SID
          Wait Until Element Is Visible          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]
          Element Text Should Be          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]          * Too Short
          Click Element          xpath://input[@id="title"]
          Capture Page Screenshot          description-{index}.png
          Wait Until Element Is Visible          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]
          Click Element          xpath://input[@id="title"]
          Element Text Should Be          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]          * Too Short
          Capture Page Screenshot          step1-too-short-{index}.png

Post a Job - 1 step * Invalid characters
          Maximize Browser Window
          Go To          ${TESTURL}/post-a-job/step-1
          Header Post a Job
          Input Text          id:title          ~^!%#*&@$(*&#(!@#*^&*%@#&!@#/.,?><
          Capture Page Screenshot          title-{index}.png
          Input Text          id:description          ~^!%#*&@$(*&#(!@#*^&*%@#&!@#/.,?><
          Capture Page Screenshot          title-{index}.png
          Click Element          class:PostAJobStep1_btnNext__29SID
          Wait Until Element Is Visible          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]
          Element Text Should Be          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[1]/div[@class="PostAJobStep1_error__4U_QJ"]          * Invalid characters
          Capture Page Screenshot          description-{index}.png
          #Wait Until Element Is Visible          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]
          #Element Text Should Be          xpath://div[@class="PostAJobStep1_inputWrapper__EnaEv"]/div[2]/div[@class="PostAJobStep1_error__4U_QJ"]          * Invalid characters

Post a Job - 1st step
          [Documentation]          User go to post a job 1st step [tag] postajob
          ...          - add title
          ...          - add description
          [Tags]          postajob
          Maximize Browser Window
          Delete All Cookies
          Go To          ${TESTURL}/post-a-job/step-1
          ${url} =          Get Location
          Log to console          ${url}
          Header Post a Job
          Wait Until Element Is Visible          xpath://h2[contains(text(),'Describe & Attach files')]
          Element Text Should Be          xpath://h2[contains(text(),'Describe & Attach files')]          Describe & Attach files
          Click Element          class:PostAJobStep1_btnNext__29SID
          Capture Page Screenshot          postt-a-job/step-1-{index}.png
          Element Text Should Be          xpath://h2[contains(text(),'Describe & Attach files')]          Describe & Attach files
          ${number_title}          Generate Random String          5          [NUMBERS]
          ${random_title}          Generate Random String          5          [LETTERS]
          Input Text          id:title          No: ${number_title} Create and manage Contest ${random_title}
          Capture Page Screenshot          title-{index}.png
          ${random_description}          Generate Random String          300          [LETTERS]
          Input Text          id:description          ${random_description}
          Capture Page Screenshot          title-{index}.png          #Contest with number ${number_title} ${random_title} ${description}
          Sleep          1
          #define button
          Scroll Element Into View          tag=button
          #Choose File          class=PostAJobStep1_addFilesWrapper__2PGeU          ${CURDIR}\\random\\c0${id}.jpg
          Sleep          1
          Capture Page Screenshot          image-{index}.png
          Click Button          tag=button

Post a Job - 2nd step
          [Documentation]          User go to post a job 2nd step [tag] postajob
          ...          - assert and verify elements on the page
          ...          - select category
          ...          - select sub-categoru
          ...          - add one skill
          ...          - go to the 3rd step
          [Tags]          postajob
          ${url} =          Get Location
          Log to console          ${url}
          Header Post a Job
          Wait Until Element Is Visible          xpath://h2[contains(text(),'Select category')]
          Element Text Should Be          xpath://h2[contains(text(),'Select category')]          Select category
          # 2nd step page
          Wait Until Element Is Visible          xpath://p[contains(text(),'Graphic & Design')]
          Element Text Should Be          xpath://p[contains(text(),'Graphic & Design')]          Graphic & Design
          Wait Until Element Is Visible          xpath://p[contains(text(),'Writing & Translation')]
          Element Text Should Be          xpath://p[contains(text(),'Writing & Translation')]          Writing & Translation
          Wait Until Element Is Visible          xpath://p[contains(text(),'Digital Marketing')]
          Element Text Should Be          xpath://p[contains(text(),'Digital Marketing')]          Digital Marketing
          Wait Until Element Is Visible          xpath://p[contains(text(),'Programming & Tech')]
          Element Text Should Be          xpath://p[contains(text(),'Programming & Tech')]          Programming & Tech
          Wait Until Element Is Visible          xpath://p[contains(text(),'Business')]
          Element Text Should Be          xpath://p[contains(text(),'Business')]          Business
          Wait Until Element Is Visible          xpath://p[contains(text(),'Music & Audio')]
          Element Text Should Be          xpath://p[contains(text(),'Music & Audio')]          Music & Audio
          Wait Until Element Is Visible          xpath://p[contains(text(),'Lifestyle')]
          Element Text Should Be          xpath://p[contains(text(),'Lifestyle')]          Lifestyle
          Wait Until Element Is Visible          xpath://p[contains(text(),'Other')]
          Element Text Should Be          xpath://p[contains(text(),'Other')]          Other
          Wait Until Element Is Visible          xpath://a[contains(text(),'Back')]
          Element Should Be Enabled          xpath://a[contains(text(),'Back')]
          Element Text Should Be          xpath://a[contains(text(),'Back')]          Back
          Wait Until Element Is Visible          xpath://button[contains(text(),'Next')]
          Element Should Be Disabled          xpath://button[contains(text(),'Next')]
          Element Text Should Be          xpath://button[contains(text(),'Next')]          Next
          #set 2nd step
          Scroll Element Into View          xpath=//a[contains(text(),'Back')]
          Click Element          xpath://p[contains(text(),'Programming & Tech')]
          #Click Element          xpath://p[contains(text(),'Graphic & Design')]
          #Click Element          xpath://body/div[@id='root']/div[1]/section[1]/div[4]/div[1]/div[1]/div[1]/div[1]
          Scroll Element Into View          tag=button
          Capture Page Screenshot          vector-{index}.png
          Element Should Be Visible          xpath://div[@class="MultipleSelectHeading_multipleSelectHeading__1WmGV PostAJobStep2_subCategorySelectHeading__2im8-"]
          Click Element          xpath=//body/div[@id='root']/div[1]/section[1]/div[4]/div[1]/div[1]/div[2]/div[1]/i[1]
          Sleep          1
          #Click Element          xpath://div[@class="MultipleSelectDropdown_multipleSelectDropdown__2q2u6 PostAJobStep2_subCategoryDropdown__TiR8g"]/button[2]//i[@class="light undefined fas fa-check checkmarkIcon"]
          Click Element          xpath=//button[@id='qa-&-testing']
          #Click Element          xpath=//button[@id='logo-design']          QA & Testing
          Sleep          1
          #Click Element          xpath=//button[@id='web-&-mobile-design']
          Click Element          xpath://div[@class="MultipleSelectHeading_multipleSelectHeading__1WmGV PostAJobStep2_subCategorySelectHeading__2im8-"]/h2
          Capture Page Screenshot          vector-{index}.png
          Input Text          xpath://input[@class="input undefined"]          Skills
          Click Element          xpath=//body/div[@id='root']/div[1]/section[1]/div[4]/div[1]/div[1]/div[4]/div[1]/div[1]/div[1]/div[1]/i[1]
          Element Should Be Visible          xpath://div[@class="PostAJobStep2_categoryData__1Aa-r"]/p
          Get Text          xpath://div[@class="PostAJobStep2_categoryData__1Aa-r"]/p
          Capture Page Screenshot          skills-{index}.png
          #Click Element          class=light undefined fa fa-times Tag_tag__remove__icon__1ti4w
          Element Should Not Be Visible          xpath://div[@class="Tag_tag__3sBKJ "]/p
          Scroll Element Into View          xpath=//a[contains(text(),'Back')]
          Capture Page Screenshot          skills-{index}.png
          Click Element          tag=button

Post a Job - 3rd step
          [Tags]          postajob
          ${url} =          Get Location
          Log to console          ${url}
          Header Post a Job
          Wait Until Element Is Visible          xpath://h2[contains(text(),'Select the type of job')]
          Element Text Should Be          xpath://h2[contains(text(),'Select the type of job')]          Select the type of job
          #3rd step
          Wait Until Element Is Visible          xpath://h2[contains(text(),'Select the type of job')]
          Element Text Should Be          xpath://h2[contains(text(),'Select the type of job')]          Select the type of job
          Element Should Be Visible          class:JobTypeCard_jobTypeCard__3s3DX
          Element Text Should Be          xpath://h2[contains(text(),'Post a project?')]          Post a project?
          Element Text Should Be          xpath://h2[contains(text(),'Start a contest?')]          Start a contest?
          Element Text Should Be          xpath://div[1]/div[1]/div[1]/div[2]/p[1]          You have a project which needs to be done, and you need a qualified person to finish it. Post a project, describe what are you looking for, determine the application deadline, and wait for the proposals!
          Element Text Should Be          xpath://div[1]/div[1]/div[2]/div[2]          You want to choose the product you like the most? Run a contest, give clear instructions, determine a deadline, and wait for the right product to come to you!
          Element Should Be Visible          xpath://a[contains(text(),'Back')]
          Element Should Be Enabled          xpath://a[contains(text(),'Back')]
          Element Should Be Visible          xpath://button[contains(text(),'Next')]
          Element Should Be Disabled          xpath://button[contains(text(),'Next')]
          Scroll Element Into View          xpath://button[contains(text(),'Next')]
          Capture Page Screenshot          3rd step-{index}.png
          Scroll Element Into View          xpath=//a[contains(text(),'Back')]
          Capture Page Screenshot          select-contest-{index}.png
          Click Element          xpath://h2[contains(text(),'Start a contest?')]          #Contest
          #Click Element          xpath://h2[contains(text(),'Post a project?')]
          Element Should Be Enabled          xpath://button[contains(text(),'Next')]
          Click Element          xpath://button[contains(text(),'Next')]
          Sleep          5

Post a Job - 4th step
          [Tags]          postajob
          ${url} =          Get Location
          Log to console          ${url}
          Header Post a Job
          Wait Until Element Is Visible          xpath://h2[contains(text(),'Add Contest Prize and Duration')]
          Element Text Should Be          xpath://h2[contains(text(),'Add Contest Prize and Duration')]          Add Contest Prize and Duration
          #4th step
          #Add Contest Prize and Duration
          Scroll Element Into View          xpath=//span[contains(text(),'OR')]
          Capture Page Screenshot          duration-{index}.png
          Wait Until Element Is Visible          xpath://h3[contains(text(),'ADD PRICE')]
          Element Text Should Be          xpath://h3[contains(text(),'ADD PRICE')]          ADD PRICE
          Wait Until Element Is Visible          xpath://h4[contains(text(),'Select Price Amount')]
          Element Text Should Be          xpath://h4[contains(text(),'Select Price Amount')]          Select Price Amount
          #Add Custom Amount
          Wait Until Element Is Visible          xpath://h4[contains(text(),'Add Custom Amount')]
          Element Text Should Be          xpath://h4[contains(text(),'Add Custom Amount')]          Add Custom Amount
          Capture Page Screenshot          Add-Contest-Prize-and-Duration-{index}.png
          #Wait Until Element Is Visible          xpath=//div[contains(text(),'* minimum of 5 $ required')]
          #Element Text Should Be          xpath=//div[contains(text(),'* minimum of 5 $ required')]          minimum of 5 $ required
          Wait Until Element Is Visible          xpath://div[1]/div[1]/div[1]/p[2]
          Element Text Should Be          xpath://div[1]/div[1]/div[1]/p[2]          $5000
          Input Text          xpath=//form[1]/div[1]/div[2]/input[1]          3
          Click Element          xpath=//button[contains(text(),'2 days')]
          Click Element          xpath=//button[contains(text(),'2 days')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'* minimum of 5 $ required')]
          Element Text Should Be          xpath=//div[contains(text(),'* minimum of 5 $ required')]          * minimum of 5 $ required
          #Element Should Be Enabled          xpath=//div[contains(text(),'* minimum of 5 $ required')]
          ${alert} =          Get Text          xpath=//div[contains(text(),'* minimum of 5 $ required')]
          Log To Console          ${alert}
          #Sleep          1
          #Capture Page Screenshot          min-price-5-{index}.png
          #Click Element          xpath=//div[contains(text(),'Min Price is $5.')]
          Input Text          name=sliderPrice          50
          Sleep          1
          Clear Element Text          xpath=//form[1]/div[1]/div[2]/input[1]
          Input Text          xpath=//form[1]/div[1]/div[2]/input[1]          5001
          ${alert} =          Get Text          xpath=//div[contains(text(),'* maximum of 5000 $')]
          Log To Console          ${alert}
          Click Element          xpath=//button[contains(text(),'2 days')]
          #Click Element          xpath=//button[contains(text(),'2 days')]
          Capture Page Screenshot          max-price-5000-{index}.png
          #Click Element          xpath=//div[contains(text(),'* maximum of 5000 $')]          #remove dot
          #input amount
          Input Text          name=sliderPrice          50
          Sleep          1
          Capture Page Screenshot          clear-amount-{index}.png
          Sleep          1
          Input Text          xpath=//form[1]/div[1]/div[2]/input[1]          50
          #Select Number of Days
          Scroll Element Into View          xpath=//button[contains(text(),'2 days')]
          #Click Button          xpath://a[contains(text(),'Back')]
          Capture Page Screenshot          number-of-days-{index}.png
          Wait Until Element Is Visible          xpath://h4[contains(text(),'Select Number of Days')]
          Element Text Should Be          xpath://h4[contains(text(),'Select Number of Days')]          Select Number of Days
          Wait Until Element Is Visible          xpath://p[contains(text(),'3 Days')]
          Element Text Should Be          xpath://p[contains(text(),'3 Days')]          3 Days
          Wait Until Element Is Visible          xpath://p[contains(text(),'21 Days')]
          Element Text Should Be          xpath://p[contains(text(),'21 Days')]          21 Days
          Scroll Element Into View          xpath://span[contains(text(),'OR')]
          Wait Until Element Is Visible          xpath://span[contains(text(),'OR')]
          Element Text Should Be          xpath://span[contains(text(),'OR')]          OR
          Wait Until Element Is Visible          xpath://button[contains(text(),'1 day')]
          Element Text Should Be          xpath://button[contains(text(),'1 day')]          1 day
          Wait Until Element Is Visible          xpath://button[contains(text(),'2 days')]
          Element Text Should Be          xpath://button[contains(text(),'2 days')]          2 days
          Wait Until Element Is Visible          xpath://a[contains(text(),'Back')]
          Element Text Should Be          xpath://a[contains(text(),'Back')]          Back
          Wait Until Element Is Visible          xpath://button[contains(text(),'Login & Preview')]
          Element Text Should Be          xpath://button[contains(text(),'Login & Preview')]          Login & Preview
          #Element Text Should Be          class=PostAJobStep4_totalAmount__W4Zg-          You will Pay: $55 USD
          Input Text          name=numberOfDays          20
          Capture Page Screenshot          days-{index}.png
          Sleep          1
          Click Button          xpath=//button[contains(text(),'2 days')]
          Element Should Not Be Visible          xpath://p[contains(text(),'3 Days')]
          Element Should Not Be Visible          xpath://p[contains(text(),'21 Days')]
          Element Should Not Be Visible          xpath://span[contains(text(),'OR')]
          Element Should Not Be Visible          class=PostAJobStep4_daysInputHeading__1qmcQ
          Scroll Element Into View          xpath=//a[contains(text(),'Back')]
          #Click Button          xpath=//button[contains(text(),'2 days')]
          Capture Page Screenshot          post-{index}.png
          Click Button          xpath://button[contains(text(),'Login & Preview')]
          Capture Page Screenshot          login.-{index}.png
          Login modal dialog
          Input Text          name=emailOrUserName          ${business1}
          Input Text          name:password          ${password}
          Click Element          id:login

Preview Job Page
          Sleep          5
          Capture Page Screenshot          login-{index}.png
          Wait Until Element Is Visible          class=PostAJobPreviewJob_postAJobPreviewJobMainContainer__2bq6F \ \ \ \
          Capture Page Screenshot          preview-a-job-{index}.png
          #header preview a Job
          Wait Until Element Is Visible          xpath://a[contains(text(),'Up For Jobs')]
          Element Text Should Be          xpath://a[contains(text(),'Up For Jobs')]          Up For Jobs
          Wait Until Element Is Visible          xpath://body/div[@id='root']/div[1]/section[1]/div[1]/a[2]
          Element Text Should Be          xpath://body/div[@id='root']/div[1]/section[1]/div[1]/a[2]          Preview Job
          Wait Until Element Is Visible          xpath://body/div[@id='root']/div[1]/section[1]/div[2]/h2[1]/span[1]
          Element Text Should Be          xpath://body/div[@id='root']/div[1]/section[1]/div[2]/h2[1]          Post a Job
          #Element Should Be Visible          xpath=//body/div[@id='root']/div[1]/section[1]/div[3]/div[1]/button[1]
          #Element Text Should Be          xpath=//body/div[@id='root']/div[1]/section[1]/div[3]/div[1]/button[1]          Urgent
          ${title} =          Get Text          class=PostAJobPreviewJob_urgentStylesHeading__39LlK
          Log To Console          ${title}
          Element Should Be Visible          class=PostAJobPreviewJob_urgentStylesHeading__39LlK          #title
          ${description} =          Get Text          class=PostAJobPreviewJob_urgentStylesDesc__28Lhz
          Log To Console          ${description}
          Element Should Be Visible          class=PostAJobPreviewJob_urgentStylesDesc__28Lhz          #Description
          Element Should Be Visible          class=PostAJobPreviewJob_postAJobPreviewInfo__2uY5T          #contest
          ${description} =          Get Text          class=PostAJobPreviewJob_postAJobPreviewInfo__2uY5T
          Log To Console          ${description}
          Sleep          5
          Element Should Be Enabled          xpath=//a[contains(text(),'Edit')]
          Element Should Be Visible          xpath=//a[contains(text(),'Edit')]
          Element Text Should Be          xpath=//a[contains(text(),'Edit')]          Edit
          Element Should Be Enabled          xpath=//button[contains(text(),'Publish Job')]
          Element Should Be Visible          xpath=//button[contains(text(),'Publish Job')]
          Element Text Should Be          xpath=//button[contains(text(),'Publish Job')]          Publish Job
          Click Button          xpath=//button[contains(text(),'Publish Job')]

Congrats modal
          Sleep          3
          #Congrats Project modal dialog
          Congrats Contest modal dialog not urgent
          Click Element          id=Sealed
          Click Element          id=Extent
          Click Element          id=Private
          Click Element          id=TopContest
          Click Element          id=Highlight
          Click Element          id=Featured
          Click Element          id=Guaranteed
          Click Element          id=Request to sign NDA
          Capture Page Screenshot          BOOST-FEATURES-{index}.png
          Element Should Be Enabled          xpath=//button[contains(text(),'Finish')]
          Element Should Be Visible          xpath=//button[contains(text(),'Finish')]
          Element Text Should Be          xpath=//button[contains(text(),'Finish')]          Finish
          Click Button          xpath=//button[contains(text(),'Finish')]
          Capture Page Screenshot          congrats-{index}.png

Thank you page
          Sleep          3
          Click Element          xpath=//body/div[@id='root']/div[1]/div[1]/section[1]/img[1]
          Scroll Element Into View          xpath=//body/div[@id='root']/div[1]/div[1]/section[1]/div[1]/p[1]
          Capture Page Screenshot          finish-{index}.png

My Jobs
          Sleep          5
          Element Should Be Visible          class=MyJobs_myJobsMainContainer__2rWbh
          Element Should Be Visible          class=MyJobs_leftSideContainer__tPE4X
          Get Text          class=MyJobsJobCard_myJobsDesc__20kBO
          Capture Page Screenshot          my-jobs-{index}.png
          LogoutKW

*** Keywords ***
