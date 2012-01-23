Set updateSession = CreateObject("Microsoft.Update.Session")
Set updateSearcher = updateSession.CreateupdateSearcher()

Set searchResult = _
updateSearcher.Search("IsInstalled=0 and Type='Software'")

T = 0

For I = 0 To searchResult.Updates.Count-1
    Set update = searchResult.Updates.Item(I)
    If InStr(update.Title, "Language") = 0 Then
    	T = T + 1
    End if
Next

WScript.Echo T
