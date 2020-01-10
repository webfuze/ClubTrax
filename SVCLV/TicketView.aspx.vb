

Imports Telerik.Web.UI
Public Class MyEditFormTemplate


	Public Sub InstantiateIn(ByVal container As Control)
		Dim item As GridEditFormItem = (CType((container.NamingContainer), GridEditFormItem))
		Dim btn1 As Button = New Button()
		btn1.CommandName = "Update"
		Dim tb1 As TextBox = New TextBox()
		tb1.ID = "MyTextBox"
		tb1.Text = item.ParentItem.OwnerTableView.DataKeyValues((CType((item.ParentItem), GridDataItem)).ItemIndex)("ProviderName").ToString()
		container.Controls.Add(tb1)
		container.Controls.Add(btn1)
	End Sub
End Class



Public Class TicketView
	Inherits System.Web.UI.Page



	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load





		Dim strSQL

		strSQL = "SELECT * FROM TicketView "

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
			strSQL = strSQL & "WHERE   companyid = " & Session("gUserCompanyID") & " And   customerid=" & Session("gUserCustomerID") & " and ticketid IN (SELECT TicketID FROM   TicketLocations WHERE   (LocationID IN (" & Session("locations") & ")))"



		End If

		SqlTickets.SelectCommand = strSQL & " ORDER BY TicketID desc"




	End Sub

	Protected Sub lnkNewTicket_Click(sender As Object, e As EventArgs)
		'Response.Redirect("TicketDetails.aspx")
		'RadWindow1.VisibleOnPageLoad = True
	End Sub





	Private Sub RadGrid1_ItemCreated(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid1.ItemCreated
		'If TypeOf e.Item Is GridEditableItem And e.Item.IsInEditMode Then

		'	If TypeOf e.Item Is GridEditFormInsertItem OrElse TypeOf e.Item Is GridDataInsertItem Then
		'		' insert item
		'		Session("editMode") = "INSERT"
		'		mode.Text = Session("editMode")
		'	Else
		'		' edit item
		'		Session("editMode") = "UPDATE"
		'		mode.Text = Session("editMode")
		'	End If
		'End If

		'If (TypeOf e.Item Is GridEditFormItem) AndAlso (e.Item.IsInEditMode) AndAlso (Not e.Item.OwnerTableView.IsItemInserted) Then
		'	Dim edititem As GridEditFormItem = CType(e.Item, GridEditFormItem)
		'	Dim txtOwnedByUserID As TextBox = CType(edititem.FindControl("txtOwnedbyUserID"), TextBox)
		'	Dim txtNotes As TextBox = CType(edititem.FindControl("txtNotes"), TextBox)
		'	Dim lblnotes As Label = CType(edititem.FindControl("lblnotes"), Label)
		'	Dim lblPriority As Label = CType(edititem.FindControl("labelC"), Label)

		'	'If lblPriority.Text <> Nothing Then


		'	'		If lblPriority.Text = "Low" Then
		'	'	Dim item As GridEditFormItem = CType(e.Item, GridEditFormItem)
		'	'Dim auto As Button = CType(edititem.FindControl("btnLow"), Button)
		'	''auto.ForeColor = System.Drawing.Color.Gold
		'	'auto.Enabled = True
		'	'		End If
		'	'End If
		'	If Session("gUserID").ToString() = txtOwnedByUserID.Text Or Session("gUserType") = "MASTER" Then
		'		txtNotes.Visible = True
		'		'txt1.Parent.Visible = True     **************** locks user out of the row
		'		lblnotes.Visible = True
		'	Else
		'		txtNotes.Visible = False
		'		'txt1.Parent.Visible = False
		'		lblnotes.Visible = False
		'	End If
		'End If



	End Sub 'RadGrid1_ItemCreated
	Protected Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs)



		'''''''''''''''''If TypeOf e.Item Is GridEditableItem Then
		'''''''''''''''''	Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
		'''''''''''''''''	' for making the cell invisible during editing
		'''''''''''''''''	Session("PriorityType") = eitem("priorityname").Text


		'''''''''''''''''End If


		'If TypeOf e.Item Is GridDataItem Then
		'	Dim item As GridDataItem = CType(e.Item, GridDataItem)
		'	'If item("showpriority").Text = "Urgent" Then
		'	'	item.BackColor = System.Drawing.Color.Red
		'	'	item.ForeColor = System.Drawing.Color.Black
		'	'End If
		'End If
		'If (TypeOf e.Item Is GridEditFormItem) AndAlso (e.Item.IsInEditMode) AndAlso (Not e.Item.OwnerTableView.IsItemInserted) Then
		'	Dim edititem As GridEditFormItem = CType(e.Item, GridEditFormItem)
		'	Dim txtOwnedByUserID As TextBox = CType(edititem.FindControl("txtOwnedbyUserID"), TextBox)
		'	Dim txtNotes As TextBox = CType(edititem.FindControl("txtNotes"), TextBox)
		'	Dim lblnotes As Label = CType(edititem.FindControl("lblnotes"), Label)
		'	Dim lblPriority As Label = CType(edititem.FindControl("labelC"), Label)

		'	If lblPriority.Text <> Nothing Then


		'		If lblPriority.Text = "Low" Then
		'			'	Dim item As GridEditFormItem = CType(e.Item, GridEditFormItem)
		'			Dim auto As Button = CType(edititem.FindControl("btnLow"), Button)
		'			auto.ForeColor = System.Drawing.Color.Gold
		'			'auto.Enabled = True
		'		End If
		'	End If
		'	'If Session("gUserID").ToString() = txtOwnedByUserID.Text Or Session("gUserType") = "MASTER" Then
		'	'	txtNotes.Visible = True
		'	'	'txt1.Parent.Visible = True     **************** locks user out of the row
		'	'	lblnotes.Visible = True
		'	'Else
		'	'	txtNotes.Visible = False
		'	'	'txt1.Parent.Visible = False
		'	'	lblnotes.Visible = False
		'	'End If
		'End If
		'If TypeOf e.Item Is GridEditFormItem AndAlso e.Item.IsInEditMode Then


		'********************************************************************************************************
		'If TypeOf e.Item Is GridDataItem Then
		'	Dim dataItem As GridDataItem = CType(e.Item, GridDataItem)
		'ElseIf TypeOf e.Item Is GridEditFormItem Then
		'	Dim editItem As GridEditFormItem = CType(e.Item, GridEditFormItem)
		'	Dim str As Label = DirectCast(editItem.FindControl("labelC"), Label)
		'End If



	End Sub

	Protected Sub RadGrid1_ItemCommand(sender As Object, e As GridCommandEventArgs)


		Dim ticketid
		If Session("gUserType") = "MASTER" Then


			'	'**************************** this function allows navigation to another page - changed to EDIT MODE 11/10/2019 - DIGGES
			If e.CommandName = "RowClick" Then
				Try
					Dim index As Integer = e.Item.ItemIndex
					Dim item As GridDataItem = DirectCast(RadGrid1.Items(index), GridDataItem)
					ticketid = item("ticketid").Text

					Response.Redirect("TicketDetails.aspx?ticketid=" & ticketid)

				Catch

				End Try
			End If

		End If





		If e.CommandName = RadGrid.InitInsertCommandName Then
			Session.Remove("editMode")
			e.Canceled = True
			RadGrid1.EditIndexes.Clear()
			e.Item.OwnerTableView.EditFormSettings.UserControlName = "NewTicket.ascx"
			e.Item.OwnerTableView.InsertItem()
			Session("editMode") = "INSERT"
		ElseIf e.CommandName = RadGrid.EditCommandName Then
			Session.Remove("editMode")
			e.Item.OwnerTableView.IsItemInserted = False
			Session("editMode") = "UPDATE"
			If TypeOf e.Item Is GridEditableItem Then
				Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
				' for making the cell invisible during editing
				Session("PriorityType") = eitem("priorityname").Text
				Session("TicketType") = eitem("typename").Text
				Session("DueDate") = eitem("datedue").Text
				Session("SelectedTicketID") = eitem("ticketid").Text
			End If

			'If Session("gUserType") = "MASTER" Then
			'e.Item.OwnerTableView.EditFormSettings.UserControlName = "TicketDetails.ascx"
			'Else
			e.Item.OwnerTableView.EditFormSettings.UserControlName = "NewTicket.ascx"
			'End If


		End If



		'	'If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
		'	'	Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
		'	'	' for making the cell invisible during editing
		'	'	eitem("txtNotes").Visible = False

		'	'	' for making its label also invisible  
		'	'	eitem("TextBox1").Parent.Visible = False
		'	'End If

		'	'For Each item As GridDataItem In RadGrid1.Items
		'	'	Dim txtbx As TextBox = CType(item.FindControl("txtOwnedByUserID"), TextBox)
		'	'	If item("ownedbyuserid") = Session("gUserID") Then
		'	'		txtbx.Visible = True
		'	'	Else
		'	'		txtbx.Visible = False
		'	'	End If

		'	'Next

		'	If (e.Item.IsInEditMode) Then
		'		Dim edititem As GridEditFormItem = CType(e.Item, GridEditFormItem)
		'		Dim lbl As TextBox = CType(edititem.FindControl("TextBox1"), TextBox)
		'		lbl.Visible = False
		'	End If

		'End If


		If e.CommandName = RadGrid.EditCommandName Then
			RadGrid1.MasterTableView.IsItemInserted = False
		End If

		If e.CommandName = RadGrid.InitInsertCommandName Then
			RadGrid1.MasterTableView.ClearEditItems()
		End If



		'Dim edititem As GridEditFormItem = DirectCast(TryCast(e.Item, GridDataItem).EditFormItem, GridEditFormItem)
		'get reference to label lb1 







	End Sub

	Protected Sub btnLow_Click(sender As Object, e As EventArgs)
		Session("Priority") = "Low"


	End Sub

	Protected Sub btnLow_Init(sender As Object, e As EventArgs)

	End Sub

	Protected Sub btnMedium_Click(sender As Object, e As EventArgs)

	End Sub

	Protected Sub btnHigh_Click(sender As Object, e As EventArgs)

	End Sub

	Protected Sub btnUrgent_Click(sender As Object, e As EventArgs)

	End Sub

	Protected Sub btnSystemError_Click(sender As Object, e As EventArgs)

	End Sub

	Protected Sub btnPriceChanges_Click(sender As Object, e As EventArgs)

	End Sub

	Protected Sub btnPriceTimerRequest_Click(sender As Object, e As EventArgs)

	End Sub

	Protected Sub btnNewMenuItem_Click(sender As Object, e As EventArgs)

	End Sub

	Protected Sub btnNewHWRequest_Click(sender As Object, e As EventArgs)

	End Sub

	Protected Sub btnSystemMaintenance_Click(sender As Object, e As EventArgs)

	End Sub

	Protected Sub btnSystemErro2_Click(sender As Object, e As EventArgs)

	End Sub

	Protected Sub btnSystemUpdate_Click(sender As Object, e As EventArgs)

	End Sub

	Protected Sub btnContinue_Click(sender As Object, e As EventArgs)

	End Sub

	Protected Sub lnkNewTicket_Click1(sender As Object, e As EventArgs)
		'usercontrol1.refresh()
	End Sub
End Class