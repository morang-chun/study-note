import os

import win32com.client as win32

file_path = r"E:\PYTHON临时\评论excel"


def to_xlsx(file):
    excel = win32.gencache.EnsureDispatch('Excel.Application')
    wb = excel.Workbooks.Open(file)
    wb.SaveAs(file + 'x', FileFormat=51)  # FileFormat = 51 is for .xlsx extension
    wb.Close()  # FileFormat = 56 is for .xls extension
    excel.Application.Quit()


if __name__ == '__main__':
    os_listdir = os.listdir(file_path)
    for i in os_listdir:
        file = os.path.join(file_path, i)
        to_xlsx(file)