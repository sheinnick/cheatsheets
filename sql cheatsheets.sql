/*разница в днях можно использовать для джойнов*/
DATEDIFF (DAY, C2.[DateTime], [client].[Contacts].[DateTime]) <= 180 --выбирает, где разница не больше 180


/*выбрать все записи с одинаковым [ClientCartId], отсортировать по дате, пронумировать, результат вывести в колонку [RowNumber]*/
ROW_NUMBER () OVER (PARTITION BY [ClientCartId] ORDER BY [DateTime]) AS [RowNumber]


/*преобразование типов даты*/
CAST (CAST (Ct.[DateTime] AS DATE) AS DATETIME)
-- — сначала в дейт, потом в дейттайм



/*выводит все записи из таблицы, где для каждого zamer_id есть строки, в которых больше чем 1 уникальное значение в колонке client_card_id*/
select
    *
from [table.name]
where zamer_id in (
    select zamer_id
    from [table.name]
    group by zamer_id
    having count(distinct client_card_id)>1)
order by zamer_id , client_card_id