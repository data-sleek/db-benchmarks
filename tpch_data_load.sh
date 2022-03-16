array=( customer lineitem nation orders part partsupp region supplier )

# Clickhouse Data Load
for i in "${array[@]}"
do
log "Loading ${i}.tbl..."
clickhouse-client --password xxx --format_csv_delimiter="|" --query="INSERT INTO tpch.${i} FORMAT CSV" < ${targetdir}/${i}.tbl
log "Done Loading ${i}.tbl..."
done

# SingleStore Data Load
for i in "${array[@]}"
do
log "Loading ${i}.tbl..."
memsql -uroot -pxxx tpch -e"LOAD DATA INFILE '${targetdir}/${i}.tbl' INTO TABLE tpch.${i} FIELDS TERMINATED BY '|' LINES TERMINATED BY '|\n';"
log "Done Loading ${i}.tbl..."
done

