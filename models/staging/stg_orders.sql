SELECT
    o.orderid,
    o.orderdate,
    o.shipdate,
    o.shipmode,
    o.ordersellingprice - o.ordercostprice as orderprofit,
    o.ordersellingprice,
    o.ordercostprice,
    -- from raw_customer
    c.customername,
    c.segment,
    c.country,

    -- from raw_product
    p.category,
    p.productname,
    p.subcategory
FROM {{ ref('raw_orders') }} as o
LEFT JOIN {{ ref('raw_customer') }} as c
    ON o.customerid = c.customerid
LEFT JOIN {{ ref('raw_product') }} as p
    ON o.productid = p.productid