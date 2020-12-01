'Собирает листов и ссылки — делает оглавление
Sub SheetList()
   Dim sheet As Worksheet
   Dim cell As Range
   With ActiveWorkbook
      For Each sheet In ActiveWorkbook.Worksheets
         Set cell = Worksheets(1).Cells(sheet.Index, 1)
         .Worksheets(1).Hyperlinks.Add anchor:=cell, Address:="", SubAddress:="'" & sheet.Name & "'" & "!A1"
         cell.Formula = sheet.Name
      Next
   End With
End Sub

'сохраняет каждый лист, как csv
Sub SplitSheets2()
    Dim s As Worksheet
    Dim wb As Workbook
    Set wb = ActiveWorkbook
    For Each s In wb.Worksheets                                'проходим во всем листам активной книги
        s.Copy                                                 'сохраняем лист как новый файл
        ActiveWorkbook.SaveAs wb.Path & "\" & s.Name & ".csv", FileFormat:=xlCSV   'сохраняем файл
    Next
End Sub