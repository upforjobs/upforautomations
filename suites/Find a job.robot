*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Library                 Collections
Resource                _keywords.txt
Resource                _mysetup.txt
Library                 SeleniumLibrary
Library                 String
Library                 XvfbRobot

*** Variable ***
${TMP_PATH}             /tmp

*** Test Cases ***
Login as freelancer
          Login Freelancer KW

Find a job
          Wait Until Element Is Visible          id=findAJob
          Click Element          css=#findAJob
          Sleep          7
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[1]/div[2]/div[2]/div[1]
          Wait Until Element Is Visible          xpath=//body/div[@id='root']/div[1]/section[1]/div[2]/div[1]/div[2]/div[2]/div[1]/a[1]/div[2]
          Capture Page Screenshot          find-job-page-{index}.png
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[1]/div[2]/div[2]/div[1]
          Click Element          xpath=//body/div[@id='root']/div[1]/section[1]/div[2]/div[1]/div[2]/div[2]/div[1]/a[1]/div[2]

Single job page
          Sleep          5
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Details')]
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Upload your submission')]
          Click Element          xpath=//button[contains(text(),'Upload your submission')]
          Wait Until Element Is Visible          xpath=//input[@id='amount']
          #${id} =          Generate Random String          2          [NUMBERS]
          #Input Text          id=amount          ${id}
          Input Text          id=amount          10
          Capture Page Screenshot          uploaded-file-{index}.png
          Input Text          id=description           Hi, Freelancer! \ You are doing great, but why stop there? Continue bidding and increase your chances to get the right paq! We are here to make it easier for you. \
          Element Should Be Enabled          xpath=//button[contains(.,'+ Upload files')]
          ${id} =          Generate Random String          2          [NUMBERS]
          Choose File          id=uploadFiles           ${CURDIR}\\random\\${id}.jpg
          Capture Page Screenshot          uploaded-file-{index}.png
          Click Element          xpath=//button[contains(text(),'Apply')]
          Capture Page Screenshot          uploaded-file-{index}.png
