import matplotlib.pyplot as plt

import requests
import re
import time


def get_one_page(url):#获取用户主页上的所有微博的信息
    headers = {
    'User-agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',
    'Host' : 'weibo.cn',
    'Accept' : 'application/json, text/plain, */*',
    'Accept-Language' : 'zh-CN,zh;q=0.9',
    'Accept-Encoding' : 'gzip, deflate, br',
    'Cookie' : 'WEIBOCN_FROM=1110006030; loginScene=102003; SUB=_2A25OeR-SDeRhGeBK71oX8SbOwj2IHXVthaHarDV6PUJbkdANLRHbkW1NR6PhDV-zDyLHuRMDAxQSh59HOeuxzs-S; _T_WM=75189904294; XSRF-TOKEN=8547be; mweibo_short_token=fddb9fb857; MLOGIN=1; M_WEIBOCN_PARAMS=lfid%3D102803%26luicode%3D20000174%26uicode%3D20000174',
    'DNT' : '1',
    'Connection' : 'keep-alive'
     }#书写请求头，注意把User-agent和Cookie替换为你自己的
    response = requests.get(url,headers = headers,verify=False)#利用requests.get命令获取网页html
    if response.status_code == 200:
        return response.text
    return None

def parse_one_page(html,uid):#解析文本并存储有用信息
    #正则解析html
    pattern1 = re.compile('id="M_.*?"', re.S)
    pattern2 = re.compile('评论\[.*?\]', re.S)
    expattern3 = re.compile('原文评论\[.*?\]', re.S)
    items1 = re.findall(pattern1,html)
    items2 = re.findall(pattern2,html)
    items3 = re.findall(expattern3, html)
    for i in items2:
        for j in items3:
            if i in j:
                items2.remove(i)
                break
    result1 = str(items1)
    result2 = str(items2)
    #将所有微博的id及其页数写入本地文本
    with open('E:\PYTHON临时\微博爬取微博id和页数\农民日报\{}.txt'.format(uid),'a',encoding='utf-8') as fp:#文件路径自替换，后同
        fp.write(result1)
        fp.write(result2)

def make_one_txt(PageNum,uid):#主页翻页遍历
    for i in range(PageNum):
        url = "https://weibo.cn/{}/profile?filter=0&page=".format(uid)+str(i+1)
        html = get_one_page(url)
        print('正在爬取{}用户的第{}页微博'.format(uid,i+1))
        parse_one_page(html,uid)
        time.sleep(1)

def main():
    uid='2821669511'#用户的uid，可在主页网址栏中找到
    PageNum=1#用户微博页数
    make_one_txt(PageNum,uid)
main()



