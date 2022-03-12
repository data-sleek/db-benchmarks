targetdir=/mnt/volume_sfo3_01/dataset

# loop using array
array=( customer lineitem nation orders part partsupp region supplier )
for i in "${array[@]}"
do
    echo "Compressing ${i}.tbl ..."
    gzip /mnt/volume_sfo3_01/dataset/${i}.tbl
	echo "Copying ${i}.tbl.gz ..."
    aws s3 cp ${targetdir}/${i}.tbl.gz s3://datasleek-datasets/tpch100/${i}.tbl.gz
done

# loop using array

array=( customer lineitem nation orders part partsupp region supplier )
for i in "${array[@]}"
do

	echo "Copying ${i}.tbl.gz ..."
    aws s3 cp s3://datasleek-datasets/tpch100/${i}.tbl.gz ${targetdir}/
    echo "Unzip ${i}.tbl.gz ..."
    gunzip /mnt/volume_sfo3_01/dataset/${i}.tbl.gz
done


 

