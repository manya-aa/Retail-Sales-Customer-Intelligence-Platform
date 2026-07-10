import pandas as pd

def data_type_correction(df):
    df["Order Date"] = pd.to_datetime(df["Order Date"], dayfirst=True)
    df["Ship Date"] = pd.to_datetime(df["Ship Date"], dayfirst=True)
    df["Postal Code"] = df["Postal Code"].astype(int)
    
