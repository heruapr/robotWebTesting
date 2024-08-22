*** Settings ***
Library    Browser

*** Variables ***
${URL}          https://www.saucedemo.com/
${USERNAME}     standard_user
${PASSWORD}     secret_sauce
${FIRST_NAME}   first_name
${LAST_NAME}    last_name
${ZIP_CODE}     12345
${PRODUCT_ADD_TO_CART_BUTTON}      id=add-to-cart-sauce-labs-backpack
${CART_BUTTON}  css=a[data-test="shopping-cart-link"]
${CHECKOUT}     css=button[data-test="checkout"]
${CONTINUE_PURCHASE_BUTTON}     css=input[data-test="continue"]

*** Test Cases ***
Successful Checkout Product
    Given the user is on the login page
    When the user logs in with username and password
    And the user adds a product to the cart
    And the user views the cart
    Then the user proceeds to checkout

*** Keywords ***
The user is on the login page
    New Browser    headless=false
    New Page    ${URL}

The user logs in with username and password
    Fill Text    input[id="user-name"]    ${USERNAME}
    Fill Text    input[id="password"]     ${PASSWORD}
    Click    id=login-button

The user adds a product to the cart
    Click    ${PRODUCT_ADD_TO_CART_BUTTON}

The user views the cart
    Click    ${CART_BUTTON}

The user proceeds to checkout
    Click    ${CHECKOUT}
    Fill Text   css=input[data-test="firstName"]    ${FIRST_NAME}
    Fill Text   css=input[data-test="lastName"]     ${LAST_NAME}
    Fill Text   css=input[data-test="postalCode"]   ${ZIP_CODE}
    Click    ${CONTINUE_PURCHASE_BUTTON}