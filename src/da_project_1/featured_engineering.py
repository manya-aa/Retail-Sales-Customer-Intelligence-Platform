
def create_date_features(df):
    df["Order Year"] = df["Order Date"].dt.year
    df["Order Quarter"] = "Q" + df["Order Date"].dt.quarter.astype(str)
    df["Order Month"] = df["Order Date"].dt.month_name()
    df["Order Month Number"] = df["Order Date"].dt.month
    df["Order Weekday"] = df["Order Date"].dt.day_name()
    df["Is Weekend"] = df["Order Date"].dt.dayofweek >= 5

    return df


def create_shipping_features(df):
    df["Delivery Days"] = (df["Ship Date"] - df["Order Date"]).dt.days
    df["Fast Delivery"] = df["Delivery Days"] <= 2

    return df


def create_customer_features(df):
    df["Customer Order Count"] = (
        df.groupby("Customer ID")["Order ID"]
        .transform("nunique")
    )

    df["Customer Lifetime Sales"] = (
        df.groupby("Customer ID")["Sales"]
        .transform("sum")
    )

    return df


def create_product_features(df):
    df["Product Total Sales"] = (
        df.groupby("Product ID")["Sales"]
        .transform("sum")
    )

    df["Product Order Count"] = (
        df.groupby("Product ID")["Order ID"]
        .transform("count")
    )

    return df


def create_location_features(df):
    df["State Total Sales"] = (
        df.groupby("State")["Sales"]
        .transform("sum")
    )

    df["City Total Sales"] = (
        df.groupby("City")["Sales"]
        .transform("sum")
    )

    return df


def save_data(df, output_path):
    df.to_csv(output_path, index=False)


