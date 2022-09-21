

import urllib.request

url = 'https://www.starbucks.com.cn/menu/'

response = urllib.request.urlopen(url)

content = response.read().decode('utf-8')


from bs4 import BeautifulSoup

soup = BeautifulSoup(content,'lxml')

# //ul[@class="grid padded-3 product"]//strong/text()
name_list = soup.select('ul[class="grid padded-3 product"] strong')

for name in name_list:
    # with open("菜单.txt","w",encoding="utf-8") as fp:
    #     fp.write(str(name))


    txt = name.get_text()
    with open("菜单.txt",'a', encoding="utf-8") as fp:
        fp.write(txt+'\n')

    print(name.get_text())
