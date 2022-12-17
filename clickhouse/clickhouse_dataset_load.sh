# created a 200GB Mount in DIGital O and attached to instance

cd /mnt/volume_sfo3_01
mkdir dataset 
cd dataset 

aws s3 cp s3://xxxx/customer.tbl ./
aws s3 cp s3://xxx/lineitem.tbl ./
aws s3 cp s3://xxx/nation.tbl ./
aws s3 cp s3://xxx/orders.tbl ./
aws s3 cp s3://xxx/part.tbl ./
aws s3 cp s3://xxx/partsupp.tbl ./
aws s3 cp s3://xxx/region.tbl ./
aws s3 cp s3://xxx/supplier.tbl ./

# Please time the load for each !!
clickhouse-client --format_csv_delimiter="|" --query="INSERT INTO tpch.customer FORMAT CSV" < /mnt/volume_sfo3_01/dataset/customer.tbl
clickhouse-client --format_csv_delimiter="|" --query="INSERT INTO tpch.lineitem FORMAT CSV" < /mnt/volume_sfo3_01/dataset/lineitem.tbl
clickhouse-client --format_csv_delimiter="|" --query="INSERT INTO tpch.nation FORMAT CSV" < /mnt/volume_sfo3_01/dataset/nation.tbl
clickhouse-client --format_csv_delimiter="|" --query="INSERT INTO tpch.orders FORMAT CSV" < /mnt/volume_sfo3_01/dataset/orders.tbl
clickhouse-client --format_csv_delimiter="|" --query="INSERT INTO tpch.part FORMAT CSV" < /mnt/volume_sfo3_01/dataset/part.tbl
clickhouse-client --format_csv_delimiter="|" --query="INSERT INTO tpch.partsupp FORMAT CSV" < /mnt/volume_sfo3_01/dataset/partsupp.tbl
clickhouse-client --format_csv_delimiter="|" --query="INSERT INTO tpch.region FORMAT CSV" < /mnt/volume_sfo3_01/dataset/region.tbl
clickhouse-client --format_csv_delimiter="|" --query="INSERT INTO tpch.supplier FORMAT CSV" < /mnt/volume_sfo3_01/dataset/supplier.tbl

# Do a count on each table to verify
clickhouse-client 
