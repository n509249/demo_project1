SELECT 
  datetime,
  CAST(total_processed AS bigint) AS total_processed,
  src_sys_idnt 
FROM 
  "schema_processed" 
WHERE 
  CAST(datetime AS timestamp) >= TIMESTAMP '2023-10-05 10:00:00'