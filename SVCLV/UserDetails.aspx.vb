
Imports System.IO
Imports System.Data.SqlClient
Imports Telerik.Web.UI

Public Class UserDetails
	Inherits System.Web.UI.Page

	Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
		If Context.Session IsNot Nothing Then

			If Session.IsNewSession Then
				Dim newSessionIdCookie As HttpCookie = Request.Cookies("ASP.NET_SessionId")

				If newSessionIdCookie IsNot Nothing Then
					Dim newSessionIdCookieValue As String = newSessionIdCookie.Value

					If newSessionIdCookieValue <> String.Empty Then
						Response.Redirect("Login.aspx")
					End If
				End If
			End If
		End If
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

		If Not IsPostBack Then

			Dim strSQL As String = ""
			Dim ds As DataSet



			''***************************** FOR COMPANY DROPDOWN ONLY
			'strSQL = "SELECT * FROM Companies "




			'If Session("gUserType") = "MASTER" Then
			'	'****** SHow all for MASTER - at this point - 10/28/2019
			'End If

			'If Session("gUserType") = "CUSTOMER" Then
			'	strSQL = strSQL & " WHERE companyid=" & Session("gUserCompanyID")
			'End If

			''If Session("gUserType") = "CUSTOMER" Then
			''	strSQL = strSQL & "WHERE   companyid = " & Session("gUserCompanyID")
			''End If

			''If Session("gUserType") = "LOCATION" Then
			''	strSQL = strSQL & "WHERE   companyid = " & Session("gUserCompanyID") & " And   customerid=" & Session("gUserCustomerID") & " AND locationid=" & Session("gUserLocationID")
			''End If

			'strSQL = strSQL & " ORDER BY NAme asc"

			'SqlCompanies.SelectCommand = strSQL

			''***************************** FOR CUSTOMER DROPDOWN ONLY
			'strSQL = "SELECT * FROM Customers "




			'If Session("gUserType") = "MASTER" Then
			'	'****** SHow all for MASTER - at this point - 10/28/2019
			'End If

			'If Session("gUserType") = "CUSTOMER" Then
			'	strSQL = strSQL & " WHERE companyid=" & Session("gUserCompanyID") & " And   customerid=" & Session("gUserCustomerID")
			'End If

			''If Session("gUserType") = "CUSTOMER" Then
			''	strSQL = strSQL & "WHERE   companyid = " & Session("gUserCompanyID")
			''End If

			''If Session("gUserType") = "LOCATION" Then
			''	strSQL = strSQL & "WHERE   companyid = " & Session("gUserCompanyID") & " And   customerid=" & Session("gUserCustomerID") & " AND locationid=" & Session("gUserLocationID")
			''End If

			'strSQL = strSQL & " ORDER BY NAme asc"

			'SqlCompanies.SelectCommand = strSQL


			If Request.QueryString("userid") > 0 Then
				'edit mode
				strSQL = "SELECT * FROM users WHERE userid=" & Convert.ToString(Request.QueryString("userid"))
				Dim dr As SqlDataReader
				dr = SQLHelper.ExecuteReader(SQLHelper.SQLConnection, CommandType.Text, strSQL)
				While dr.Read
					If Session("gUserType") = "COMPANY" Then
						company.Enabled = False

					End If

					If Session("gUserType") = "CUSTOMER" Then
						customer.Enabled = False
						company.Enabled = False

						usertype.SelectedValue = "CUSTOMER"
						usertype.Enabled = False

					End If
					'
					'customer.SelectedValue = dr("customerid")
					usertype.SelectedValue = dr("usertype")
					status.SelectedValue = dr("status")
					fullname.Text = dr("fullname").ToString()
					username.Text = dr("username").ToString()
					password.Text = dr("password").ToString()
					email.Text = dr("email").ToString()




					'txtDueDate.Text = FormatDateTime(dr("duedate").ToString(), vbShortDate)

					Dim strSQL2
					strSQL2 = "SELECT   * FROM Locations WHERE (locations.locationid NOT IN (SELECT locationid FROM userLocations WHERE (userid = '" & Request.QueryString("userid") & "'))) "    '  only get locations for the company they are logged in as*************************************************************



					If Session("gUserType") = "MASTER" Then
						'****** SHow all for MASTER - at this point - 10/28/2019
					End If

					If Session("gUserType") = "COMPANY" Then
						strSQL2 = strSQL2 & " AND companyid=" & Session("gUserCompanyID")
					End If

					If Session("gUserType") = "CUSTOMER" Then
						strSQL2 = strSQL2 & "AND   companyid = " & Session("gUserCompanyID") & " And   customerid=" & Session("gUserCustomerID")
					End If

					If Session("gUserType") = "LOCATION" Then
						strSQL2 = strSQL2 & "AND   companyid = " & Session("gUserCompanyID") & " And   customerid=" & Session("gUserCustomerID") & " AND locationid=" & Session("gUserLocationID")
					End If

					strSQL2 = strSQL2 & " ORDER BY NAme asc"





					ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL2)
					If ds Is Nothing Then
					ElseIf ds.Tables.Count = 0 Then
					ElseIf ds.Tables(0).Rows.Count = 0 Then
					Else
						availablelocations.DataValueField = "locationid"
						availablelocations.DataTextField = "Name"
						availablelocations.DataSource = ds
						availablelocations.DataBind()
					End If

					Dim strSQL3
					strSQL3 = "SELECT   * FROM UserLocations INNER JOIN Locations ON UserLocations.LocationID = Locations.LocationID  WHERE UserLocations.userID=" & Request.QueryString("userid")

					ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL3)
					If ds Is Nothing Then
					ElseIf ds.Tables.Count = 0 Then
					ElseIf ds.Tables(0).Rows.Count = 0 Then
					Else
						selectedlocations.DataValueField = "locationid"
						selectedlocations.DataTextField = "Name"
						selectedlocations.DataSource = ds
						selectedlocations.DataBind()
					End If

				End While

			Else
				'insert mode
				If Session("gUserType") = "COMPANY" Then
					company.Enabled = False

				End If

				If Session("gUserType") = "CUSTOMER" Then
					customer.Enabled = False
					company.Enabled = False
					usertype.Enabled = False
					usertype.SelectedValue = "LOCATION"

				End If

















				Dim strSQL2
				strSQL2 = "SELECT   * FROM Locations   "    '  only get locations for the company they are logged in as*************************************************************



				If Session("gUserType") = "MASTER" Then
					'****** SHow all for MASTER - at this point - 10/28/2019
				End If

				If Session("gUserType") = "COMPANY" Then
					strSQL2 = strSQL2 & " WHERE companyid=" & Session("gUserCompanyID")
				End If

				If Session("gUserType") = "CUSTOMER" Then
					strSQL2 = strSQL2 & "WHERE   companyid = " & Session("gUserCompanyID") & " And   customerid=" & Session("gUserCustomerID")
				End If

				If Session("gUserType") = "LOCATION" Then
					strSQL2 = strSQL2 & "WHERE   companyid = " & Session("gUserCompanyID") & " And   customerid=" & Session("gUserCustomerID") & " AND locationid=" & Session("gUserLocationID")
				End If

				strSQL2 = strSQL2 & " ORDER BY NAme asc"

				ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL2)
				If ds Is Nothing Then
				ElseIf ds.Tables.Count = 0 Then
				ElseIf ds.Tables(0).Rows.Count = 0 Then
				Else
					availablelocations.DataValueField = "locationid"
					availablelocations.DataTextField = "Name"
					availablelocations.DataSource = ds
					availablelocations.DataBind()
				End If

			End If

		End If

	End Sub

	Protected Sub cmdSave_Click(sender As Object, e As EventArgs)



		Dim strSQL
		Dim userid As Integer



		'Session("companyid") = 1
		'Session("customerid") = 2
		'Session("userid") = 4
		Dim usercompanyid
		Dim usercustomerid

		If Session("gusertype") = "MASTER" Then
			usercompanyid = company.SelectedValue
			usercustomerid = customer.SelectedValue
		Else
			usercompanyid = Session("gusercompanyid")
			usercustomerid = Session("gusercustomerid")
		End If


		If Request.QueryString("userid") > 0 Then



			strSQL = "UPDATE Users SET status='" & status.SelectedValue & "', companyid=" & usercompanyid & ", customerid=" & usercustomerid & ", usertype='" & usertype.SelectedValue & "', fullname='" & fullname.Text & "', password='" & password.Text & "', email='" & email.Text & "' WHERE userid=" & Request.QueryString("userid")
			SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)


			'***********DELETE AND RE-ADD USERS LOCATIONS
			strSQL = "DELETE FROM UserLocations WHERE userid=" & Request.QueryString("userid")
			SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)

			For Each item As RadListBoxItem In selectedlocations.Items
				strSQL = "INSERT INTO UserLocations (locationid,userid) VALUES (" & item.Value & "," & Request.QueryString("userid") & ")"
				SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)
			Next



		Else

			strSQL = "INSERT INTO Users (companyid,customerid,status,usertype,fullname,username,password,datecreated,email) VALUES (" & usercompanyid & ", " & usercustomerid & ", '" & status.SelectedValue & "', '" & usertype.SelectedValue & "', '" & fullname.Text & "', '" & username.Text & "', '" & password.Text & "', '" & Now() & "', '" & email.Text & "'); SELECT SCOPE_IDENTITY()"


			userid = SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)


			For Each item As RadListBoxItem In selectedlocations.Items
				strSQL = "INSERT INTO UserLocations (locationid,userid) VALUES (" & item.Value & "," & userid & ")"
				SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)
			Next




		End If








		Response.Redirect("Users.aspx")


	End Sub
End Class