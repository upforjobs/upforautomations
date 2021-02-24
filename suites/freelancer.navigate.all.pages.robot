*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Library                 String
Library                 SeleniumLibrary
Library                 XvfbRobot
Resource                _keywords.txt
Resource                _mysetup.txt

*** Test Cases ***
Login
          Go To          ${TESTURL}
          Click Element          xpath://button[contains(text(),'Login')]
          Capture Page Screenshot          login-{index}.png
          Input Text          name:emailOrUserName          ${username}
          Input Text          name:password          ${password}
          Click Element          id:login
          Wait Until Element Is Not Visible          xpath://button[contains(text(),'Login')]
          Capture Page Screenshot          login-user-{index}.png
          Sleep          2
          Element Should Be Visible          class=MiniDashboard_miniDashboard__2g2df
          Element Should Be Enabled          xpath=//div[@id='root']/div/section/section/div/div[2]/a[2]/h4
          Click Element          xpath=//a[2]/h4
          Profile Settings page
          Capture Page Screenshot          page-top-{index}.png
          Scroll Element Into View          xpath=//label[contains(text(),'ADDRESS')]
          Capture Page Screenshot          page-midle-{index}.png
          Scroll Element Into View          xpath://button[contains(text(),'Save')]
          Capture Page Screenshot          page-bottom-{index}.png

Landing page

Side Main Menu
