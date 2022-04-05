let
Source = Csv.Document(File.Contents("C:\Users\Brian\Desktop\DIad\Data\USSales\Sales.csv"),[Delimiter=",", Columns=5, Encoding=1252, QuoteStyle=QuoteStyle.None]),
#"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
#"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"ProductID", Int64.Type}, {"Date", type date}, {"Zip", type text}, {"Units", Int64.Type}, {"Revenue", type number}}),
#"Appended Query" = Table.Combine({#"Changed Type", #"International Sales"}),
#"Filtered Rows" = Table.SelectRows(#"Appended Query", each true),
#"Added Conditional Column" = Table.AddColumn(#"Filtered Rows", "Country Name", each if [Country] = null then "USA" else [Country]),
#"Changed Type1" = Table.TransformColumnTypes(#"Added Conditional Column",{{"Revenue", Currency.Type}, {"Zip", type text}, {"Country Name", type text}}),
#"Filtered Rows1" = Table.SelectRows(#"Changed Type1", each Date.IsInPreviousNYears([Date], 3))
in
#"Filtered Rows1"

