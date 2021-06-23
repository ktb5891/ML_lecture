import pymysql


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