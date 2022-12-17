-- Query 1 
select count(*) from lineitem ; 
-- Query 2 
select min(l_shipdate), max(l_shipdate) from lineitem limit 10 ; 
-- Query 3 
SELECT l_returnflag 
,l_linestatus 
,SUM(l_quantity) AS sum_qty 
,SUM(l_extendedprice) AS sum_base_price 
,SUM(l_extendedprice * (1-l_discount)) AS sum_disc_price 
,SUM(l_extendedprice * (1-l_discount) * (1+l_tax)) AS sum_charge 
,AVG(l_quantity) AS avg_qty 
,AVG(l_extendedprice) AS avg_price 
,AVG(l_discount) AS avg_disc 
,COUNT(*) AS count_order 
FROM lineitem 
WHERE l_shipdate BETWEEN '1991-01-01' AND '1993-12-31' 
GROUP BY l_returnflag 
,l_linestatus 
ORDER BY l_returnflag 
,l_linestatus 
LIMIT 10 ;
-- Query 4 
SELECT * 
FROM part p 
JOIN partsupp p2 
ON p.p_partkey = p2.ps_partkey AND p.p_partkey =1 
LIMIT 10 
-- Query 5 
SELECT p.p_partkey 
,p.p_name 
,p2.ps_availqty 
,s.s_name 
FROM part p 
JOIN partsupp p2 
ON p.p_partkey = p2.ps_partkey AND p.p_partkey =1 
JOIN supplier s 
ON p2.ps_suppkey = s.s_suppkey 
LIMIT 10 ;  
-- Query 6 
SELECT p.p_partkey 
,p.p_name 
,p2.ps_availqty 
,s.s_name 
FROM part AS p 
INNER JOIN partsupp AS p2 
ON p.p_partkey = p2.ps_partkey 
INNER JOIN supplier AS s 
ON p2.ps_suppkey = s.s_suppkey 
LIMIT 10; 
-- Query 7 
SELECT p.p_partkey 
,p.p_name 
,s.s_name 
,SUM(p2.ps_availqty) AS total_available 
FROM part p 
JOIN partsupp p2 
ON p.p_partkey = p2.ps_partkey -- AND p.p_partkey =1 
JOIN supplier s 
ON p2.ps_suppkey = s.s_suppkey 
GROUP BY p.p_partkey 
,p.p_name 
,s.s_name 
LIMIT 10 ; 
-- QUERY 08 
SET max_memory_usage = 40000000000; 
SELECT p.p_partkey 
,p.p_name 
,s.s_name 
,SUM(p2.ps_availqty) AS total_available 
,SUM(l.l_quantity) AS total_qty_ordered 
FROM part p 
JOIN partsupp p2 
ON p.p_partkey = p2.ps_partkey 
JOIN supplier s 
ON p2.ps_suppkey = s.s_suppkey 
JOIN lineitem l 
ON l.l_partkey = p2.ps_partkey AND l.l_suppkey = p2.ps_suppkey AND p.p_partkey BETWEEN 1 AND 100000 GROUP BY p.p_partkey 
,p.p_name 
,s.s_name 
ORDER BY total_available desc 
LIMIT 10 ; 
-- QUERY 09 
SET max_memory_usage = 40000000000; 
SELECT l_orderkey 
,SUM(l_extendedprice * (1 - l_discount)) AS revenue 
,o_orderdate 
,o_shippriority 
FROM customer, orders, lineitem 
WHERE c_mktsegment = 'BUILDING'
AND c_custkey = o_custkey 
AND l_orderkey = o_orderkey 
AND o_orderdate < date('1995-03-15') 
AND l_shipdate > date('1995-03-15') 
GROUP BY l_orderkey 
,o_orderdate 
,o_shippriority 
ORDER BY revenue desc 
,o_orderdate 
LIMIT 10; 
-- QUERY 10 
SET max_memory_usage = 40000000000; 
SELECT c_custkey 
,c_name 
,SUM(l_extendedprice * (1 - l_discount)) AS revenue 
,c_acctbal 
,n_name 
,c_address 
,c_phone 
,c_comment 
FROM customer, orders, lineitem, nation 
WHERE c_custkey = o_custkey 
AND l_orderkey = o_orderkey 
AND o_orderdate >= date('1993-10-01') 
AND o_orderdate < date('1993-10-01') + interval '3' month 
AND l_returnflag = 'R' 
AND c_nationkey = n_nationkey 
GROUP BY c_custkey 
,c_name 
,c_acctbal 
,c_phone 
,n_name 
,c_address 
,c_comment 
ORDER BY revenue desc 
LIMIT 20; 
-- QUERY 11 
SET max_memory_usage = 45000000000; 
SELECT nation 
,o_year 
,SUM(amount) AS sum_profit 
FROM 
( 
SELECT n_name AS nation 
,extract(year 
FROM o_orderdate) AS o_year, l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount FROM part, supplier, lineitem, partsupp, orders, nation 
WHERE s_suppkey = l_suppkey 
AND ps_suppkey = l_suppkey 
AND ps_partkey = l_partkey 
AND p_partkey = l_partkey 
AND o_orderkey = l_orderkey 
AND s_nationkey = n_nationkey 
AND p_name like '%green%' 
) AS profit 
GROUP BY nation 
,o_year 
ORDER BY nation 
,o_year desc;
