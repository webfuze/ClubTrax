
Imports System.IO
Imports System.Data.SqlClient
Imports Telerik.Web.UI

Public Class TicketDetails1
	Inherits System.Web.UI.UserControl

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



		Dim strSQL As String
			Dim ds As DataSet

		If Not IsPostBack Then


			If Session("SelectedTicketID") > 0 Then
				'edit mode
				Me.BindRepeater()

				strSQL = "SELECT * FROM tickets WHERE ticketid=" & Convert.ToString(Session("SelectedTicketID"))
				Dim dr As SqlDataReader
				dr = SQLHelper.ExecuteReader(SQLHelper.SQLConnection, CommandType.Text, strSQL)
				While dr.Read
					ticketnumber.Text = dr("ticketnumber").ToString()






					strSQL = "SELECT companyid, name FROM companies "

					If Session("gUserType") <> "MASTER" Then
						strSQL += "	where companyid = " + Session("gUserCompanyID").ToString()
					End If

					If Session("gUserType") <> "MASTER" Then
						strSQL += "	and customerid = " + Session("gUserCustomerID").ToString()


					End If


					ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL)
					If ds Is Nothing Then
					ElseIf ds.Tables.Count = 0 Then
					ElseIf ds.Tables(0).Rows.Count = 0 Then
					Else
						company.DataValueField = "companyid"
						company.DataTextField = "name"
						company.DataSource = ds
						company.DataBind()
					End If

					strSQL = "SELECT customerid, name FROM customers"
					If Session("gUserType") <> "MASTER" Then
						strSQL += "	where companyid = " + Session("gUserCompanyID").ToString()


					End If

					If Session("gUserType") <> "MASTER" Then
						strSQL += "	and customerid = " + Session("gUserCustomerID").ToString()


					End If



					ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL)
					If ds Is Nothing Then
					ElseIf ds.Tables.Count = 0 Then
					ElseIf ds.Tables(0).Rows.Count = 0 Then
					Else
						customer.DataValueField = "customerid"
						customer.DataTextField = "name"
						customer.DataSource = ds
						customer.DataBind()
					End If







					company.SelectedValue = dr("companyid")
					customer.SelectedValue = dr("customerid")
					TicketType.SelectedValue = dr("tickettypeid")
					Priority.SelectedValue = dr("priorityid")
					StatusType.SelectedValue = dr("statusid")
					subject.Text = dr("subject").ToString()
					description.Text = dr("description").ToString()
					txtDueDate.Text = CDate(dr("datedue")).ToString("yyyy-MM-dd")       'dr("duedate").ToString()







					strSQL = "SELECT   * FROM Locations  WHERE (locations.locationid NOT IN (SELECT locationid FROM ticketLocations WHERE (ticketid = '" & Session("SelectedTicketID") & "'))) "    '  only get locations for the company they are logged in as*************************************************************



					If Session("gUserType") = "MASTER" Then
						'****** SHow all for MASTER - at this point - 10/28/2019
					End If

					If Session("gUserType") = "COMPANY" Then
						strSQL = strSQL & " AND companyid=" & Session("gUserCompanyID")
					End If

					If Session("gUserType") = "CUSTOMER" Then
						strSQL = strSQL & "AND   companyid = " & Session("gUserCompanyID") & " And   customerid=" & Session("gUserCustomerID")
					End If

					If Session("gUserType") = "LOCATION" Then
						strSQL = strSQL & "AND   companyid = " & Session("gUserCompanyID") & " And   customerid=" & Session("gUserCustomerID") & " AND locationid=" & Session("gUserLocationID")
					End If

					strSQL = strSQL & " ORDER BY NAme asc"






					ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL)
					If ds Is Nothing Then
					ElseIf ds.Tables.Count = 0 Then
					ElseIf ds.Tables(0).Rows.Count = 0 Then
					Else
						availablelocations.DataValueField = "locationid"
						availablelocations.DataTextField = "name"
						availablelocations.DataSource = ds
						availablelocations.DataBind()
					End If

					strSQL = "SELECT   * FROM TicketLocations INNER JOIN Locations ON TicketLocations.LocationID = Locations.LocationID  WHERE TicketLocations.ticketID=" & Session("SelectedTicketID")

					ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL)
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

				ticketnumber.Text = "NEW"
				RowClarify.Visible = False
				RowClarifyReply.Visible = False


				strSQL = "SELECT companyid, name FROM companies "

				If Session("gUserType") <> "MASTER" Then
					strSQL += "	where companyid = " + Session("gUserCompanyID").ToString()


				End If

				If Session("gUserType") <> "MASTER" Then
					strSQL += "and customerid = " + Session("gUserCustomerID").ToString()


				End If

				ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL)
				If ds Is Nothing Then
				ElseIf ds.Tables.Count = 0 Then
				ElseIf ds.Tables(0).Rows.Count = 0 Then
				Else
					company.DataValueField = "companyid"
					company.DataTextField = "name"
					company.DataSource = ds
					company.DataBind()
				End If

				strSQL = "SELECT customerid, name FROM customers "

				If Session("gUserType") <> "MASTER" Then
					strSQL += "	where companyid = " + Session("gUserCompanyID").ToString()


				End If

				If Session("gUserType") <> "MASTER" Then
					strSQL += "and customerid = " + Session("gUserCustomerID").ToString()


				End If



				ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL)
				If ds Is Nothing Then
				ElseIf ds.Tables.Count = 0 Then
				ElseIf ds.Tables(0).Rows.Count = 0 Then
				Else
					customer.DataValueField = "customerid"
					customer.DataTextField = "name"
					customer.DataSource = ds
					customer.DataBind()
				End If

			End If






			'strSQL = "Select customerid, name FROM customers where companyid=" + Session("gUserCompanyID").ToString() + " And  customerid=" + Session("gUserCustomerID").ToString()
			'ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL)
			'If ds Is Nothing Then
			'ElseIf ds.Tables.Count = 0 Then
			'ElseIf ds.Tables(0).Rows.Count = 0 Then
			'Else
			'	customer.DataValueField = "customerid"
			'	customer.DataTextField = "name"
			'	customer.DataSource = ds
			'	customer.DataBind()
			'End If
		End If



	End Sub

	Protected Sub cmdSave_Click(sender As Object, e As EventArgs)

		Dim myFiles As HttpFileCollection
		Dim myFile As HttpPostedFile
		Dim i As Integer
		Dim strSQL
		Dim currentid As Integer
		Dim ticketnumber1 As Integer


		If ticketnumber.Text = "NEW" Then

			strSQL = "Select TicketNumber FROM TicketNumber WHERE TicketNumberID=1"

			ticketnumber1 = SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)

			Dim usercompanyid
			Dim usercustomerid

			If Session("gusertype") = "MASTER" Then
				usercompanyid = company.SelectedValue
				usercustomerid = customer.SelectedValue
			Else
				usercompanyid = Session("gusercompanyid")
				usercustomerid = Session("gusercustomerid")
			End If

			strSQL = "INSERT INTO Tickets (ticketnumber, companyid, customerid, tickettypeid, statusid, priorityid, subject, description, datecreated, createdbyuserid, datedue) VALUES (" & ticketnumber1 & ", " & usercompanyid & ", " & usercustomerid & ", " & TicketType.SelectedValue & ", 1," & Priority.SelectedValue & ", '" & subject.Text & "', '" & description.Text & "', '" & Now() & "', " & Session("gUserID") & ", '" & txtDueDate.Text & "'); SELECT SCOPE_IDENTITY()"

			currentid = SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)

			If AttachFile.HasFiles Then
				myFiles = Request.Files
				If Not Directory.Exists(Server.MapPath("\\Uploads")) Then
					Directory.CreateDirectory(Server.MapPath("\\Uploads"))
				End If
				If Not Directory.Exists(Server.MapPath("\\Uploads\" & currentid)) Then
					Directory.CreateDirectory(Server.MapPath("\\Uploads\" & currentid))
				End If
				For i = 0 To myFiles.Count - 1
					myFile = myFiles(i)
					myFile.SaveAs(Server.MapPath("\\Uploads\") & currentid & "\" & myFile.FileName)
				Next
			End If

			For Each item As RadListBoxItem In selectedlocations.Items
				strSQL = "INSERT INTO TicketLocations (locationid,ticketid) VALUES (" & item.Value & "," & currentid & ")"
				SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)
			Next

			strSQL = "UPDATE TicketNumber SET TicketNumber=TicketNumber+1"

			ticketnumber = SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)

		Else

			'           companyid, customerid, tickettypeid, statusid, priorityid, subject, description, datecreated, createdbyuserid, datedue

			'      usercompanyid & ", " & usercustomerid & ", " & TicketType.SelectedValue & ", 1," & Priority.SelectedValue & ", '" & subject.Text & "', '" & description.Text & "', '" & Now() & "', " & Session("gUserID") & ", '" & txtDueDate.Text

			Dim usercompanyid
			Dim usercustomerid

			If Session("gusertype") = "MASTER" Then
				usercompanyid = company.SelectedValue
				usercustomerid = customer.SelectedValue
			Else
				usercompanyid = Session("gusercompanyid")
				usercustomerid = Session("gusercustomerid")
			End If


			strSQL = "UPDATE Tickets SET companyid=" & usercompanyid & ", customerid=" & usercustomerid & ",tickettypeid=" & TicketType.SelectedValue & ",statusid=" & StatusType.SelectedValue & ",priorityid=" & Priority.SelectedValue & ",subject='" & subject.Text & "',description='" & description.Text & "',datedue='" & txtDueDate.Text & "' WHERE ticketid=" & Session("SelectedTicketID")


			SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)


			If Clarify.Text <> "" Then

				strSQL = "INSERT INTO clarifications (ticketid,userid,text,datecreated) VALUES (" & Session("SelectedTicketID") & "," & Session("gUserID") & ",'" & Clarify.Text & "','" & Now() & "')"
				SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)
			End If


		End If



		Response.Redirect("TicketView.aspx")







	End Sub
	Private Sub BindRepeater()
		Dim constr As String = ConfigurationManager.ConnectionStrings("cnWebClubTrax").ConnectionString
		Using con As New SqlConnection(constr)
			Using cmd As New SqlCommand("SELECT  Clarifications.userid,Clarifications.text,Clarifications.datecreated,Users.fullname FROM Clarifications INNER JOIN Tickets ON Tickets.TicketID=Clarifications.Ticketid LEFT OUTER JOIN Users ON Users.userid=clarifications.userid WHERE clarifications.ticketid=" & Session("SelectedTicketID"), con)
				Using sda As New SqlDataAdapter(cmd)
					Dim dt As New DataTable()
					sda.Fill(dt)
					rptClarifications.DataSource = dt
					rptClarifications.DataBind()
				End Using
			End Using
		End Using
	End Sub




	Protected Sub company_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs)
		Dim strSQL As String
		Dim ds As DataSet

		customer.Items.Clear()
		customer.Enabled = True

		strSQL = "SELECT customerid, name FROM customers where companyid=" + company.SelectedValue
		ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL)
		If ds Is Nothing Then
		ElseIf ds.Tables.Count = 0 Then
		ElseIf ds.Tables(0).Rows.Count = 0 Then
		Else
			customer.DataValueField = "customerid"
			customer.DataTextField = "name"
			customer.DataSource = ds
			customer.DataBind()
		End If





		strSQL = "SELECT   * FROM Locations  WHERE companyid= " + company.SelectedValue

		ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL)
		If ds Is Nothing Then
		ElseIf ds.Tables.Count = 0 Then
		ElseIf ds.Tables(0).Rows.Count = 0 Then
		Else
			availablelocations.DataValueField = "locationid"
			availablelocations.DataTextField = "Name"
			availablelocations.DataSource = ds
			availablelocations.DataBind()
		End If
	End Sub

	Private Sub company_DataBound(sender As Object, e As EventArgs) Handles company.DataBound
		' Add --Select-- to top...
		If company.Items.Count = 0 Then
		Else
			company.Items.Insert(0, New RadComboBoxItem("--Select--"))
		End If
	End Sub

	Private Sub customer_DataBound(sender As Object, e As EventArgs) Handles customer.DataBound
		' Add --Select-- to top...
		If customer.Items.Count = 0 Then
		Else
			customer.Items.Insert(0, New RadComboBoxItem("--Select--"))
		End If
	End Sub

	Protected Sub customer_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs)



		Dim strSQL As String
		Dim ds As DataSet

		availablelocations.Items.Clear()




		strSQL = "SELECT   * FROM Locations  WHERE companyid= " + company.SelectedValue + " AND customerid=" + customer.SelectedValue

		ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL)
		If ds Is Nothing Then
		ElseIf ds.Tables.Count = 0 Then
		ElseIf ds.Tables(0).Rows.Count = 0 Then
		Else
			availablelocations.DataValueField = "locationid"
			availablelocations.DataTextField = "Name"
			availablelocations.DataSource = ds
			availablelocations.DataBind()
		End If
	End Sub


End Class