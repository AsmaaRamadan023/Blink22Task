*** Settings ***
Library    SeleniumLibrary   

*** Variables ***
${blogTab}    xpath:/html/body/header/div/div/div[2]/ul/li[5]/a
${fristName}    name:firstname
${lastname}    name:lastname
${email}    name:email
${submitBtn}    id:_form_55_submit
${acceptCookesBtn}    xpath:/html/body/div[2]/button
${errorMessageOfFristName}    xpath:/html/body/div[1]/div/section/div[2]/div/div[2]/div/form/div[1]/div[2]/div/div/div[2]
${errorMessageOfLastName}    xpath:/html/body/div[1]/div/section/div[2]/div/div[2]/div/form/div[1]/div[3]/div/div/div[2]
${errorMessageOfEmail}    xpath:/html/body/div[1]/div/section/div[2]/div/div[2]/div/form/div[1]/div[4]/div/div/div[2]
${thanksMessage}    xpath:/html/body/div[1]/div/section/div[2]/div/div[2]/div/form/div[2]


*** Keywords ***
OpenBlogPage
    BuiltIn.Sleep    5s  
    SeleniumLibrary.Click Button    ${acceptCookesBtn}
    SeleniumLibrary.Go To    https://www.blink22.com/blog
    
Check placeholders text 
    SeleniumLibrary.Element Attribute Value Should Be    ${fristName}    placeholder    Your first name... 
    SeleniumLibrary.Element Attribute Value Should Be    ${lastname}    placeholder    Your last name...  
    SeleniumLibrary.Element Attribute Value Should Be    ${email}    placeholder    Your email...          
    
Check mandatory fields
    SeleniumLibrary.Click Button    ${submitBtn}    
    SeleniumLibrary.Element Text Should Be    ${errorMessageOfFristName}    This field is required. 
    SeleniumLibrary.Element Text Should Be    ${errorMessageOfLastName}    This field is required.    
    SeleniumLibrary.Element Text Should Be    ${errorMessageOfEmail}    This field is required.    
    
Check that if email didnt contain @ is not accepted
    
    SeleniumLibrary.Input Text    ${fristName}    Asmaa
    SeleniumLibrary.Input Text    ${lastname}    Ramadan    
    SeleniumLibrary.Input Text    ${email}    invaildEmail.com  
    SeleniumLibrary.Element Text Should Be    ${errorMessageOfEmail}    Enter a valid email address. 
    
Check that if email didnt contain dot is not accepted
        SeleniumLibrary.Input Text    ${email}    invaild@Email  
        SeleniumLibrary.Element Text Should Be    ${errorMessageOfEmail}    Enter a valid email address. 

    
Check that Thanks message after submission with valid data
    SeleniumLibrary.Input Text    ${fristName}    Asmaa
    SeleniumLibrary.Input Text    ${lastname}    Ramadan    
    SeleniumLibrary.Input Text    ${email}    asmaa.sayed@ibtikar.net.sa 
    SeleniumLibrary.Click Button    ${submitBtn}    
    BuiltIn.Sleep    5s    
    SeleniumLibrary.Element Text Should Be    ${thanksMessage}    Thanks for signing up! Check your inbox for your Welcome package!    
    
             
   
  