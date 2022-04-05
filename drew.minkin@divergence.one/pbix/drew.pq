let
    Source = Csv.Document(File.Contents("C:\DIAD\Data\USSales\Sales.csv"),[Delimiter=",", Columns=5, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"ProductID", Int64.Type}, {"Date", type date}, {"Zip", type text}, {"Units", Int64.Type}, {"Revenue", type number}}),
    #"Appended Query" = Table.Combine({#"Changed Type", #"International Sales"}),
    #"Added Conditional Column" = Table.AddColumn(#"Appended Query", "CountryName", each if [Country] = null then "USA" else [Country]),
    #"Removed Columns" = Table.RemoveColumns(#"Added Conditional Column",{"Country"}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Removed Columns",{{"CountryName", type text}, {"Revenue", Currency.Type}}),
    #"Filtered Rows" = Table.SelectRows(#"Changed Type1", each Date.IsInPreviousNYears([Date], 3))
in
    #"Filtered Rows"