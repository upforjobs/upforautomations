*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Library           String
Library           SeleniumLibrary
Resource          _keywords.txt
Resource          _mysetup.txt
Library           XvfbRobot

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
evansmunyuki.com
    Maximize Browser Window
    Go To    https://www.evansmunyuki.com
    #header
    Wait Until Element Is Visible    xpath://a[contains(text(),'evansmunyuki.com')]
    Element Should Be Visible    xpath://a[contains(text(),'evansmunyuki.com')]
    Element Text Should Be    xpath://a[contains(text(),'evansmunyuki.com')]    evansmunyuki.com
    Element Should Be Visible    xpath://body/div[@id='root']/div[1]/div[1]/div[1]/div[1]/a[1]/i[1]
    Element Should Be Visible    xpath://body/div[@id='root']/div[1]/div[1]/div[1]/div[1]/a[2]/i[1]
    Element Should Be Visible    xpath://body/div[@id='root']/div[1]/div[1]/div[1]/div[1]/a[3]/i[1]
    #body
    Element Should Be Visible    class:Banner_BannerHeading__250_x
    Element Text Should Be    xpath://h2[contains(text(),'Available in hardcover, ebook, and audiobook. Orde')]    Available in hardcover, ebook, and audiobook. Order now on Amazon!
    Element Should Be Visible    xpath://h2[contains(text(),'Learn about digitalization from the award-winning ')]
    Element Text Should Be    xpath://h2[contains(text(),'Learn about digitalization from the award-winning ')]    Available in hardcover, ebook, and audiobook. Order now on Amazon!
    Element Should Be Visible    xpath://body/div[@id='root']/div[2]/div[1]/div[1]/div[2]/img[1]
    Element Should Be Visible    xpath://body/div[@id='root']/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/a[1]/span[1]
    Element Should Be Enabled    xpath://body/div[@id='root']/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/a[1]/span[1]
    Capture Page Screenshot    root2-{index}.png
