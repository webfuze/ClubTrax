Public Class clsFunctions
	' Added 10/14/2019...
	Shared Function StringValidate(ByVal sIn As String) As String
        Dim sOut As String
        Dim badChars As New ArrayList
        Try
            sIn = RTrim(sIn)
        Catch
        End Try
        sOut = sIn
        sIn = sIn.Replace("'", "")
        badChars.Add("select")
        badChars.Add("drop table")
        badChars.Add(";")
        badChars.Add("--")
        badChars.Add("insert")
        badChars.Add("delete")
        badChars.Add("xp_")
        badChars.Add("sp_")
        badChars.Add("www")
        badChars.Add("http://")
        badChars.Add("<script>")
        badChars.Add("declare")
        badChars.Add("update")
        badChars.Add("@@")
        badChars.Add(".js ")
        badChars.Add(Chr(34))

        For i = 0 To badChars.Count - 1
            sOut = Replace(sOut, badChars(i), "")
            sOut = Replace(sOut, UCase(badChars(i)), "")
        Next
        Return sOut
    End Function

End Class
