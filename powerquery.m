/*достаем из строки только цифры*/
    /*в расширенном редакторе*/
    #"parse nums" = Table.AddColumn(#"Changed Type", "NewColumnName", each Text.Combine(List.RemoveNulls(List.Transform(Text.ToList([SourceColumn]),each if Value.Is(Value.FromText(_), type number) then _ else null)))),

    /*во всплывающем окне*/
    Text.Combine(List.RemoveNulls(List.Transform(Text.ToList([utm_campaign without vars]),each if Value.Is(Value.FromText(_), type number) then _ else null)))

/*заменяем часть строки значением из др колонки*/
if Text.Contains([utm_campaign], "{campaign_id}")
   then Text.Replace([utm_campaign], "{campaign_id}", Number.ToText([CampaignId],"D"))
   else [utm_campaign]


/* generate list of dates */
(dateStart, dateEnd) =>
let
    Query1 = List.Generate(
    ()=>dateStart,
    (x)=>x<=dateEnd,
    (x)=>Date.AddDays(x,1)
    ),    
    #"Converted to Table" = Table.FromList(Query1, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    #"Renamed Columns1" = Table.RenameColumns(#"Converted to Table",{{"Column1", "Дата"}}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Renamed Columns1",{{"Дата", type date}})
in
    #"Changed Type1"