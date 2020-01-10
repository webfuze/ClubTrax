
Imports System.IO



Public Class TicketImages
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim filesindirectory As String() = Directory.GetFiles(Server.MapPath("~/Uploads/" & Request.QueryString("ticketid")))
		Dim images As List(Of String) = New List(Of String)(filesindirectory.Count())

		For Each item As String In filesindirectory
			images.Add(String.Format("~/Uploads/" & Request.QueryString("ticketid") & "/{0}", System.IO.Path.GetFileName(item)))
		Next

		RepeaterImages.DataSource = images
		RepeaterImages.DataBind()
	End Sub

End Class