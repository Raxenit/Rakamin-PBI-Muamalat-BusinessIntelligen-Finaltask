-- Membuat Tabel Master
CREATE TABLE MasterDataTable as
SELECT
    orders.Date as order_date,
    productcategory.CategoryName as category_name,
    products.ProdName as product_name,
    products.Price as product_price,
    orders.Quantity as order_qty,
    orders.Quantity * products.Price as total_sales,
    customers.CustomerEmail as cust_email,
    customers.CustomerCity as cust_city
FROM
    customers
inner join
    orders ON customers.CustomerID = orders.CustomerID
inner join
    products ON orders.ProdNumber = products.ProdNumber
inner join
    productcategory ON products.Category = productcategory.CategoryID;
-- Mengurutkan Data berdasarkan Tanggal Transaksi
SELECT * FROM
    MasterDataTable ORDER BY order_date;