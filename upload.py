import pandas as pd
from sqlalchemy import create_engine

csv_path = r"C:\Users\LENOVO\Desktop\internship(aggregation)\online_retail_II.csv"  
df = pd.read_csv(csv_path)

df.rename(columns={"Customer": "CustomerID"}, inplace=True)

engine = create_engine("postgresql://postgres:Admin123*@localhost:5432/retail_project_db")

df.to_sql("retail_data", engine, if_exists="replace", index=False)

print("Data uploaded successfully!")
