<%@ Page Title="Tickets" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.vb" Inherits="SVCLV.UserDetails" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
 
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadComboBox1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl LoadingPanelID="LoadingPanel1" ControlID="RadMultiPage1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadTabStrip1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadTabStrip1" />
                    <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadMultiPage1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadTabStrip1" />
                    <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
	
	
   

   

	<br /><br /><br />
       <asp:Table runat="server"   HorizontalAlign="Center" CssClass="CT"  BackColor="black"  >
		   <asp:TableRow Height="15">
			   <asp:TableCell HorizontalAlign="Center" ColumnSpan="4">
				     <h3> User Details</h3>
			   </asp:TableCell>
			 
		   </asp:TableRow>
		   	   <asp:TableRow>
			   <asp:TableCell VerticalAlign="Top">

														   <asp:Table runat="server"     >

		   														   <asp:TableRow>
																   <asp:TableCell HorizontalAlign="Right">
																		  <asp:Label CssClass="CT" ID="Label9" runat="server"  Text="Status: "></asp:Label>
																   </asp:TableCell>

																	<asp:TableCell  HorizontalAlign="Left">
																	   <telerik:RadComboBox ID="status" DataSourceID="SqlStatus" DataTextField="status"
																				DataValueField="status" Height="200px" AppendDataBoundItems="true" 
																				runat="server">
																				<Items>
                             
																				</Items>
																			</telerik:RadComboBox>
																   </asp:TableCell>
															   </asp:TableRow>

															   <asp:TableRow>
																   <asp:TableCell HorizontalAlign="Right">
																		  <asp:Label ID="lblcompanyid" runat="server" Text="Company: "></asp:Label>
																   </asp:TableCell>

																	<asp:TableCell>
																	   <telerik:RadComboBox ID="company" DataSourceID="SqlCompanies" DataTextField="Name"
																				DataValueField="companyid" Height="200px" AppendDataBoundItems="true" 
																				runat="server">
																				<Items>
                               
																				</Items>
																			</telerik:RadComboBox>
																   </asp:TableCell>
															   </asp:TableRow>

																 <asp:TableRow>
																   <asp:TableCell HorizontalAlign="Right">
																		  <asp:Label ID="Label8" runat="server" Text="Customer: "></asp:Label>
																   </asp:TableCell>

																	<asp:TableCell>
																	   <telerik:RadComboBox ID="customer" DataSourceID="SqlCustomers" DataTextField="name"
																				DataValueField="customerid" Height="200px" AppendDataBoundItems="true" 
																				runat="server">
                       
																		   <Items>
									
                            
								
																				</Items>
					 
																			</telerik:RadComboBox>
																   </asp:TableCell>
															   </asp:TableRow>

																 <asp:TableRow>
																   <asp:TableCell HorizontalAlign="Right">
																		  <asp:Label ID="Label3" runat="server" Text="Type: "></asp:Label>
																   </asp:TableCell>
																	<asp:TableCell>
																	   <telerik:RadComboBox ID="usertype" DataSourceID="SqlUserTypes" DataTextField="UserType"
																				DataValueField="UserType" Height="200px" AppendDataBoundItems="true" 
																				runat="server">
																				<Items>
                               
																				</Items>
																			</telerik:RadComboBox>
																   </asp:TableCell>
															   </asp:TableRow>





																 <asp:TableRow>
																   <asp:TableCell HorizontalAlign="Right">
																		  <asp:Label ID="Label7" runat="server" Text="Name: "></asp:Label>
																   </asp:TableCell>
																	<asp:TableCell>
																	 <asp:textbox	 runat="server" ID="fullname"  ></asp:textbox>
																		 <asp:RequiredFieldValidator runat="server" id="RequiredFullName" ControlToValidate="fullname" ErrorMessage = "Name is required" Display="None" ValidationGroup="Save" SetFocusOnError="True" />
																   </asp:TableCell>
															   </asp:TableRow>


		  
		   		   
																<asp:TableRow>
																   <asp:TableCell HorizontalAlign="Right">
																		  <asp:Label ID="Label2" runat="server" Text="Username: "></asp:Label>
																   </asp:TableCell>
																	<asp:TableCell>
																	   <asp:TextBox ID="username" runat="server" />
																		 <asp:RequiredFieldValidator runat="server" id="RequiredUsername" ControlToValidate="username" ErrorMessage = "Username is required" Display="None" ValidationGroup="Save" SetFocusOnError="True" />
																   </asp:TableCell>
															   </asp:TableRow>

																<asp:TableRow>
																   <asp:TableCell HorizontalAlign="Right">
																		  <asp:Label ID="Label6" runat="server" Text="Password: "></asp:Label>
																   </asp:TableCell>
																	<asp:TableCell>
																	 <asp:TextBox runat="server" ID="password" TextMode="Password" ></asp:TextBox>
																			 <asp:RequiredFieldValidator runat="server" id="Requiredpassword" ControlToValidate="password" ErrorMessage = "Pass is required" Display="None" ValidationGroup="Save" SetFocusOnError="True" />
																   </asp:TableCell>
															   </asp:TableRow>
		  
																<asp:TableRow>
																   <asp:TableCell HorizontalAlign="Right">
																		  <asp:Label ID="Label1" runat="server" Text="Email: "></asp:Label>
																   </asp:TableCell>
																	<asp:TableCell>
																	 <asp:TextBox runat="server" ID="email" ></asp:TextBox>
																			 <asp:RequiredFieldValidator runat="server" id="RequiredEmail" ControlToValidate="email" ErrorMessage = "Email is required" Display="None" ValidationGroup="Save" SetFocusOnError="True" />
																   </asp:TableCell>
															   </asp:TableRow>
															     <asp:TableRow runat="server" HorizontalAlign="Center">
			
														<asp:TableCell ColumnSpan="2" >
															<asp:Button ID="cmdSave" runat="server" Text="Save" ValidationGroup="Save"  OnClick="cmdSave_Click" />
					
														</asp:TableCell>
													</asp:TableRow>
															</asp:Table>

			   </asp:TableCell>
				 <asp:TableCell VerticalAlign="Top">

								  <asp:Table runat="server" CellPadding="15" CellSpacing="15"    >

		   										

													<asp:TableRow runat="server">
														<asp:TableCell runat="server" HorizontalAlign="Right">
																	   <asp:Label ID="Label4" runat="server" Text="Locations: "></asp:Label>
																</asp:TableCell>
														<asp:TableCell runat="server">
														   <telerik:RadListBox   AllowTransferOnDoubleClick="true"        AllowReorder="false" ID="availablelocations" runat="server" AllowTransfer="true" 

															Height="900px"  Width="305px"  SelectionMode="Multiple"

															TransferToID="selectedlocations">

															<buttonsettings  showtransferall="true" verticalalign="Middle" ></buttonsettings>

														</telerik:RadListBox>
													</asp:TableCell>
														<asp:TableCell>
                   
													<telerik:RadListBox AllowTransferOnDoubleClick="true"   ID="selectedlocations" runat="server"     TransferToID="availablelocations" Height="900px"  SelectionMode="Multiple"   Width="300px" >

															<buttonsettings  ReorderButtons="All" ShowReorder="true"  showtransferall="true" verticalalign="Middle"></buttonsettings>
														</telerik:RadListBox>
					
														</asp:TableCell>
					

													</asp:TableRow>

										


											   </asp:Table>
											  </asp:TableCell>        
											 </asp:TableRow>
							</asp:Table>
   
 




<div id="ErrorMessages">
                 <asp:ValidationSummary runat="server" ID="errForm" style="text-align:center; position: absolute; top: 660px; left: 212px;" HeaderText="The form could not be processed. Fix the following and try again." CssClass="Error" ValidationGroup="Save" ShowMessageBox="True" ShowSummary="False" />
                     </div>











    <asp:SqlDataSource ID="SqlCompanies" runat="server" ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" SelectCommand="SELECT * FROM Companies"></asp:SqlDataSource>
	 <asp:SqlDataSource ID="SqlCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" SelectCommand="SELECT * FROM Customers"></asp:SqlDataSource>

	 <asp:SqlDataSource ID="SqlUserTypes" runat="server" ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" SelectCommand="SELECT usertype FROM Users GROUP BY usertype ORDER BY usertype"></asp:SqlDataSource>
	<asp:SqlDataSource ID="SqlStatus" runat="server" ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" SelectCommand="SELECT status FROM Users GROUP BY status ORDER BY status"></asp:SqlDataSource>
 </asp:Content>
       

