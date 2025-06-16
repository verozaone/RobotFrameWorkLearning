*** Settings ***
Documentation    To Validate the login form
Library    SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${Error_Message_Login}       css:.alert-danger

*** Test Cases ***
Validate UnSucessful Login
    open the browser with Mortage payment url
    fill the login Form
    wait until it checks and display error message
    Verfiy Error Message Is Correct

*** Keywords ***
open the browser with Mortage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/
Fill the login Form
    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    123456
    Click Button      id:signInBtn

wait until it checks and display error message

    Wait Until Element Is Visible    ${Error_Message_Login} 

Verfiy Error Message Is Correct
   ${result}=     Get Text                           ${Error_Message_Login}
   Should Be Equal As Strings                        ${result}         Incorrect username/password.
    
    
      
    
