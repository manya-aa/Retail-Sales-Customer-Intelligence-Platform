import pandas as pd

def total_revenue(df):
    return df["Sales"].sum()


def average_sales(df):
    return df["Sales"].mean()


def sales_distribution(df):
    return {
        "mean": df["Sales"].mean(),
        "median": df["Sales"].median(),
        "max": df["Sales"].max(),
        "min": df["Sales"].min(),
        "q1": df["Sales"].quantile(0.25),
        "q3": df["Sales"].quantile(0.75),
    }


def monthly_sales_trend(df):
    temp = df.copy()
    temp["Month"] = temp["Order Date"].dt.to_period("M")

    return (
        temp.groupby("Month")["Sales"]
        .sum()
        .reset_index()
    )


def monthly_sales_analysis(df):
    temp = df.copy()

    temp["Month_Number"] = temp["Order Date"].dt.month
    temp["Month_Name"] = temp["Order Date"].dt.month_name()

    return (
        temp.groupby(["Month_Number", "Month_Name"])["Sales"]
        .sum()
        .reset_index()
        .sort_values("Month_Number")
    )


def sales_by_region(df):
    return (
        df.groupby("Region")["Sales"]
        .sum()
        .reset_index()
    )


def sales_by_state(df):
    return (
        df.groupby("State")["Sales"]
        .sum()
        .sort_values(ascending=False)
        .head(10)
        .reset_index()
    )


def sales_by_city(df):
    return (
        df.groupby("City")["Sales"]
        .sum()
        .sort_values(ascending=False)
        .head(10)
        .reset_index()
    )


def sales_by_category(df):
    return (
        df.groupby("Category")["Sales"]
        .sum()
        .sort_values(ascending=False)
        .reset_index()
    )


def sales_by_subcategory(df):
    return (
        df.groupby("Sub-Category")["Sales"]
        .sum()
        .sort_values(ascending=False)
        .reset_index()
    )


def sales_by_segment(df):
    return (
        df.groupby("Segment")["Sales"]
        .sum()
        .sort_values(ascending=False)
        .reset_index()
    )


def top_customers(df):
    return (
        df.groupby(["Customer ID", "Customer Name"])["Sales"]
        .sum()
        .sort_values(ascending=False)
        .head(10)
        .reset_index()
    )


def shipping_mode(df):
    return df["Ship Mode"].value_counts().reset_index(name="Count")


def shipping_time(df):
    temp = df.copy()

    temp["Delivery Days"] = (
        temp["Ship Date"] - temp["Order Date"]
    ).dt.days

    return (
        temp.groupby("Ship Mode")["Delivery Days"]
        .mean()
        .reset_index()
    )