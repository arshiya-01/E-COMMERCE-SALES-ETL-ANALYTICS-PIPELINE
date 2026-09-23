import pandas as pd
from pathlib import Path

BASE = Path(__file__).resolve().parents[1]
INPUT = BASE / "data" / "raw_ecommerce_sales.csv"
OUTPUT = BASE / "data" / "clean_ecommerce_sales.csv"

def extract(path):
    return pd.read_csv(path)

def transform(df):
    df = df.copy()
    df.columns = [c.strip().lower() for c in df.columns]
    df = df.drop_duplicates(subset=["order_id"], keep="first")

    text_cols = ["order_id","customer_id","product","category","region","city",
                 "payment_method","order_status"]
    for col in text_cols:
        df[col] = df[col].astype("string").str.strip()

    df["category"] = df["category"].str.title()
    df["order_status"] = df["order_status"].str.title()
    df["order_date"] = pd.to_datetime(df["order_date"], errors="coerce")
    df["quantity"] = pd.to_numeric(df["quantity"], errors="coerce").fillna(1)
    df["unit_price"] = pd.to_numeric(df["unit_price"], errors="coerce")
    df["unit_price"] = df["unit_price"].fillna(df["unit_price"].median())
    df["discount"] = pd.to_numeric(df["discount"], errors="coerce").fillna(0)
    df["city"] = df["city"].fillna("Unknown")

    df = df[(df["quantity"] > 0) & (df["unit_price"] > 0)]
    df["gross_sales"] = df["quantity"] * df["unit_price"]
    df["discount_amount"] = df["gross_sales"] * df["discount"]
    df["net_sales"] = df["gross_sales"] - df["discount_amount"]
    df["estimated_cost"] = df["net_sales"] * 0.72
    df["profit"] = df["net_sales"] - df["estimated_cost"]
    df["order_month"] = df["order_date"].dt.to_period("M").astype(str)
    return df

def load(df, path):
    df.to_csv(path, index=False)

if __name__ == "__main__":
    raw = extract(INPUT)
    clean = transform(raw)
    load(clean, OUTPUT)
    print(f"ETL complete: {len(raw)} raw rows -> {len(clean)} clean rows")
