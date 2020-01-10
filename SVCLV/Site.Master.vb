Public Class SiteMaster
	Inherits MasterPage
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
		If Session("gUsername") Is Nothing Or Session("gUsername") = "" Then
			Response.Redirect("Login.aspx")
		End If
	End Sub
End Class