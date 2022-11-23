import mysql.connector
import streamlit as st

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",
    database="Sample_project"
)
c = mydb.cursor()

def execute_query(query):
    try:
        c.execute(query)
        if query.split()[0].lower() not in ['select','show','desc']:
            mydb.commit()
        data = c.fetchall()
        return [data,c.column_names]
    except BaseException as e:
        if str(e)=='No result set to fetch from.':
            st.success('querry successful')
            return 1
        st.error(e)
        return 0

def add_data(F_name,L_name,Type,dob,address):
    c.execute('insert into user(First_Name,Last_Name,User_Type,DOB,Address) values(%s,%s,%s,%s,%s)',(F_name,L_name,Type,dob,address))
    mydb.commit()

def get_tables():
    c.execute('show tables')
    res = c.fetchall()
    tables = [i[0]  for i in res ]
    return tables

def get_cols(table):
    c.execute(f'select * from {table}')
    res = c.fetchall()
    attributes = c.column_names
    return attributes

def get_all_data(table):
    c.execute(f'select * from {table}')
    res = c.fetchall()
    return res

def get_package_id():
    c.execute('select distinct(package_id) from package')
    res=c.fetchall()
    id_list = [i[0]  for i in res ]
    return id_list

def get_package_details(id):
    c.execute(f'select * from package where package_id={id}')
    res=c.fetchall()
    return res

def update_package(id,new_package_name,new_duration,new_prize):
    c.execute('update package set package_name=%s,Duration=%s,Prize=%s where package_id=%s',(new_package_name,new_duration,new_prize,id))
    mydb.commit()

def get_driver_id():
    c.execute('select distinct(Driver_id) from driver')
    res=c.fetchall()
    id_list = [i[0]  for i in res ]
    return id_list

def delete_driver(d_id):
    c.execute(f'delete from driver where Driver_id={d_id}')
    mydb.commit()