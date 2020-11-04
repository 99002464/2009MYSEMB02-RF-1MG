*** Settings ***
Library    AppiumLibrary   

Resource    ../Resources/1MGResources.resource

*** Keywords ***

    
Add Savlon to cart
    Set Appium Timeout    30s 
    Goto corona Prevention
    Sort by Price
    Select Savlon
    Select 2 Bottles
    Add to Cart        
    

Add odomos using search
    Set Appium Timeout    30s
    Search Product
    Enter Odomos
    Scroll and Select odomos Gel
    Add to Cart
*** Test Cases ***

validating cart
    Set Appium Timeout    30s
    Open 1MG Main Page
    Add Savlon to cart  
    Add odomos using search
    Enter Cart 
    Cancel membership option
    Validate odomos
    validate Savlon
    Validate savlon quantity
    

    
