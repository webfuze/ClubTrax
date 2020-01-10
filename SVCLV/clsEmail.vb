
Imports System.Net.Mail
Public Class clsEmail

    Public Shared Function SendEmail(strEmailTo As String, strEmailFrom As String, strSubject As String, strBody As String)
        Dim strReturn As String = "OK"
        Dim strSender As String = ""

        If strEmailFrom = "" Then
			strEmailFrom = "tommy@webfuse.co"
		Else
            strSender = strEmailFrom
			strEmailFrom = "tommy@webfuse.co"
		End If

        Dim Smtp_Server As New SmtpClient
        Dim e_mail As New MailMessage()
        Smtp_Server.UseDefaultCredentials = False
		Smtp_Server.Credentials = New Net.NetworkCredential("tommy@webfuse.co", "test")
		Smtp_Server.Port = 587
        Smtp_Server.EnableSsl = True
        Smtp_Server.Host = "smtpauth.earthlink.net"

        e_mail = New MailMessage()
		e_mail.From = New MailAddress(strEmailFrom, "ClubTrax Submission")
		e_mail.To.Add(strEmailTo)
        e_mail.Subject = strSubject
        e_mail.IsBodyHtml = False
        e_mail.Body = strBody
        Smtp_Server.Send(e_mail)

        Return strReturn

    End Function

End Class
