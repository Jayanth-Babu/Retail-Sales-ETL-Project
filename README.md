# 🚀 Retail Sales ETL Project  

![ETL Flow](./ETL%20flow.png)  

## 📌 Overview  
This project automates the **extraction, transformation, and loading (ETL)** of retail sales data using **Python, SQL, and Kaggle API**. It aims to analyze **sales performance, product trends, and profitability** by leveraging SQL-based queries.

---

## 🛠 Technologies & Tools Used  
- **📥 Data Extraction:** Kaggle API  
- **🛠 Data Processing & Cleaning:** Python (`pandas`, `zipfile`)  
- **📊 Data Transformation & Loading:** Python (`SQLAlchemy`) → SQL Server  
- **📈 Data Analysis & Querying:** SQL (SQL Server Management Studio)  

---

## 🔄 ETL Process  

### **1️⃣ Data Extraction & Loading**  
✔ Used the **Kaggle API** to download the "Retail Sales Order Data"  
✔ Extracted CSV files using Python's `zipfile` module  
✔ Loaded raw data into a **Pandas DataFrame**  

### **2️⃣ Data Cleaning & Preprocessing**  
✔ Standardized column names (lowercase, no spaces)  
✔ Handled missing values (`fillna()`, `dropna()`)  
✔ Engineered new features (`discount`, `sale_price`, `profit`)  
✔ Removed irrelevant columns (`list_price`, `cost_price`, `discount_percent`)  

### **3️⃣ Data Transformation & Loading into SQL Server**  
✔ Established a **SQLAlchemy** connection to SQL Server  
✔ Loaded cleaned data into the `df_orders` table  

### **4️⃣ Data Analysis (SQL Queries)**  
✔ **Top-Selling Products:** Ranked products by total sales revenue  
✔ **Sales Growth Trends:** Analyzed YoY and MoM sales growth  
✔ **Profitability Insights:** Compared profit growth between **2022 & 2023**  

---

## 🎯 Key Insights  
📌 Identified **top-performing products** based on revenue trends  
📌 Analyzed **sales patterns** to forecast future demand  
📌 Provided **data-driven profitability insights**  

---

## 📢 Conclusion  
This project demonstrates an **end-to-end ETL pipeline** with **API data extraction, Python-based transformation, SQL-based analysis**, and **business intelligence insights**.  

🔥 **Key Skills Demonstrated:**  
✅ API Data Extraction  
✅ Data Cleaning & Feature Engineering  
✅ SQL-Based Analysis & Visualization    
