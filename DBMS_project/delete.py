import streamlit as st
import pandas as pd
from database import get_all_data,get_cols,get_driver_id,delete_driver

def delete():
# create table driver(Driver_id int auto_increment,Driver_Name varchar(30),Age int,Salary int,Address varchar(255),primary key(Driver_id));
    with st.expander("View data"):
        result=get_all_data('driver')
        cols=get_cols('driver')
        df = pd.DataFrame(result, columns=cols)
        st.dataframe(df)

    d_id=st.selectbox("Choose driver_id to Delete",get_driver_id())

    if st.button("Delete"):
        delete_driver(d_id)
        st.success("Driver Deleted succesfully")

    with st.expander("View Updated data"):
        result=get_all_data('driver')
        cols=get_cols('driver')
        df = pd.DataFrame(result, columns=cols)
        st.dataframe(df)