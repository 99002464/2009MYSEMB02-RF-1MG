*** Settings ***
Library    AppiumLibrary    

*** Keywords ***
Run Application
    Open Application    remote_url=http://localhost:4723/wd/hub    
    ...    platformName=android    deviceName=emulator    app=${EXECDIR}${/}app${/}1MGhealthcare.apk
        
# FOR ADDING SAVLON IN CART
Open 1MG Main Page
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

Goto corona Prevention   
    Click Element    //*[@resource-id='com.aranoah.healthkart.plus:id/service_view']
    Wait Until Element Is Visible    //*[@text='Coronavirus Prevention']
    Click Element    //*[@text='Coronavirus Prevention']

Sort by Price    
    Wait Until Element Is Visible    //*[@text='Sort']    
    Click Element    //*[@text='Sort']
    Wait Until Element Is Visible    //*[@text='Price: Low to High']    
    Click Element    //*[@text='Price: Low to High']

Select Savlon    
    Wait Until Element Is Visible    //*[@text='Savlon Antiseptic Liquid']    
    Click Element    //*[@text='Savlon Antiseptic Liquid']

Select 2 Bottles    
    Wait Until Element Is Visible    //*[@text='1 Bottle'] 
    Click Element    //*[@text='1 Bottle']
    Wait Until Element Is Visible    //*[@text='2']    
    Click Element    //*[@text='2'] 
Add to Cart    
    Wait Until Element Is Visible    //*[@text='Add To Cart'] 
    Click Element    //*[@text='Add To Cart'] 
    

    

# FOR ADDING ODOMOS USING SCROLL
Search Product  
    Wait Until Element Is Visible    //*[@resource-id='com.aranoah.healthkart.plus:id/search']    timeout=30s 
    Click Element    //*[@resource-id='com.aranoah.healthkart.plus:id/search']
    Wait Until Element Is Visible    //*[@text='Search Medicines']    
    
Enter Odomos    
    Input Text    //*[@text='Search Medicines']    odomos
    Wait Until Element Is Visible    //*[@text='Odomos']     
    Click Element    //*[@text='Odomos']

Scroll and Select odomos Gel
    FOR    ${i}    IN RANGE    0    999
        ${list}    Run Keyword And Ignore Error    Get Webelements    xpath=//*[contains(@text,'Gel')]
        Exit For Loop If    '${list}[0]'=='PASS'
        Swipe By Percent    50    60    50    25    3000
    END
     Swipe By Percent    50    60    50    25    3000
     Click Element    xpath=//*[contains(@text,'Gel')]



# Validate Cart for products 
Enter Cart
    Wait Until Page Contains Element    //*[@text='You may also like']
       
    Click Element    //*[@resource-id="com.aranoah.healthkart.plus:id/additional_offer"] 
 
Cancel membership option
    Wait Until Element Is Visible    //*[@resource-id='com.aranoah.healthkart.plus:id/img_cross'] 
    Click Element    //*[@resource-id='com.aranoah.healthkart.plus:id/img_cross']
       
Validate odomos
    Wait Until Element Is Visible    xpath=//*[@resource-id='com.aranoah.healthkart.plus:id/name']
    ${g}    Get Text    xpath=(//*[@resource-id='com.aranoah.healthkart.plus:id/name'])[1]    
    Log To Console    ${g}    
    Element Text Should Be    xpath=(//*[@resource-id='com.aranoah.healthkart.plus:id/name'])[1]    Odomos Naturals Mosquito Repellent Gel
    
validate Savlon
    Wait Until Element Is Visible    xpath=(//*[@resource-id='com.aranoah.healthkart.plus:id/name'])[2]    
    ${g}    Get Text    xpath=(//*[@resource-id='com.aranoah.healthkart.plus:id/name'])[2]    
    Log To Console    ${g}  
    Element Text Should Be    xpath=(//*[@resource-id='com.aranoah.healthkart.plus:id/name'])[2]    Savlon Antiseptic Liquid        
    
Validate savlon quantity
    Element Should Contain Text    xpath=(//*[@resource-id='com.aranoah.healthkart.plus:id/stepper_value'])[2]    2    
    

