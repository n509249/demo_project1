DROP TABLE IF EXISTS cpm_feed;
CREATE EXTERNAL TABLE IF NOT EXISTS cpm_feed (cpm_id string,param_details string,member_identifier string,customer_type string,permission_value_config string,last_updated_tm string) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe' WITH SERDEPROPERTIES ('field.delim' = ',') LOCATION 's3://cust360-events-loyalty-extract-cpm/';
