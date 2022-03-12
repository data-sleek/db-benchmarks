create database tpch;
USE tpch;

CREATE TABLE `customer` (
  `c_custkey` UInt32 ,
  `c_name` String ,
  `c_address` String  ,
  `c_nationkey` UInt32 ,
  `c_phone` String ,
  `c_acctbal` Float32 ,
  `c_mktsegment` String ,
  `c_comment` String)
  ENGINE = MergeTree ORDER BY c_custkey ;

CREATE TABLE `lineitem` (
  `l_orderkey` UInt32 ,
  `l_partkey` UInt32 ,
  `l_suppkey` UInt32 ,
  `l_linenumber` UInt32 ,
  `l_quantity` Float32 ,
  `l_extendedprice` Float32 ,
  `l_discount` Float32 ,
  `l_tax` Float32 ,
  `l_returnflag` String ,
  `l_linestatus` String,
  `l_shipdate` date ,
  `l_commitdate` date ,
  `l_receiptdate` date ,
  `l_shipinstruct` String ,
  `l_shipmode` String ,
  `l_comment` String )
   ENGINE = MergeTree  ORDER BY l_orderkey ;
;
CREATE TABLE `nation` (
  `n_nationkey` UInt32 ,
  `n_name` String ,
  `n_regionkey` UInt32 ,
  `n_comment` String )
 ENGINE = MergeTree  ORDER BY n_nationkey ;
;
CREATE TABLE `orders` (
  `o_orderkey` UInt32 ,
  `o_custkey` UInt32 ,
  `o_orderstatus` String ,
  `o_totalprice` Float32 ,
  `o_orderdate` date ,
  `o_orderpriority` String ,
  `o_clerk`  String ,
  `o_shippriority` UInt32 ,
  `o_comment`  String)
  ENGINE = MergeTree  ORDER BY o_orderkey ;

CREATE TABLE `part` (
  `p_partkey` UInt32 ,
  `p_name`  String ,
  `p_mfgr` String ,
  `p_brand` String ,
  `p_type` String ,
  `p_size` UInt32 ,
  `p_container` String ,
  `p_retailprice` Float32 ,
  `p_comment` String)
   ENGINE = MergeTree  ORDER BY p_partkey ;

drop table partsupp;
CREATE TABLE `partsupp` (
  `ps_partkey` UInt32 ,
  `ps_suppkey` UInt32 ,
  `ps_availqty` UInt32 ,
  `ps_supplycost` Float32 ,
  `ps_comment` String)
     ENGINE MergeTree ORDER BY ps_partkey ;





CREATE TABLE `region` (
  `r_regionkey` UInt32 ,
  `r_name` String ,
  `r_comment` String)
   ENGINE = MergeTree  ORDER BY r_regionkey ;
   
CREATE TABLE `supplier` (
  `s_suppkey` UInt32 ,
  `s_name` String ,
  `s_address` String ,
  `s_nationkey` UInt32 ,
  `s_phone` String ,
  `s_acctbal` Float32 ,
  `s_comment` String)
   ENGINE = MergeTree  ORDER BY s_suppkey ;