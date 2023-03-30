/* views in big query */
SELECT
 * EXCEPT(check_option)
FROM
 `base.dataset.INFORMATION_SCHEMA.VIEWS`


/* BQ info about tables */
SELECT table_id,
    DATE(TIMESTAMP_MILLIS(creation_time)) AS creation_date,
    DATE(TIMESTAMP_MILLIS(last_modified_time)) AS last_modified_date,
    row_count,
    size_bytes,
    CASE
        WHEN type = 1 THEN 'table'
        WHEN type = 2 THEN 'view'
        WHEN type = 3 THEN 'external'
        ELSE '?'
    END AS type,
    TIMESTAMP_MILLIS(creation_time) AS creation_time,
    TIMESTAMP_MILLIS(last_modified_time) AS last_modified_time,
    dataset_id,
    project_id
FROM `base.dataset.__TABLES__`
 
 
 /* BQ extract field names from structs */
 
	 with splitted as (
	  SELECT
	    split(
	      substr(
		s.data_type
		,length("STRUCT<")+1
		,length(s.data_type)-length("STRUCT<")-1)
	      ,", "
	    )             as struct_fields
	    ,table_name   as table_name
	    ,column_name  as column_name
	  FROM `project-id.chema_name.INFORMATION_SCHEMA.COLUMNS` as s
	  where 1=1
	    and s.data_type like 'STRUCT%'
	    -- and table_name like '%words%'
	)

	,fields_from_structs as (
	  select
	     table_name                         as table_name
	    ,column_name                        as column_name
	    ,struct_field                       as struct_field
	    ,split(struct_field,' ')[offset(0)] as struct_field_name
	    ,split(struct_field,' ')[offset(1)] as struct_field_type
	  from splitted, unnest(struct_fields) as struct_field
	  order by 1,2,3
	)

	select
	  *
	from fields_from_structs



/* DDL for table */

SELECT
  table_name,
  ddl
  ,* except(table_name,ddl)
FROM  `project-name.dataset_name.INFORMATION_SCHEMA.TABLES`
WHERE  table_name="table_name"
