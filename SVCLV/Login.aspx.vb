Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports Telerik.Web.UI
Imports System.Data.SqlClient

Public Class Login
    Inherits System.Web.UI.Page

    ' Public Shared PermissionsEmployee As clsEmployee
    ' Public Shared PermissionsCustomerContact As clsCustomerContact

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Page.ClientTarget = "Uplevel"       ' Resolve IE 11 compatibility problem...
		Session.RemoveAll()

		' Logout???
		If Request.QueryString("a") = "Logout" Then
            Session.Clear()
        End If

        ' Remember Me?
        If Not IsPostBack Then
            txtUserName.Focus()         ' Set focus to Username...

            If Request.Browser.Cookies Then
				If Request.Cookies("ClubTraxLOGIN") IsNot Nothing Then
					Try
						txtUserName.Text = Replace(Request.Cookies("ClubTraxLOGIN").Value, "UNAME=", "")
					Catch
					End Try
				End If
			End If
        End If

    End Sub

    Private Sub cmdLogin_Click(sender As Object, e As System.EventArgs) Handles cmdLogin.Click
		' LOGIN PROCESS...
		Dim strUserName As String

		Dim strPassword As String
		Dim customerContactID As Long = 0
		Dim userinfoID As Long = 0

		strUserName = clsFunctions.StringValidate(txtUserName.Text)
		strPassword = clsFunctions.StringValidate(txtPassword.Text)

		Session.Clear()

		Dim objUserInfo As New clsUserInfo(strUserName, strPassword, True)

		If objUserInfo.intUserID = 0 Then
			lblMessage.Text = "Login failed."
		Else
			Session("gUsername") = strUserName
			Session("gUserID") = objUserInfo.intUserID
			Session("gUserCompanyID") = objUserInfo.intCompanyID
			Session("gUserCustomerID") = objUserInfo.intCustomerID
			Session("gUserType") = objUserInfo.strUserType
			Session("gUserFullName") = objUserInfo.strFullName
			Session("gUserEmail") = objUserInfo.strUserEmail


			Dim strSQL
			Dim locations As String = ""
			strSQL = "SELECT * FROM userlocations WHERE userid=" & Session("gUserID")
			Dim dr As SqlDataReader
			dr = SQLHelper.ExecuteReader(SQLHelper.SQLConnection, CommandType.Text, strSQL)
			While dr.Read
				locations += dr("locationid").ToString() & ","


			End While

			locations = locations.TrimEnd(CChar(","))
			Session("locations") = locations

			Response.Redirect("ticketview.aspx")



		End If





	End Sub


    Public Sub WriteCookie(ByVal strUsernameIn As String, ByVal strPasswordIn As String)
        If (Request.Browser.Cookies) Then
			If (Request.Cookies("ClubTraxLOGIN") Is Nothing) Then
				Response.Cookies("ClubTraxLOGIN").Expires = DateTime.Now.AddDays(30)
				Response.Cookies("ClubTraxLOGIN").Value = strUsernameIn
				' Save Password???
			Else
				Response.Cookies("ClubTraxLOGIN").Expires = DateTime.Now.AddDays(14)
				Response.Cookies("ClubTraxLOGIN").Value = strUsernameIn
				' Save Password???
			End If
        End If
    End Sub


End Class
