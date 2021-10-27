*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${URL}    https://www.blink22.com/
${Driver}     chrome

*** Keywords ***
starTest
    Open Browser    ${URL}    ${Driver}
    Maximize Browser Window
    
endTest
    Close Browser