/*разница в днях можно использовать для джойнов*/
-- DATEDIFF (DAY, C2.[DateTime], [client].[Contacts].[DateTime]) <= 180 --выбирает, где разница не больше 180


/*выбрать все записи с одинаковым [ClientCartId], отсортировать по дате, пронумировать, результат вывести в колонку [RowNumber]*/
-- ROW_NUMBER () OVER (PARTITION BY [ClientCartId] ORDER BY [DateTime]) AS [RowNumber]


/*преобразование типов даты*/
select
CAST(CAST (Ct.[DateTime] AS DATE) AS DATETIME)
from Ttable.name as Ct
-- — сначала в дейт, потом в дейттайм

-------------------

/*выводит все записи из таблицы, где для каждого zamer_id есть строки, в которых больше чем 1 уникальное значение в колонке client_card_id*/
select
    *
from [table.name]
where zamer_id in 
    (
        select zamer_id
        from [table.name]
            group by zamer_id
            having count(distinct client_card_id)>1
    )
order by zamer_id , client_card_id
------------------


/* запустить код в тестовом режиме, посмотреть как отработало и откатить.
Если всё ок, то rollback заменяем на submit */

BEGIN TRAN
-- внутри пишем код
    INSERT INTO tablename VALUES
		(141, 1, N'пример 1', 44, 0, 0, NULL, 1, '2017-01-01', NULL, 3, 0, 0, NULL, NULL, 0),
		(142, 1, N'пример 2', 44, 0, 0, NULL, 1, '2017-01-01', NULL, 3, 0, 0, NULL, NULL, 0)

	--вывод того, что вставили
	SELECT * FROM tablename
	WHERE id IN (141,142)
    
ROLLBACK	-- откатиться
--	COMMIT		-- выкатить в БД
------------------


/* дописать в значение колонки еще что-то
например была колонка «Color» в ней были значения «черный», «белый», чтобы дописать в каждое значение « светлый»*/
UPDATE Tble.Name
SET [color] = [color] + N' светлый'
-------------------------


/* заменить подстроку в строковой колонке */
BEGIN TRAN
UPDATE TTable.Name
set [ColumnName] = REPLACE([ColumnName], N'substring to replace', N'new substring')
WHERE [Id] IN (1340)

--ROLLBACK
COMMIT	

------------------------------
/* добавить колонки в таблицу + ключи*/
ALTER TABLE [core].[Atoms] ADD
    [Extension1]    INT NULL,
    [Extension2]    INT NULL,
    [Extension3]    INT NULL,
    [Extension4]    INT NULL,
    [Extension5]    INT NULL,
    CONSTRAINT [FK_Atoms_AtomExtensions1] FOREIGN KEY ([Extension1]) REFERENCES [core].[AtomExtensions1] ([Id]),
    CONSTRAINT [FK_Atoms_AtomExtensions2] FOREIGN KEY ([Extension2]) REFERENCES [core].[AtomExtensions2] ([Id]),
    CONSTRAINT [FK_Atoms_AtomExtensions3] FOREIGN KEY ([Extension3]) REFERENCES [core].[AtomExtensions3] ([Id]),
    CONSTRAINT [FK_Atoms_AtomExtensions4] FOREIGN KEY ([Extension4]) REFERENCES [core].[AtomExtensions4] ([Id]),
    CONSTRAINT [FK_Atoms_AtomExtensions5] FOREIGN KEY ([Extension5]) REFERENCES [core].[AtomExtensions5] ([Id])
GO


--------------
/* добавить колонки */
ALTER TABLE crm.PhoneCalls ADD 
    [Id] INT IDENTITY (1,1),  /* индес +1 */
    [TextColumn] [nvarchar](255) NULL /* текст до 255 символов */
GO


-------------------------------
/* update set нескольких значений, и с джойном */
update u
set
u.assid  = s.assid,
u.aaasss = s.ffdfd
from ud u
    inner join sale s on
        u.id = s.udid


/* Убирать лишние пробелы */
UPDATE [client].[TableName]
SET [Campaign] = TRIM([Campaign])


/* Удалить все строки в таблице */
TRUNCATE TABLE [core].[AnalyticsDataRaw]
/* или  */
DELETE from [core].[AnalyticsDataRaw]

/* Удалить строки в таблице, которыют условию */
DELETE from [core].[AnalyticsDataRaw]
where [ProfileId] = 12


/* сделать копию таблицы из имеющейся, если нужна полная копия то убираем кляузу where и всё что за ней */
SELECT * INTO client.TableCopy FROM client.TableSource WHERE client.TableSource.Id>=1


/* переменные с датами */
DECLARE     @DateEnd    DATE = cast(getdate() as date)
DECLARE     @DateStart  DATE = cast(DATEADD(day,-10,@DateEnd) AS date)

DECLARE     @DateStart  DATE    = '2020-03-01'
DECLARE     @DateEnd    DATE    = '2020-04-10'

DECLARE     @endDatePlusOneDay  DATE
SELECT      @endDatePlusOneDay  = DATEADD(DAY, 1, @DateEnd)

/*
T-SQL: Splitting a String into multiple columns
https://social.technet.microsoft.com/wiki/contents/articles/26937.t-sql-splitting-a-string-into-multiple-columns.aspx
*/

/* спсиок всех таблиц */
SELECT table_catalog [database], table_schema [schema], table_name  name, table_schema+N'.'+table_name schemaAndName, table_type type
FROM INFORMATION_SCHEMA.TABLES
where table_schema like '%crm%'

/* спсиок всех таблиц и в последней колонке делаем код для показа 1000 записей упорядоченных по 1 колонке*/
SELECT table_catalog [database]
	,table_schema [schema]
	,table_name name
	,table_schema + N'.' + table_name schemaAndName
	,table_type type
	,N'select top 1000 * from ' + table_schema + N'.' + table_name + N' order by 1 desc' as [select]
FROM INFORMATION_SCHEMA.TABLES
WHERE table_schema LIKE '%crm%'

/*список всех колонок */
SELECT table_schema+ N'.' +TABLE_NAME AS [Имя таблицы],
        COLUMN_NAME AS [Имя столбца],
        DATA_TYPE AS [Тип данных столбца],
        IS_NULLABLE AS [Значения NULL]
FROM INFORMATION_SCHEMA.COLUMNS
where COLUMN_NAME like N'%carbrand%'


/*сгруппировать что-то в понедельник, первое число */
SELECT
DATEFROMPARTS(YEAR(cef.DateTime),MONTH(cef.DateTime),1) AS [First date of month],
CAST(DATEADD(DAY,2-1*iif(DATEPART(WEEKDAY, cef.DateTime)!=1,DATEPART(WEEKDAY, cef.DateTime),8) ,cef.DateTime) AS date) AS [First date of week]
from core.cellsEndsFriday cef


/* достать значение из JSON'a */
SELECT  JSON_VALUE(ctn.[Json], '$.visitor_first_campaign_name') as [visitor_first_campaign_name]
FROM    core.TableName ctn



/* первичный ключ id */
CREATE TABLE [core].[Blablabla]
    [Id] INT IDENTITY(1, 1) NOT NULL,
-- блаблабла
    CONSTRAINT [PK_Blablabla] PRIMARY KEY ([Id])
GO


/* индексы */ -- /* оценить фрагментацию индексов таблицы */
SELECT a.object_id, object_name(a.object_id) AS TableName,
    a.index_id, name AS IndedxName, avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats
    (DB_ID (N'DB_NAME')							-- insert your database name
        , OBJECT_ID(N'schema_name.table_name')	-- insert your table name
        , NULL
        , NULL
        , NULL) AS a
INNER JOIN sys.indexes AS b
    ON a.object_id = b.object_id
    AND a.index_id = b.index_id;
GO

/* индексы */ -- /* перестроить индексы таблицы */
ALTER INDEX ALL ON schema.table			REBUILD WITH (ONLINE = ON)

/* created */
ALTER TABLE [schema].[table] ADD
Created datetime null

ALTER TABLE [schema].[table] ADD  DEFAULT (getdate()) FOR [Created]


/* views in big query */
SELECT
 * EXCEPT(check_option)
FROM
 `base.dataset.INFORMATION_SCHEMA.VIEWS`