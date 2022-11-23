import streamlit as st
import pandas as pd
from database import get_all_data,get_cols,get_tables

def read():
    table_list=get_tables()
    table=st.selectbox("Choose a table to view",table_list)
    if st.button("view table"):
        result=get_all_data(table)
        cols=get_cols(table)
        df = pd.DataFrame(result, columns=cols)
        st.dataframe(df)
    