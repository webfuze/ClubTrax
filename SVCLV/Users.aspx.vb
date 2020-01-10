

Imports Telerik.Web.UI

Public Class Users
	Inherits System.Web.UI.Page


	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


		Dim strSQL

		strSQL = "SELECT * FROM UserView "

		If Session("gUserType") = "MASTER" Then
			'****** SHow all for MASTER - at this point - 10/28/2019
		End If

		If Session("gUserType") = "COMPANY" Then
			strSQL = strSQL & " WHERE companyid=" & Session("gUserCompanyID")
		End If

		If Session("gUserType") = "CUSTOMER" Then
			strSQL = strSQL & "WHERE   companyid = " & Session("gUserCompanyID") & " And   customerid=" & Session("gUserCustomerID")
		End If

		If Session("gUserType") = "LOCATION" Then
			strSQL = strSQL & "WHERE   companyid = " & Session("gUserCompanyID") & " And   customerid=" & Session("gUserCustomerID") & " AND locationid=" & Session("gUserLocationID")
		End If

		SqlUsers.SelectCommand = strSQL & " ORDER BY UserID desc"







	End Sub

	Protected Sub lnkNewUser_Click(sender As Object, e As EventArgs)
		Response.Redirect("UserDetails.aspx?userid=0")
	End Sub


	Protected Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs)
		If TypeOf e.Item Is GridDataItem Then
			Dim item As GridDataItem = CType(e.Item, GridDataItem)

			'If item("showpriority").Text = "Urgent" Then
			'	item.BackColor = System.Drawing.Color.Red
			'	item.ForeColor = System.Drawing.Color.Black
			'End If
		End If
	End Sub

	Protected Sub RadGrid1_ItemCommand(sender As Object, e As GridCommandEventArgs)


		Dim userid


		If e.CommandName = "RowClick" Then
			Try
				Dim index As Integer = e.Item.ItemIndex
				Dim item As GridDataItem = DirectCast(RadGrid1.Items(index), GridDataItem)
				userid = item("userid").Text

				Response.Redirect("UserDetails.aspx?userid=" & userid)

			Catch

			End Try

		End If

	End Sub


End Class