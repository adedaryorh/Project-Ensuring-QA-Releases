# #!/usr/bin/env python3
from datetime import datetime
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options as ChromeOptions

Locators = {'id_username': 'user-name', 'id_password': 'password', 'id_login': 'login-button',
            'class_add_to_cart': 'inventory_item', 'class_remove': 'btn_secondary '}

# Start the browser and login with standard_user
def login(user, password):
    print(timestamp() + 'Starting the browser...')
    options = ChromeOptions()
    options.add_argument('--no-sandbox')
    options.add_argument("--headless")
    # driver = webdriver.Chrome('/Users/welcome/Downloads/chromedriver')
    driver = webdriver.Chrome(options=options)
    driver.get('https://www.saucedemo.com/')
    print(timestamp() + 'Browser started successfully. Navigating to the demo page to login.')
    driver.find_element_by_id(Locators['id_username']).send_keys(user)
    driver.find_element_by_id(Locators['id_password']).send_keys(password)
    driver.find_element_by_id("login-button").click()
    assert get_current_end_point(driver.current_url) == "inventory.html"
    print(timestamp() + f'Login with username {user} and password {password} successfully.')
    return driver


def add_items(driver):
    assert get_current_end_point(driver.current_url) == "inventory.html"
    print(timestamp() + 'Add items to cart')
    inventory_list = driver.find_elements_by_class_name(
        Locators['class_add_to_cart'])
    for element in inventory_list:
        item_name = element.find_element_by_class_name(
            'inventory_item_name').text
        element.find_element_by_class_name('btn_inventory').click()
        print(timestamp() + f'Added {item_name} to cart')
    driver.find_element_by_class_name('shopping_cart_link').click()
    print(timestamp() + f'{len(inventory_list)} items were added to shopping the cart successfully.')


def remove_cart(driver):
    for item in driver.find_elements_by_class_name('cart_item'):
        item_name = item.find_element_by_class_name('inventory_item_name').text
        item.find_element_by_class_name('cart_button').click()
        print(timestamp() + f'Removed {item_name} from cart')
    driver.find_element_by_class_name('btn_secondary').click()
    print(timestamp() + 'All items were removed from the shopping cart successfully.')

def timestamp():
    ts = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    return ts + '\t'

def get_current_end_point(url: str) -> str:
    return url.split("/")[-1]

if __name__ == "__main__":
    driver = login(user='standard_user', password='secret_sauce')
    add_items(driver=driver)
    remove_cart(driver=driver)
    print(timestamp() + 'Selenium tests ran successfully and completed.')

