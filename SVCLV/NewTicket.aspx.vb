Public Class NewTicket1
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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
End Class