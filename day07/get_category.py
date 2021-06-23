import requests
from bs4 import BeautifulSoup
import get_items


def get_category(category_link, category_name):
    res = requests.get(category_link)
    soup = BeautifulSoup(res.content, "html.parser")
    
    print(category_link, category_name)
    
    # get_items(soup, category_name, "ALL")

    categories = soup.select('div.gbest-cate ul.by-group li a')

    sub_categories = soup.select('div.gbest-cate div.cate-l div.navi.group ul li a')
    for sub_category in categories:
        res = requests.get('http://corners.gmarket.co.kr' + sub_category['href']) 
        soup = BeautifulSoup(res.content, 'html.parser')
        get_items(soup, category_name, sub_category.get_text())
        # print(category_link, category_name, sub_category.get_text(), 'http://corners.gmarket.co.kr' + sub_category['href'])  