*** Settings ***
Library    SeleniumLibrary    
Resource    TestBase.robot
Resource    ../Pages/blogPage.robot

Suite Setup    TestBase.starTest
Suite Teardown    TestBase.endTest


*** Test Cases ***
Check fields placeholders text
    BuiltIn.Sleep    5s
    blogPage.OpenBlogPage
    blogPage.check placeholders text
    
Check that submission cant be done if a required field is missing
    blogPage.Check mandatory fields
    
Check that Invalid email format is not accepted
    blogPage.Check that if email didnt contain dot is not accepted
    blogPage.Check that if email didnt contain @ is not accepted
    
Check that Thanks message should appear after submission with valid data
    blogPage.Check that Thanks message after submission with valid data