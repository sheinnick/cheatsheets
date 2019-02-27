/*достаем из строки только цифры*/
#"parse nums" = Table.AddColumn(#"Changed Type", "NewColumnName", each Text.Combine(List.RemoveNulls(List.Transform(Text.ToList([SourceColumn]),each if Value.Is(Value.FromText(_), type number) then _ else null)))),

/*заменяем часть строки значением из др колонки*/
if Text.Contains([utm_campaign], "{campaign_id}")
   then Text.Replace([utm_campaign], "{campaign_id}", Number.ToText([CampaignId],"D"))
   else [utm_campaign]