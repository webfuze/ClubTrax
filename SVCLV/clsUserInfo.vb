Public Class clsUserInfo

	Public intUserID As Long = 0
	Public strUsername As String
    Public strPassword As String
	Public intCompanyID As Long
	Public intCustomerID As Long
	Public strUserType As String
	Public strUserEmail As String
	Public strFullName As String


	Public Sub New(strUserNameIn As String, strPasswordIn As String, ysnVerifyLogin As Boolean)
		Dim strSQL As String = ""
		Dim ds As DataSet

        If ysnVerifyLogin Then
			strSQL = "SELECT users.userid,users.username,users.password,users.companyid,users.customerid,users.usertype,users.fullname,users.email FROM Users  WHERE UserName = '" & strUserNameIn & "' AND Password = '" & strPasswordIn & "'"

		End If
        ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL)

        If ds Is Nothing Then
        ElseIf ds.Tables.Count = 0 Then
        ElseIf ds.Tables(0).Rows.Count = 0 Then
        Else
            With ds.Tables(0).Rows(0)
				intUserID = .Item("UserId")
				strUsername = .Item("Username")
				strPassword = .Item("Password")
				intCompanyID = .Item("CompanyID")
				intCustomerID = .Item("CustomerID")
				strUserType = .Item("UserType")
				strFullName = .Item("FullName")
				strUserEmail = .Item("Email")
			End With
        End If

    End Sub
End Class
