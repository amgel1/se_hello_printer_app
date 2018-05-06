from selenium import webdriver
import unittest
import time
import pytest

@pytest.mark.uitest
class TestFormater(unittest.TestCase):
    def test_plain_lowercase(self):
        driver = webdriver.Chrome()
        driver.get("http://127.0.0.1:5000/ui")
        t = driver.find_element_by_xpath("/html/body/h1")
        print (t.text)

        self.assertEqual(t.text, "Witaj swiecie")
        driver.quit()
