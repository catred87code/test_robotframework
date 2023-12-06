*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description

*** Variables ***
${LOGIN URL}  https://scouts-test.futbolkolektyw.pl/en
${BROWSER}    Chrome
${EMAILINPUT}    xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${SIGNINBUTTON}    xpath=//*[@type='submit']
${PAGELOGO}    xpath=//*[@id="__next"]/div[1]/header/div/h6
${ADDPLAYERBUTTON}    xpath=//span[contains(text(), 'Add')]
${FORMNAME}    xpath=//input[@name='name']
${FORMSURNAME}    xpath=//input[@name='surname']
${FORMPOSITION}    xpath=//input[@name='mainPosition']
${FORMSUBMIT}    xpath=//button/span[text() = 'Submit']
${FORMAGE}    xpath=//*[@id='__next']/div[1]/main/div[2]/form/div[2]/div/div[7]/div/p
${FORMCLEAR}    xpath=//button/span[text() = 'Clear']
${LANGUAGEMENU}    xpath=//*[@id='__next']/div[1]/div/div/div/ul[2]/div[1]/div[2]/span
${PLAYERSMENU}    xpath=//*[text()='Players']
${SIGNOUT}    xpath=//*[@id='__next']/div[1]/div/div/div/ul[2]/div[2]/div[2]/span




*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser
    
Fill in Add Player form
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on the Add Player button
    Type in name
    Type in surname
    Type in main position
    Click on Sumbit in form
    Assert Form

Clear Add Player form
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on the Add Player button
    Type in name
    Type in surname
    Type in main position
    
Change language
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Changing language
    
Redirect to players list
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on players tab
    
Logout
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Sign Out
    
*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Scouts panel - sign in
Type in email
    Input Text     ${EMAILINPUT}    user04@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}    Test-1234
Click on the Submit button
    Click Element    xpath=//*[@type='submit']
Assert dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be    Scouts panel
    Capture Page Screenshot    alert.png
Click on the Add Player button
    Click Element    ${ADDPLAYERBUTTON}    
Type in name
    Wait Until Element Is Visible    ${FORMNAME}
    Input Text    ${FORMNAME}    Pola
Type in surname
    Input Text    ${FORMSURNAME}    Negri
Type in main position
    Input Text    ${FORMPOSITION}    Blocker
Click on Sumbit in form 
    Click Element    ${FORMSUBMIT}
    Click Element    ${FORMSUBMIT}
Assert Form
    Wait Until Element Is Visible    ${FORMAGE}
    Element Text Should Be    ${FORMAGE}    Required
Clear Form
    Click Element    ${FORMCLEAR}
Changing language
    Click Element    ${LANGUAGEMENU}
Click on players tab    
    Click Element    ${PLAYERSMENU} 
Sign Out
    Click Element    ${SIGNOUT}
    
 

    
 
