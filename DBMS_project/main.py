import streamlit as st
from create import create
from delete import delete
from read import read
from update import update
from query import Query

def main():
    st.title(" TOUR MANAGEMENT SYSTEM")
    menu = ["Add", "View", "Edit", "Remove", "Query"]
    choice = st.sidebar.selectbox("Menu", menu)
    if choice == "Add":
        st.subheader("Add ")
        create()
    elif choice == "View":
        st.subheader("View created tasks")
        read()
    elif choice == "Edit":
        st.subheader("Update created tasks")
        update()
    elif choice == "Remove":
        st.subheader("Delete created tasks")
        delete()
    elif choice == "Query":
        st.subheader("Execute a Query")
        Query()
    else:
        st.subheader("About tasks")

if __name__ == '__main__':
    main()



