import streamlit as st
import pandas as pd
from database import add_data,get_all_data,get_cols

def create():
# create table user(user_id int auto_increment,First_Name varchar(15),Last_Name varchar(15),User_Type varchar(10) not null,DOB date,Address varchar(255),primary key(user_id));
    First_Name=st.text_input("First Name")
    Last_Name=st.text_input("Last Name")
    User_Type=st.selectbox("User_Type",['Passeneger','Driver','Admin'])
    DOB=st.date_input('Date of Birth')
    Address=st.text_input('Address')

    if st.button("Add"):
        add_data(First_Name,Last_Name,User_Type,DOB,Address)
        st.success("Successfully Added")

    with st.expander("View data"):
        result=get_all_data('user')
        cols=get_cols('user')
        df = pd.DataFrame(result, columns=cols)
        st.dataframe(df)