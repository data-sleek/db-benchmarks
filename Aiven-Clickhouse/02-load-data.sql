create database tpch ; 
use tpch;

-- S3 BUCKET
For each file : 
    FIELDS TERMINATED BY '|'
    LINES TERMINATED BY '|\n';

LOAD DATA S3 'memsql-tpch-dataset/sf_100/lineitem/'
LOAD DATA S3 'memsql-tpch-dataset/sf_100/customer/'
LOAD DATA S3 'memsql-tpch-dataset/sf_100/nation/'
LOAD DATA S3 'memsql-tpch-dataset/sf_100/orders/'
LOAD DATA S3 'memsql-tpch-dataset/sf_100/part/'
LOAD DATA S3 'memsql-tpch-dataset/sf_100/partsupp/'
LOAD DATA S3 'memsql-tpch-dataset/sf_100/region/'
LOAD DATA S3 'memsql-tpch-dataset/sf_100/supplier/'
 