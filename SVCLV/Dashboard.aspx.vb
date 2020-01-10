

Imports Telerik.Web.UI

Public Class Dashboard
	Inherits System.Web.UI.Page



	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Protected Sub lnkNewTicket_Click(sender As Object, e As EventArgs)

	End Sub


	Protected Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs)
		If TypeOf e.Item Is GridDataItem Then
			Dim item As GridDataItem = CType(e.Item, GridDataItem)

			If item("showpriority").Text = "Urgent" Then
				item.BackColor = System.Drawing.Color.Red
				item.ForeColor = System.Drawing.Color.Black
			End If
		End If
	End Sub




End Class