# 2.爬取微博评论
import requests
import re
import time

k = 0


def get_one_page(url):  # 获取每条微博的所有信息
    headers = {
        'User-agent': 'your User-agent',
        'Host': 'weibo.cn',
        'Accept': 'application/json, text/plain, */*',
        'Accept-Language': 'zh-CN,zh;q=0.9',
        'Accept-Encoding': 'gzip, deflate, br',
        'Cookie': 'WEIBOCN_FROM=1110006030; loginScene=102003; SUB=_2A25OePZpDeRhGeBK71oX8SbOwj2IHXVtgpohrDV6PUJbkdANLWP4kW1NR6PhDRajsjW1CowX9MRpILL6wNfz2mRz; _T_WM=23014161512; XSRF-TOKEN=fcc0ec; mweibo_short_token=5b197f3ff1; MLOGIN=1; M_WEIBOCN_PARAMS=lfid%3D102803%26luicode%3D20000174%26uicode%3D20000174',
        'DNT': '1',
        'Connection': 'keep-alive'
    }
    response = requests.get(url, headers=headers, verify=False)
    if response.status_code == 200:
        return response.text
    return None


def parse_one_page(html, uid):  # 解析文本并存储有用信息
    global k
    pattern1 = re.compile('<span class="ctt">.*?</span>', re.S)
    pattern2 = re.compile('<span class="ct">.*?</span>', re.S)
    items1 = re.findall(pattern1, str(html))
    items2 = re.findall(pattern2, str(html))
    result1 = str(items1)
    result2 = str(items2)
    with open('E:\PYTHON临时\爬取的评论\农民日报\微博{}of{}.txt'.format(k, uid), 'a', encoding='utf-8') as fp:
        fp.write(result1)
        fp.write(result2)


def make_one_txt(PageNum, uid, ComChara):  # 评论翻页遍历
    global k
    k = k + 1
    for i in range(PageNum):
        url = "https://weibo.cn/comment/" + ComChara + "?" + uid + "&rl=1&page=" + str(i)
        html = get_one_page(url)
        print('正在爬取第{}条微博的第{}页评论'.format(k, i + 1))
        parse_one_page(html, uid)
        # time.sleep(1)


def get_PNCC(TxtStr):  # 读取文件一，匹配id和页数
    content = open(TxtStr, 'r', encoding='utf-8').read()
    TotalComNum = content.count('评论')
    rawResults1 = re.findall('_.*?"', content, re.S)
    rawResults2 = re.findall('评论\[.*?\]', content, re.S)
    firstStepResults1 = []
    firstStepResults2 = []
    for result in rawResults1:
        firstStepResults1.append(result[result.find('_') + 1:result.find('"')])
    for result in rawResults2:
        if "[0]" in result:
            firstStepResults2.append("此微博无评论")
            continue
        temp = int(result[result.find('[') + 1:result.find(']')]) // 10 + 1
        firstStepResults2.append(str(temp))
    ls = [firstStepResults1, firstStepResults2, TotalComNum]
    return ls


def main():
    uid = '2821669511'
    PNCC = get_PNCC('E:\PYTHON临时\微博爬取微博id和页数\农民日报\{}.txt'.format(uid))
    for i in range(PNCC[2]):
        if PNCC[1][i] != "此微博无评论":
            make_one_txt(int(PNCC[1][i]), uid, PNCC[0][i])


main()
# 单条微博的话就直接从第二步开始，
# 把第二步的代码修改一下，直接手动键入微博id和评论页数就行，不用get_PNCC函数进行微博id和页数的读取