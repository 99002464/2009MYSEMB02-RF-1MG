*** Settings ***
Library    AppiumLibrary   
Resource    ../Resources/1MGResources.resource
*** Keywords ***
I have to open the application and go to main page
    Run Application
    ${count}    Get Matching Xpath Count    //*[@resource-id='com.aranoah.healthkart.plus:id/close']
    Run Keyword If    ${count} != 0    Click Element    //*[@resource-id='com.aranoah.healthkart.plus:id/close'] 
    Wait Until Element Is Visible    //*[@text='SIGN UP']    timeout=10s  
    Click Element    //*[@text='SIGN UP']
    Wait Until Element Is Visible    //*[@text='Later']    
    Click Element    //*[@text='Later']
    Wait Until Element Is Visible    //*[@text='While using the app']    
    Click Element    //*[@text='While using the app']
    Wait Until Element Is Visible    //*[@resource-id='com.aranoah.healthkart.plus:id/close']    timeout=10s        
    ${count}    Get Matching Xpath Count    //*[@resource-id='com.aranoah.healthkart.plus:id/close']
    Run Keyword If    ${count} != 0    Click Element    //*[@resource-id='com.aranoah.healthkart.plus:id/close']

I go to corona Prevention   
    Click Element    //*[@resource-id='com.aranoah.healthkart.plus:id/service_view']
    Wait Until Element Is Visible    //*[@text='Coronavirus Prevention']
    Click Element    //*[@text='Coronavirus Prevention']

I sort Price low to high     
    Wait Until Element Is Visible    //*[@text='Sort']    
    Click Element    //*[@text='Sort']
    Wait Until Element Is Visible    //*[@text='Price: Low to High']    
    Click Element    //*[@text='Price: Low to High']

I add savlon     
    Wait Until Element Is Visible    //*[@text='Savlon Antiseptic Liquid']    
    Click Element    //*[@text='Savlon Antiseptic Liquid']

I Select 2 Bottles    
    Wait Until Element Is Visible    //*[@text='1 Bottle'] 
    Click Element    //*[@text='1 Bottle']
    Wait Until Element Is Visible    //*[@text='2']    
    Click Element    //*[@text='2'] 
I Add it to Cart    
    Wait Until Element Is Visible    //*[@text='Add To Cart'] 
    Click Element    //*[@text='Add To Cart'] 
    

I go to Cart
    Wait Until Page Contains Element    //*[@text='You may also like']
       
    Click Element    //*[@resource-id="com.aranoah.healthkart.plus:id/cart_action"]
    
I Cancel the membership option
    Wait Until Element Is Visible    //*[@resource-id='com.aranoah.healthkart.plus:id/img_cross'] 
    Click Element    //*[@resource-id='com.aranoah.healthkart.plus:id/img_cross']
   
I should get savlon antiseptic liquid in cart
    Wait Until Element Is Visible    xpath=//*[@resource-id='com.aranoah.healthkart.plus:id/name']    
    ${g}    Get Text    xpath=//*[@resource-id='com.aranoah.healthkart.plus:id/name']  
    Log To Console    ${g}  
    Element Text Should Be    xpath=//*[@resource-id='com.aranoah.healthkart.plus:id/name']    Savlon Antiseptic Liquid
    

*** Test Cases ***
Validation using gherkins
    Given I have to open the application and go to main page
    When I go to corona Prevention
    And I sort Price low to high
    And I add savlon
    And I Select 2 Bottles
    And I Add it to Cart
    And I go to Cart
    and I Cancel the membership option
    Then I should get savlon antiseptic liquid in cart