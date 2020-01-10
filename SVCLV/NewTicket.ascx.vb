Imports System.IO
Imports System.Data.SqlClient
Imports Telerik.Web.UI


Public Class NewTicket
	Inherits System.Web.UI.UserControl

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

		Dim strSQL As String
		Dim ds As DataSet




		'888888888888888888888888888888888888888 get data for locations
		''''''for EDIT   strSQL = "SELECT   * FROM Locations  WHERE (locations.locationid NOT IN (SELECT locationid FROM ticketLocations WHERE (ticketid = '" & Request.QueryString("ticketid") & "'))) "    '  only get locations for the company they are logged in as*************************************************************

		strSQL = "SELECT   * FROM Locations   "

		'  only get locations for the company/location they are permitted to*************************************************************

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
			strSQL = strSQL & "WHERE   companyid = " & Session("gUserCompanyID") & " And   customerid=" & Session("gUserCustomerID") & " AND (LocationID IN (" & Session("locations") & "))"
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

		'strSQL = "SELECT   * FROM TicketLocations INNER JOIN Locations ON TicketLocations.LocationID = Locations.LocationID  WHERE TicketLocations.ticketID=" & Request.QueryString("ticketid")

		'ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL)
		'If ds Is Nothing Then
		'ElseIf ds.Tables.Count = 0 Then
		'ElseIf ds.Tables(0).Rows.Count = 0 Then
		'Else
		'	selectedlocations.DataValueField = "locationid"
		'	selectedlocations.DataTextField = "Name"
		'	selectedlocations.DataSource = ds
		'	selectedlocations.DataBind()
		'End If


		'If TypeOf Me.Parent.NamingContainer Is GridEditFormItem Then
		'	' edit item
		'	Session("editMode") = "UPDATE"
		'	mode.Text = Session("editMode")

		'Else

		'	' insert item
		'	Session("editMode") = "INSERT"
		'	mode.Text = Session("editMode")

		'End If



		'If Not Page.IsPostBack Then
		'refresh()
		'End If
		'Session("test") = txtPriorityType.Text



		If Session("editMode") = "UPDATE" Then
			Me.BindRepeater()
			'If Session("editMode") = "UPDATE" Then
			'we are updating an existing ticket select values from DB
			'Session("editMode") = "UPDATE"
			mode.Text = "uGood"


			'strSQL = "SELECT * FROM Tickets WHERE ticketid="

			'If txtPriorityType.Text = "Low" Then
			'	btnLow.BackColor = Drawing.Color.Gold
			'End If
			If Session("PriorityType") = "Low" Then
				btnLow.BackColor = Drawing.Color.Gold
				btnLow.ForeColor = System.Drawing.Color.Black
			End If
			If Session("PriorityType") = "Medium" Then
				btnMedium.BackColor = Drawing.Color.Gold
				btnMedium.ForeColor = System.Drawing.Color.Black
			End If

			If Session("PriorityType") = "High" Then
				btnHigh.BackColor = Drawing.Color.Gold
				btnHigh.ForeColor = System.Drawing.Color.Black
			End If
			If Session("PriorityType") = "Urgent" Then
				btnUrgent.BackColor = Drawing.Color.Gold
				btnUrgent.ForeColor = System.Drawing.Color.Black
			End If


			'**********************************************************************************************************
			If Session("TicketType") = "System Error" Then
				btnSystemError.BackColor = Drawing.Color.Gold
				btnSystemError.ForeColor = System.Drawing.Color.Black
			End If
			If Session("TicketType") = "Price Changes" Then
				btnPriceChanges.BackColor = Drawing.Color.Gold
				btnPriceChanges.ForeColor = System.Drawing.Color.Black
			End If

			If Session("TicketType") = "Price Timer Request" Then
				btnPriceTimerRequest.BackColor = Drawing.Color.Gold
				btnPriceTimerRequest.ForeColor = System.Drawing.Color.Black
			End If
			If Session("TicketType") = "New Menu Item" Then
				btnNewMenuItem.BackColor = Drawing.Color.Gold
				btnNewMenuItem.ForeColor = System.Drawing.Color.Black
			End If

			'**********************************************************************************************************
			If Session("TicketType") = "New HW Request" Then
				btnNewHWRequest.BackColor = Drawing.Color.Gold
				btnNewHWRequest.ForeColor = System.Drawing.Color.Black
			End If
			If Session("TicketType") = "System Maintenance" Then
				btnSystemMaintenance.BackColor = Drawing.Color.Gold
				btnSystemMaintenance.ForeColor = System.Drawing.Color.Black
			End If

			If Session("TicketType") = "System Error2" Then
				btnSystemErro2.BackColor = Drawing.Color.Gold
				btnSystemErro2.ForeColor = System.Drawing.Color.Black
			End If
			If Session("TicketType") = "System Update" Then
				btnSystemUpdate.BackColor = Drawing.Color.Gold
				btnSystemUpdate.ForeColor = System.Drawing.Color.Black
			End If



			txtDueDate.Text = CDate(Session("DueDate")).ToString("yyyy-MM-dd")    'Session("DueDate").ToString("MM/dd/yyyy")


			strSQL = "SELECT subject,description,TicketTypeID,PriorityID FROM Tickets WHERE ticketid=" & Session("SelectedTicketID")

			Dim dr As SqlDataReader
			dr = SQLHelper.ExecuteReader(SQLHelper.SQLConnection, CommandType.Text, strSQL)
			While dr.Read

				subject.Text = dr("subject")
				description.Text = dr("description")
				Session("TicketTypeID") = dr("TicketTypeID")
				Session("PriorityTypeID") = dr("PriorityID")
			End While



			strSQL = "SELECT * FROM Clarifications WHERE ticketid=" & Session("SelectedTicketID")

			Dim clarifyreply

			clarifyreply = SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)
			If clarifyreply > 0 Then
				RowClarifyReply.Visible = True
				subject.Enabled = False
				description.Enabled = False

			End If


		End If




		'*************************************************************************************************************************************

		If Session("editMode") = "INSERT" Or Session("editMode") = Nothing Then
			'we are inserting new ticket
			'Session("editMode") = "INSERT"
			mode.Text = "iGood"

			RowClarify.Visible = False
			RowClarifyReply.Visible = False
		End If



		'If TypeOf Me.Parent.NamingContainer Is GridEditFormItem Then
		'	Session("editMode") = "UPDATE"
		'Else
		'	Session("editMode") = "INSERT"
		'	RowClarify.Visible = False
		'	RowClarifyReply.Visible = False
		'End If
	End Sub



	'Public Sub refresh()
	'	mode.Text = Session("editMode")


	'End Sub


	Private Sub buttons_Click(sender As Object, e As EventArgs) Handles btnLow.Click, btnMedium.Click, btnHigh.Click, btnUrgent.Click 'etc
		Dim ctrl As Button = CType(sender, Control)
		If ctrl.BackColor = System.Drawing.Color.Black Then ctrl.BackColor = System.Drawing.Color.DimGray Else ctrl.BackColor = System.Drawing.Color.Black
	End Sub





	'Protected Sub btnMedium_Click(sender As Object, e As EventArgs)
	'	Session("TicketPriority") = "Medium"

	'	btnMedium.Font.Bold = True

	'End Sub

	'Protected Sub btnHigh_Click(sender As Object, e As EventArgs)
	'	Session("TicketPriority") = "High"
	'	btnLow.BackColor = System.Drawing.ColorTranslator.FromHtml("#f7dc6f")
	'	btnLow.ForeColor = System.Drawing.ColorTranslator.FromHtml("#17202a")

	'	btnMedium.BackColor = System.Drawing.ColorTranslator.FromHtml("#f7dc6f")
	'	btnMedium.ForeColor = System.Drawing.ColorTranslator.FromHtml("#17202a")



	'End Sub

	'Protected Sub btnUrgent_Click(sender As Object, e As EventArgs)
	'	Session("TicketPriority") = "Urgent"
	'	btnLow.BackColor = System.Drawing.ColorTranslator.FromHtml("#f7dc6f")
	'	btnLow.ForeColor = System.Drawing.ColorTranslator.FromHtml("#17202a")

	'	btnMedium.BackColor = System.Drawing.ColorTranslator.FromHtml("#f7dc6f")
	'	btnMedium.ForeColor = System.Drawing.ColorTranslator.FromHtml("#17202a")



	'End Sub

	Protected Sub btnSystemError_Click(sender As Object, e As EventArgs)
		Session("TicketType") = "System Error"

	End Sub

	Protected Sub btnPriceChanges_Click(sender As Object, e As EventArgs)
		Session("TicketType") = "Price Changes"
	End Sub

	Protected Sub btnPriceTimerRequest_Click(sender As Object, e As EventArgs)
		Session("TicketType") = "Price Timer Request"
	End Sub

	Protected Sub btnNewMenuItem_Click(sender As Object, e As EventArgs)
		Session("TicketType") = "New Menu Item"
	End Sub

	Protected Sub btnNewHWRequest_Click(sender As Object, e As EventArgs)
		Session("TicketType") = "New HW Request"
	End Sub

	Protected Sub btnSystemMaintenance_Click(sender As Object, e As EventArgs)
		Session("TicketType") = "System Maintenance"
	End Sub

	Protected Sub btnSystemErro2_Click(sender As Object, e As EventArgs)
		Session("TicketType") = "test"
	End Sub

	Protected Sub btnSystemUpdate_Click(sender As Object, e As EventArgs)
		Session("TicketType") = "System Update"
	End Sub

	Protected Sub btnContinue_Click(sender As Object, e As EventArgs)

	End Sub

	Protected Sub btnLow_Click(sender As Object, e As EventArgs)

	End Sub

	Protected Sub btn_Click1(sender As Object, e As EventArgs) Handles btnLow.Click, btnMedium.Click, btnHigh.Click, btnUrgent.Click 'etc
		lblerror.Text = ""
		Dim ctrl As Button = CType(sender, Control)
		Session("PriorityType") = ctrl.Text
		txtPriorityType.Text = Session("PriorityType")

		'***************************************************************************************************************************************************************
		Dim strSQL
		Dim PriorityTypeID As Integer
		strSQL = "Select PriorityID FROM TicketPriorityTypes WHERE name='" & txtPriorityType.Text & "'"

		PriorityTypeID = SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)

		Session("PriorityTypeID") = PriorityTypeID

		ctrl.BackColor = System.Drawing.Color.Gold
		ctrl.ForeColor = System.Drawing.Color.Black

		If ctrl.Text <> "Medium" Then
			btnMedium.BackColor = System.Drawing.Color.Black
			btnMedium.ForeColor = System.Drawing.Color.Gold
		End If

		If ctrl.Text <> "Low" Then
			btnLow.BackColor = System.Drawing.Color.Black
			btnLow.ForeColor = System.Drawing.Color.Gold
		End If

		If ctrl.Text <> "High" Then
			btnHigh.BackColor = System.Drawing.Color.Black
			btnHigh.ForeColor = System.Drawing.Color.Gold
		End If

		If ctrl.Text <> "Urgent" Then
			btnUrgent.BackColor = System.Drawing.Color.Black
			btnUrgent.ForeColor = System.Drawing.Color.Gold
		End If

		'If ctrl.BackColor = System.Drawing.Color.Black Then
		'	ctrl.BackColor = System.Drawing.Color.DimGray
		'Else
		'	ctrl.BackColor = System.Drawing.Color.Black
		'End If





	End Sub

	Protected Sub btn_Click2(sender As Object, e As EventArgs) Handles btnSystemUpdate.Click, btnSystemErro2.Click, btnSystemMaintenance.Click, btnNewHWRequest.Click, btnNewMenuItem.Click, btnPriceTimerRequest.Click, btnPriceChanges.Click, btnSystemError.Click 'etc

		lblerror.Text = ""

		Dim ctrl As Button = CType(sender, Control)
		Session("TicketType") = ctrl.Text
		txtTicketType.Text = Session("TicketType")

		'***************************************************************************************************************************************************************
		Dim strSQL
		Dim TicketTypeID As Integer
		strSQL = "Select TicketTypeID FROM TicketTypes WHERE name='" & txtTicketType.Text & "'"

		TicketTypeID = SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)
		Session("TicketTypeID") = TicketTypeID

		ctrl.BackColor = System.Drawing.Color.Gold
		ctrl.ForeColor = System.Drawing.Color.Black

		If ctrl.Text <> "System Update" Then
			btnSystemUpdate.BackColor = System.Drawing.Color.Black
			btnSystemUpdate.ForeColor = System.Drawing.Color.Gold
		End If

		If ctrl.Text <> "System Error2" Then
			btnSystemErro2.BackColor = System.Drawing.Color.Black
			btnSystemErro2.ForeColor = System.Drawing.Color.Gold
		End If

		If ctrl.Text <> "System Maintenance" Then
			btnSystemMaintenance.BackColor = System.Drawing.Color.Black
			btnSystemMaintenance.ForeColor = System.Drawing.Color.Gold
		End If

		If ctrl.Text <> "New HW Request" Then
			btnNewHWRequest.BackColor = System.Drawing.Color.Black
			btnNewHWRequest.ForeColor = System.Drawing.Color.Gold
		End If

		If ctrl.Text <> "New Menu Item" Then
			btnNewMenuItem.BackColor = System.Drawing.Color.Black
			btnNewMenuItem.ForeColor = System.Drawing.Color.Gold
		End If

		If ctrl.Text <> "Price Timer Request" Then
			btnPriceTimerRequest.BackColor = System.Drawing.Color.Black
			btnPriceTimerRequest.ForeColor = System.Drawing.Color.Gold
		End If

		If ctrl.Text <> "Price Changes" Then
			btnPriceChanges.BackColor = System.Drawing.Color.Black
			btnPriceChanges.ForeColor = System.Drawing.Color.Gold
		End If

		If ctrl.Text <> "System Error" Then
			btnSystemError.BackColor = System.Drawing.Color.Black
			btnSystemError.ForeColor = System.Drawing.Color.Gold
		End If



	End Sub

	Protected Sub btnContinue_Click1(sender As Object, e As EventArgs)

		If txtPriorityType.Text = "" Then
			lblerror.Text = "Please choose a Priority Level."
			Exit Sub

		End If
		If txtTicketType.Text = "" Then
			lblerror.Text = "Please choose a Ticket Type."
			Exit Sub

		End If
		If txtDueDate.Text = "" Then
			lblerror.Text = "Please select a Due Date."
			Exit Sub

		End If
		RadTabStrip1.FindTabByText("Step 2").Selected = True
		PageView2.Selected = True
	End Sub

	Protected Sub btnContinue2_Click(sender As Object, e As EventArgs)

		Dim strSQL

		If subject.Text = "" Then
			lblerror.Text = "Please enter a subject."
			Exit Sub

		End If
		If description.Text = "" Then
			lblerror.Text = "Please enter a Description."
			Exit Sub

		End If



		If Clarify.Text <> "" Then

			strSQL = "INSERT INTO clarifications (ticketid,userid,text,datecreated) VALUES (" & Session("Selectedticketid") & "," & Session("gUserID") & ",'" & Clarify.Text & "','" & Now() & "')"
			SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)

			Clarify.Text = ""
			Me.BindRepeater()
		End If



		RadTabStrip1.FindTabByText("Step 3").Selected = True
		PageView3.Selected = True
	End Sub

	Protected Sub btnContinue3_Click(sender As Object, e As EventArgs)
		RadTabStrip1.FindTabByText("Step 4").Selected = True
		PageView4.Selected = True
	End Sub

	Protected Sub btnContinue4_Click(sender As Object, e As EventArgs)
		'SAVE RECORD
		Dim myFiles As HttpFileCollection
		Dim myFile As HttpPostedFile
		Dim i As Integer
		Dim strSQL
		Dim currentid As Integer
		Dim ticketnumber1 As Integer


		If Session("editMode") = "INSERT" Then







			strSQL = "Select TicketNumber FROM TicketNumber WHERE TicketNumberID=1"

			ticketnumber1 = SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)

			Dim usercompanyid
			Dim usercustomerid

			'If Session("gusertype") = "MASTER" Then

			'Else
			usercompanyid = Session("gusercompanyid")
			usercustomerid = Session("gusercustomerid")
			'End If

			strSQL = "INSERT INTO Tickets (ticketnumber, companyid, customerid, tickettypeid, statusid, priorityid, subject, description, datecreated, createdbyuserid, datedue) "
			strSQL += "VALUES (" & ticketnumber1 & ", " & usercompanyid & ", " & usercustomerid & ", '" & Session("TicketTypeID") & "', 1,'" & Session("PriorityTypeID") & "', '" & subject.Text & "',"
			strSQL += "'" & description.Text & "', '" & Now() & "', " & Session("gUserID") & ", '" & txtDueDate.Text & "'); SELECT SCOPE_IDENTITY()"

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
					'MsgBox(myFile.FileName)
					If myFile.FileName <> "" Then
						myFile.SaveAs(Server.MapPath("\\Uploads\") & currentid & "\" & myFile.FileName)
					End If

				Next
			End If

			For Each item As RadListBoxItem In selectedlocations.Items
				strSQL = "INSERT INTO TicketLocations (locationid,ticketid) VALUES (" & item.Value & "," & currentid & ")"
				SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)
			Next

			strSQL = "UPDATE TicketNumber SET TicketNumber=TicketNumber+1"

			ticketnumber1 = SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)

			'***********************************************************editttttttttttttttttttttt



			usercompanyid = Session("gusercompanyid")
			usercustomerid = Session("gusercustomerid")

		Else


			strSQL = "UPDATE Tickets SET  tickettypeid=" & Session("TicketTypeID") & ",statusid=1,priorityid=" & Session("PriorityTypeID") & ",datedue='" & txtDueDate.Text & "' WHERE ticketid=" & Session("Selectedticketid")


			SQLHelper.ExecuteScalar(SQLHelper.SQLConnection, CommandType.Text, strSQL)

		End If

		Response.Redirect("TicketView.aspx")




	End Sub

	Private Sub BindRepeater()
		Dim constr As String = ConfigurationManager.ConnectionStrings("cnWebClubTrax").ConnectionString
		Using con As New SqlConnection(constr)
			Using cmd As New SqlCommand("SELECT  Clarifications.userid,Clarifications.text,Clarifications.datecreated,Users.fullname FROM Clarifications INNER JOIN Tickets ON Tickets.TicketID=Clarifications.Ticketid LEFT OUTER JOIN Users ON Users.userid=clarifications.userid WHERE clarifications.ticketid=" & Session("Selectedticketid"), con)
				Using sda As New SqlDataAdapter(cmd)
					Dim dt As New DataTable()
					sda.Fill(dt)
					rptClarifications.DataSource = dt
					rptClarifications.DataBind()
				End Using
			End Using
		End Using
	End Sub

	Protected Sub btnCancel_Click(sender As Object, e As EventArgs)
		Session.Remove("editMode")


	End Sub

	Protected Sub txtDueDate_TextChanged(sender As Object, e As EventArgs)
		lblerror.Text = ""
	End Sub

	Protected Sub subject_TextChanged(sender As Object, e As EventArgs)
		lblerror.Text = ""
	End Sub

	Protected Sub description_TextChanged(sender As Object, e As EventArgs)
		lblerror.Text = ""
	End Sub

	Protected Sub addemailimg1_Click(sender As Object, e As ImageClickEventArgs)
		emailrow2.Visible = True

	End Sub

	Protected Sub addemailimg2_Click(sender As Object, e As ImageClickEventArgs)
		emailrow3.Visible = True
	End Sub

	Protected Sub addemailimg3_Click(sender As Object, e As ImageClickEventArgs)
		emailrow4.Visible = True
	End Sub
End Class