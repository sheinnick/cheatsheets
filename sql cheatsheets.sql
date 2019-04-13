/*разница в днях можно использовать для джойнов*/
-- DATEDIFF (DAY, C2.[DateTime], [client].[Contacts].[DateTime]) <= 180 --выбирает, где разница не больше 180


/*выбрать все записи с одинаковым [ClientCartId], отсортировать по дате, пронумировать, результат вывести в колонку [RowNumber]*/
-- ROW_NUMBER () OVER (PARTITION BY [ClientCartId] ORDER BY [DateTime]) AS [RowNumber]


/*преобразование типов даты*/
-- CAST (CAST (Ct.[DateTime] AS DATE) AS DATETIME)
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
UPDATE Table.Name
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
/*добавить колонки*/
ALTER TABLE crm.PhoneCalls ADD 
    [Id] INT IDENTITY (1,1),  --индес +1
    [TextColumn] [nvarchar](255) NULL -- текст до 255 символов
GO


-------------------------------
/* update set нескольких значений, и с джойном */
update u
set
u.assid = s.assid
u.aaasss= s.ffdfd
from ud u
    inner join sale s on
        u.id = s.udid


--Убирать лишние пробелы
UPDATE [client].[TableName]
SET [Campaign] = TRIM([Campaign])


--Удалить все строки в таблице
TRUNCATE TABLE [core].[AnalyticsDataRaw]
--или
DELETE from [core].[AnalyticsDataRaw]

-- Удалить строки в таблице, которые соответствуют условию
DELETE from [core].[AnalyticsDataRaw]
where [ProfileId] = 12