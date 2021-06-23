# main/sub category 정보 수집

import requests
from bs4 import BeautifulSoup
import pymysql

res = requests.get("http://corners.gmarket.co.kr")

soup = BeautifulSoup(res.content, "html.parser")

categories = soup.select('div.gbest-cate ul.by-group li a')

def save_data(item_info):
    conn = pymysql.connect(host='localhost',port=3306,user='root',passwd='1234',db='mydb',charset='utf8')
    cursor = conn.cursor()

    sql = """insert into items values(
    '""" + item_info['item_code'] + """', 
    '""" + item_info['title'] + """', 
    """ + str(item_info['origin_price']) + """, 
    """ + str(item_info['discount_price']) + """,
    """ + str(item_info['discount_percent']) + """,
    '""" + item_info['provider'] + """');"""
    cursor.execute(sql)

    sql1 = """insert into ranking(main_category, sub_category, item_ranking, item_code) values(
    '""" + item_info['category_name'] + """', 
    '""" + item_info['sub_category_name'] + """', 
    """ + str(item_info['ranking']) + """, 
    '""" + item_info['item_code'] + """');"""
    cursor.execute(sql1)
    
    

    conn.commit()
    conn.close()

def get_items(html, category_name, sub_category_name):
    items_result_list = list()
    best_item = html.select('div.best-list')
    for idx, item in enumerate(best_item[1].select('li')):
        dict_data = dict()
            
        ranking = idx + 1

        title = item.select_one('a.itemname')
        origin_price = item.select_one('div.o-price')
        discount_price = item.select_one('div.s-price strong span')
        discount_percent = item.select_one('div.s-price em')

        if origin_price == None or origin_price.get_text() == '':
                origin_price = discount_price
        if discount_price == None:
            origin_price, discount_price = 0, 0
        else:
            origin_price = origin_price.get_text().replace(',','').replace('원','')
            discount_price = discount_price.get_text().replace(',','').replace('원','')
        
        if discount_percent == None or discount_percent == '':
            discount_percent = 0
        else:
            discount_percent = discount_percent.get_text().replace('%','')
        
        
        product_link = item.select_one('div.thumb > a')
        item_code = product_link.attrs['href'].split('=')[1].split('&')[0]
        
        res = requests.get(product_link.attrs['href'])
        soup = BeautifulSoup(res.content, 'html.parser')
        provider = soup.select_one('div.item-topinfo_headline > p > span')
        
        if provider == None:
            provider = ''
        else:
            provider = provider.get_text()
            
            
        dict_data['category_name'] = category_name  
        dict_data['sub_category_name'] = sub_category_name
        dict_data['ranking'] = ranking
        dict_data['title'] = title.get_text()
        dict_data['origin_price'] = origin_price
        dict_data['discount_price'] = discount_price       
        dict_data['discount_percent'] = discount_percent 
        dict_data['item_code'] = item_code    
        dict_data['provider'] = provider.replace('\n','')    
        
        print(dict_data)
        save_data(dict_data)



def get_category(category_link, category_name):
    res = requests.get(category_link)
    soup = BeautifulSoup(res.content, "html.parser")
    
    # print(category_link, category_name)
    
    # get_items(soup, category_name, "ALL")
    
    sub_categories = soup.select('div.gbest-cate div.cate-l div.navi.group ul li a')
    for sub_category in categories:
        res = requests.get('http://corners.gmarket.co.kr' + sub_category['href']) 
        soup = BeautifulSoup(res.content, 'html.parser')
        get_items(soup, category_name, sub_category.get_text())
        # print(category_link, category_name, sub_category.get_text(), 'http://corners.gmarket.co.kr' + sub_category['href'])     
    

for category in categories:
    # print('http://corners.gmarket.co.kr' + category['href'], category.get_text())    
    get_category('http://corners.gmarket.co.kr' + category['href'], category.get_text()) 
    # save_data.save_data(get_items(soup, category.get_text(), category.get_text()))