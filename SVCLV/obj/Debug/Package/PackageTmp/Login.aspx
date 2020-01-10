<%@ Page Language="vb" MasterPageFile="~/login.master"  AutoEventWireup="true" CodeBehind="Login.aspx.vb" Inherits="SVCLV.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

     <div class="lg-body">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Panel ID="PanelLogin" runat="server">
        <asp:UpdatePanel ID="UpdatePanelHome" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                       <div class="inner">  
            		   <div id="lg-head">
                           <asp:Image ID="logo" runat="server" class="logo" ImageUrl="./images/logo.png" Width="200" />
                            <p><asp:Label ID="lblNotes" runat="server" Text="Note to user" Visible="false"></asp:Label></span></p>
                       </div>
						   <div class="login">
						    <form id="lg-form">
								
									<li id="usr-field">
										<asp:TextBox ID="txtUserName" runat="server" CssClass="textbox" Placeholder="Username"></asp:TextBox>
									</li>
                                    <li id="psw-field">
                                       <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" TextMode="Password" Placeholder="Password"></asp:TextBox>

                                    </li><asp:Panel ID="Panel1" runat="server" DefaultButton="cmdLogin">

                                       <label class="container">
                                       <asp:CheckBox runat="server" ID="cbRememberMe"></asp:CheckBox>
                                        <span class="checkmark"></span>
                                          </label>
                                       <asp:Label ID="Label1" runat="server" Text="Remember Me" CssClass="checkmark-text"></asp:Label><br />
                                         <asp:Button ID="cmdLogin" runat="server" Text="Login" CssClass="submitButton" />
                               
                               </asp:Panel>
                                <asp:Label ID="lblMessage" runat="server" CssClass="labelsMessage" Font-Size="medium"></asp:Label>
								<br />
							<asp:Label ID="lblFooter" runat="server" CssClass="labels_sub" Text="Can't login? Please contact <a href='mailto:support@clubtrax.com?Subject=Login%20Support' target='_top'>Support</a>"></asp:Label> 
                           
                                     </form>
            </ContentTemplate>
        </asp:UpdatePanel>
        </asp:Panel>
	</div>	
</asp:Content>
