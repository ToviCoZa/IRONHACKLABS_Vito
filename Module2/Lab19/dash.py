from operator import index
from sklearn.datasets import load_breast_cancer
import streamlit as st
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# main = st.container()
with st.container():
    # st.set_page_config(layout="wide")
    plt.style.use('seaborn')
    st.header('Breast Cancer Statistics Dashboard')
    col1, col2 = st.columns(2)
    
    breast_cancer = load_breast_cancer(as_frame=True)
    breast_cancer_df = pd.concat((breast_cancer['data'], breast_cancer['target']), axis=1)
    breast_cancer_df['target'] = [breast_cancer.target_names[val] for val in breast_cancer_df['target']]


    # st.markdown('Dataframe')
    # st.dataframe(breast_cancer_df)

    with col1:
        st.header('Scatter chart', anchor='1stchart')
        st.sidebar.header('Scatter chart', anchor='1stchart')

        x = str(st.sidebar.selectbox("X Axis", breast_cancer_df.columns, index=0, key='xScatter'))
        y = str(st.sidebar.selectbox("Y Axis", breast_cancer_df.columns, index=1, key='yScatter'))
        fig, ax = plt.subplots()
        
        ax = plt.scatter(breast_cancer_df[x],breast_cancer_df[y])

        st.pyplot(fig)
        st.header('Bar plot', anchor='2ndchart')
        st.sidebar.header('Bar plot', anchor='2ndchart')
        labels = st.sidebar.multiselect(label='choose categories to be ploted in barchart', options = breast_cancer_df.columns, default='mean texture')
        st.bar_chart([breast_cancer_df[str(i)] for i in labels])

    with col2:
        st.header('Histogram', anchor='3rdchart')
        st.sidebar.header('Histogram', anchor='3rdchart')
        hist_labels = st.sidebar.multiselect(label='choose categories to be plotted in histogram', options = breast_cancer_df.columns, default='mean texture')
        # size_of_bins = st.radio(label='Number of bins', options=range(1,16))
        size_of_bins = st.sidebar.select_slider(label='Number of bins', options=range(1,16))
        fig2, ax1 = plt.subplots()
        ax1 = plt.hist(x=[breast_cancer_df[str(i)] for i in hist_labels], bins=size_of_bins)

        st.pyplot(fig2)

        st.sidebar.header('Hexbin chart', anchor='4thchart')
        st.header('Hexbin chart', anchor='4thchart')
        xHex = str(st.sidebar.selectbox("X Axis", breast_cancer_df.columns, index=0, key='xHex'))
        yHex = str(st.sidebar.selectbox("Y Axis", breast_cancer_df.columns, index=1, key='yHex'))

        fig, ax3 = plt.subplots()
        ax3 = plt.hexbin(breast_cancer_df[xHex],breast_cancer_df[yHex])

        st.pyplot(fig)



