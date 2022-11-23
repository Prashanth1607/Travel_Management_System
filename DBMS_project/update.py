import streamlit as st
import pandas as pd
from database import get_package_id,get_all_data,get_cols,get_package_details,update_package

def update():
    with st.expander("View data"):
        result=get_all_data('package')
        cols=get_cols('package')
        df = pd.DataFrame(result, columns=cols)
        st.dataframe(df)
# create table package(package_id int auto_increment,package_name varchar(30) not null,Duration int,Prize int,primary key(package_id));
    id=st.selectbox('Select Package_id to update',get_package_id())

    res=get_package_details(id)
    new_package_name=st.text_input('Package Name',res[0][1])
    new_duration=st.text_input('Package Duration',res[0][2])
    new_prize=st.text_input('Prize',res[0][3])

    if st.button("Update"):
        update_package(id,new_package_name,new_duration,new_prize)
        st.success("Successfully Updated")

        with st.expander("View Updated data"):
            result=get_all_data('package')
            cols=get_cols('package')
            df = pd.DataFrame(result, columns=cols)
            st.dataframe(df)