#main/sub category + 상품 정보 수집
import requests
from bs4 import BeautifulSoup

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
            
            # print(category_name, sub_category_name, ranking, item_code, provider, title.get_text(), origin_price, discount_price, discount_percent)