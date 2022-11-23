
# 3.筛选存储评论
import re
import xlwt
import os

def make_book(uid):
    k=0
    book = xlwt.Workbook(encoding='utf-8',style_compression=0)
    #为每条微博添加表单
    while os.path.exists('E:\PYTHON临时\爬取的评论\农民日报\微博{}of{}.txt'.format(k+1,uid)):
        sheet = book.add_sheet('微博'+str(k+1),cell_overwrite_ok=True)
        content = open('E:\PYTHON临时\爬取的评论\农民日报\微博{}of{}.txt'.format(k+1,uid),'r',encoding='utf-8').read()#读取文件二
        #初步提取评论中的文字
        rawResults1 = re.findall('="ctt">.*?</span>',content,re.S)
        rawResults2 = re.findall('="ct">.*?</span>',content,re.S)
        firstStepResults1  = []
        firstStepResults2  = []
        for result in rawResults1:
            if "@"  in result:
                result=result.replace('</a>','')
                firstStepResults1.append(result[result.find('@'):])
            else:
                firstStepResults1.append(result)
        for result in rawResults2:
                firstStepResults2.append(result)
        subTextHead1 = re.compile('="ctt">')
        subTextHead2 = re.compile('="ct">')
        subTextFoot = re.compile("</span>")
        #将评论和日期写入表单中
        col = ('评论序号','评论内容','评论时间')
        for i in range(0,3):
            sheet.write(0,i,col[i])
        i = 1
        for lastResult in firstStepResults1:
            resultExcel1 = re.sub(subTextHead1, '', lastResult)
            resultExcel = re.sub(subTextFoot, '', resultExcel1)
            sheet.write(i,0,i)
            sheet.write(i,1,resultExcel)
            i+=1
        i = 1
        for lastResult in firstStepResults2:
            resultExcel1 = re.sub(subTextHead2, '', lastResult)
            resultExcel = re.sub(subTextFoot, '', resultExcel1)
            sheet.write(i,2,resultExcel)
            i+=1
        k=k+1
    savepath = 'E:\PYTHON临时\评论excel\{}.xls'.format(uid)
    book.save(savepath)

def main():
    uid="2821669511"
    make_book(uid)

main()