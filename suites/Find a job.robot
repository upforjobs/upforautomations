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
          Sleep          1
          Wait Until Element Is Visible          xpath=//section[1]/div[2]/div[1]/div[2]/div[2]/div[1]
          Wait Until Element Is Visible          xpath=//body/div[@id='root']/div[1]/section[1]/div[2]/div[1]/div[2]/div[2]/div[1]/a[1]/div[2]
          Capture Page Screenshot          find-job-page-{index}.png
