import mysql.connector
import pandas as pd

file_path = "C:/Users/ACER/Downloads/Data Scientist-Analyst position - Requirement.xlsx"
xls = pd.ExcelFile(file_path)


dau_tu = pd.read_excel(xls, sheet_name='Đầu tư')
doanh_thu = pd.read_excel(xls, sheet_name='Doanh thu')

conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='Trantuankha0508@',
    database='Map_Pacific_Singapore'
)
cursor = conn.cursor()

create_table_sql = """
CREATE TABLE IF NOT EXISTS dau_tu (
    No INT,
    Tháng VARCHAR(10),
    Năm INT,
    `Khách hàng C2` VARCHAR(50),
    `Khách Hàng C1` VARCHAR(50),
    Tỉnh VARCHAR(50),
    `Tên hoạt động` VARCHAR(50),
    `Số lượng` FLOAT,
    `Nhóm Sản phẩm` VARCHAR(50),
    `Sản Phẩm` VARCHAR(50),
    `Cây Trồng` VARCHAR(50),
    `SL Nông Dân` INT,
    `Đầu tư` FLOAT,
    `Triển khai` VARCHAR(50)
);
"""

cursor.execute(create_table_sql)

sql = """
INSERT INTO dau_tu (`No`, `Tháng`, `Năm`, `Khách hàng C2`, `Khách Hàng C1`, `Tỉnh`, `Tên hoạt động`, `Số lượng`, `Nhóm Sản phẩm`, `Sản Phẩm`, `Cây Trồng`, `SL Nông Dân`, `Đầu tư`, `Triển khai`)
VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
"""

for i, row in dau_tu.iterrows():
    cursor.execute(sql, tuple(row))

create_table_sql_doanh_thu = """
CREATE TABLE IF NOT EXISTS doanh_thu(
    No INT,
    Năm INT,
    Tháng VARCHAR(10),
    `Khách hàng C2` VARCHAR(50),
    `Khách hàng C1` VARCHAR(50),
    Tỉnh VARCHAR(50),
    `Sản phẩm` VARCHAR(50),
    `Số lượng` FLOAT,
    `Doanh thu` FLOAT,
    `Nhóm sản phẩm` VARCHAR(50)
);
"""
cursor.execute(create_table_sql_doanh_thu)

insert_sql = """
INSERT INTO doanh_thu (`No`, `Năm`, `Tháng`, `Khách Hàng C2`, `Khách hàng C1`, `Tỉnh`, `Sản phẩm`, `Số lượng`, `Doanh thu`, `Nhóm sản phẩm`)
VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
"""

for i, row in doanh_thu.iterrows():
    cursor.execute(insert_sql, tuple(row))


conn.commit()
cursor.close()
conn.close()