<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TicketImages.aspx.vb" Inherits="SVCLV.TicketImages" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

	<body>
		<asp:Repeater ID="RepeaterImages" runat="server">
			<ItemTemplate>
				<asp:Image ID="Image"   runat="server" ImageUrl='<%# Container.DataItem %>' />
			</ItemTemplate>
		</asp:Repeater>
	</body>
</html>


