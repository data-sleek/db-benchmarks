log()
{ echo "$(date +'%m/%d %H:%M:%S') $1 $2"
}

targetdir=/mnt/dataset/

# loop using array
# array=( customer lineitem nation orders part partsupp region supplier )
# for i in "${array[@]}"
# do
#     echo "Compressing ${i}.tbl ..."
#     gzip /mnt/volume_sfo3_01/dataset/${i}.tbl
# 	echo "Copying ${i}.tbl.gz ..."
#     aws s3 cp ${targetdir}/${i}.tbl.gz s3://datasleek-datasets/tpch100/${i}.tbl.gz
# done

# loop using array

array=( customer lineitem nation orders part partsupp region supplier )

for i in "${array[@]}"
do
	echo "Copying ${i}.tbl.gz ..."
    aws s3 cp s3://datasleek-datasets/tpch100/${i}.tbl.gz ${targetdir}/
    echo "Unzip ${i}.tbl.gz ..."
    gunzip ${targetdir}/${i}.tbl.gz
done


for i in "${array[@]}"
do
log "Loading ${i}.tbl..."
memsql -uroot -pxxxx tpch -e"LOAD DATA INFILE '${targetdir}/${i}.tbl' INTO TABLE tpch.${i} FIELDS TERMINATED BY '|' LINES TERMINATED BY '|\n';"
log "Done Loading ${i}.tbl..."
done


 for i in "${array[@]}"
do
log "Clearing table ${i}"
memsql -uroot -pxxxx -e"select count(*) from tpch.${i};"
log "- - - -"
done

 
memsql -uroot -pxxxx -e"show databases"
