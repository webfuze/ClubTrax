<%@ Page Title="Tickets" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TicketDetails.aspx.vb" Inherits="SVCLV.TicketDetails" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
 
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="RadAjaxManagerLocation" runat="server">
		
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
       <asp:Table runat="server"   HorizontalAlign="Center" CssClass="CT"  BackColor="black"  Width="100%"  >
		   <asp:TableRow Height="15">
			   <asp:TableCell HorizontalAlign="Center" ColumnSpan="4">
				     <h3> Ticket Details</h3>
			   </asp:TableCell>
			 
		   </asp:TableRow>
		   	   <asp:TableRow>
			   <asp:TableCell VerticalAlign="Top">

														   <asp:Table runat="server"     >
															   	<asp:TableRow runat="server" HorizontalAlign="Center">
			
																				<asp:TableCell HorizontalAlign="left" ColumnSpan="2" >
																					<asp:Button ID="cmdSave" runat="server" Text="Save" OnClick="cmdSave_Click" />
																				</asp:TableCell>
																			</asp:TableRow>
		   														   <asp:TableRow>
																			 
																			   <asp:TableCell HorizontalAlign="Right">
																					  <asp:Label ID="Label7" runat="server" Text="Ticket#: "></asp:Label>
																			   </asp:TableCell>
																				<asp:TableCell>
																				 <asp:label runat="server" ID="ticketnumber" ForeColor="Red" Font-Bold="true" ></asp:label>
																			   </asp:TableCell>
																		     <asp:TableCell HorizontalAlign="Right">
																					  <asp:Label ID="Label2" runat="server" Text="Due Date: "></asp:Label>
																			   </asp:TableCell>
																				<asp:TableCell>
																				   <asp:TextBox ID="txtDueDate" runat="server" TextMode="Date" />
																			   </asp:TableCell>
																		   </asp:TableRow>
																			  <asp:TableRow>









																			   <asp:TableCell HorizontalAlign="Right">
																					  <asp:Label ID="lblcompanyid" runat="server" Text="Company: "></asp:Label>
																			   </asp:TableCell>

																				<asp:TableCell>
																				   <telerik:RadComboBox AutoPostBack="True" OnSelectedIndexChanged="company_SelectedIndexChanged" ID="company"   Height="200px" AppendDataBoundItems="true" 
																							runat="server">
																							<Items>
																								<telerik:RadComboBoxItem Text="All" />
																							</Items>
																						</telerik:RadComboBox>
																			   </asp:TableCell>

																				   <asp:TableCell HorizontalAlign="Right">
																					  <asp:Label ID="lblTicketType" runat="server" Text="Status: "></asp:Label>
																			   </asp:TableCell>
																				<asp:TableCell>
																				   <telerik:RadComboBox ID="StatusType" DataSourceID="SqlTicketStatusTypes" DataTextField="Name"
																							DataValueField="StatusID" Height="200px" AppendDataBoundItems="true" 
																							runat="server">
																							<Items>
																								<telerik:RadComboBoxItem Text="All" />
																							</Items>
																						</telerik:RadComboBox>
																			   </asp:TableCell>
																				  
																			
																			
																		


																		   </asp:TableRow>

																			 <asp:TableRow>
																			   <asp:TableCell HorizontalAlign="Right">
																					  <asp:Label ID="Label8" runat="server" Text="Customer: "></asp:Label>
																			   </asp:TableCell>

																				<asp:TableCell>
																				   <telerik:RadComboBox ID="customer" OnSelectedIndexChanged="customer_SelectedIndexChanged" AutoPostBack="true" Height="200px" AppendDataBoundItems="true" 
																							runat="server">
																							<Items>
																								<telerik:RadComboBoxItem Text="All" />
																							</Items>
																						</telerik:RadComboBox>
																			   </asp:TableCell>
																				   <asp:TableCell HorizontalAlign="Right">
																					  <asp:Label ID="Label9" runat="server" Text="Type: "></asp:Label>
																			   </asp:TableCell>
																				<asp:TableCell>
																				   <telerik:RadComboBox ID="TicketType" DataSourceID="SqlTicketTypes" DataTextField="Name"
																							DataValueField="TicketTypeID" Height="200px" AppendDataBoundItems="true" 
																							runat="server">
																							<Items>
																								<telerik:RadComboBoxItem Text="All" />
																							</Items>
																						</telerik:RadComboBox>
																			   </asp:TableCell>
																		   </asp:TableRow>
																		  
																			
																			<asp:TableRow>
																			   <asp:TableCell HorizontalAlign="Right">
																					  <asp:Label ID="Label3" runat="server" Text="Priority: "></asp:Label>
																			   </asp:TableCell>
																				<asp:TableCell>
																				   <telerik:RadComboBox ID="Priority" DataSourceID="SqlTicketPriorityTypes" DataTextField="Name"
																							DataValueField="PriorityID" Height="200px" AppendDataBoundItems="true" 
																							runat="server">
																							<Items>
																								<telerik:RadComboBoxItem Text="All" />
																							</Items>
																						</telerik:RadComboBox>
																			   </asp:TableCell>
																		   </asp:TableRow>
		   		   
															   				 <asp:TableRow runat="server">
																				<asp:TableCell runat="server" HorizontalAlign="Right">
																					<asp:Label ID="Label5" runat="server" Text="Attachment(s):  "></asp:Label>
																				</asp:TableCell>
																				<asp:TableCell runat="server">
																					<asp:FileUpload ID="AttachFile" runat="server" AllowMultiple="True" />
																				</asp:TableCell>
																			</asp:TableRow>
																			<asp:TableRow>
																			   <asp:TableCell HorizontalAlign="Right">
																					  <asp:Label ID="Label6" runat="server" Text="Subject: "></asp:Label>
																			   </asp:TableCell>
																				<asp:TableCell>
																				 <asp:TextBox runat="server" ID="subject" Width="300" ></asp:TextBox>
																			   </asp:TableCell>
																		   </asp:TableRow>
																			 <asp:TableRow>
																			   <asp:TableCell HorizontalAlign="Right">
																					  <asp:Label ID="Label1" runat="server" Text="Description: "></asp:Label>
																			   </asp:TableCell>
																				<asp:TableCell>
																				 <asp:TextBox runat="server" ID="description" TextMode="MultiLine" Rows="3" Columns="40"></asp:TextBox>
																			   </asp:TableCell>
																		   </asp:TableRow>


																		
															   	 <asp:TableRow ID="RowClarify">
																			   <asp:TableCell HorizontalAlign="Right" >
																					  <asp:Label ID="Label4" runat="server" Text="Clarify: "></asp:Label>
																			   </asp:TableCell>
																				<asp:TableCell ColumnSpan="4">
																				 <asp:TextBox runat="server" ID="Clarify" Width="600" ></asp:TextBox>
																			   </asp:TableCell>
																		   </asp:TableRow>


															   	 <asp:TableRow ID="RowClarifyReply" >
																			   <asp:TableCell HorizontalAlign="Right" >
																					  <asp:Label ID="Label10"  runat="server" Text="Thread: "></asp:Label>
																			   </asp:TableCell>
																				<asp:TableCell ColumnSpan="4">
																				<asp:Repeater ID="rptClarifications" runat="server">
																						<HeaderTemplate>
																							<table cellspacing="2" cellpadding="2" rules="all" border="1" width="">
																								<tr>
																									<th scope="col" style="width: 100px" bgcolor="gold">
																										<font color="black"><b>From</b></font>
																									</th>
																									<th scope="col" style="width: 350px" bgcolor="gold">
																										<font color="black"><b>Message</b></font>
																									</th>
																									<th scope="col" style="width: 150px" bgcolor="gold">
																										<font color="black"><b>Date</b></font>
																									</th>
																									
																								</tr>
																						</HeaderTemplate>
																						<ItemTemplate>
																							<tr>
																								<td>
																									<asp:Label ID="Label11" runat="server" Font-Size="Smaller" Text='<%# Eval("fullname") %>' />
																								</td>
																								<td>
																									<asp:Label ID="lbltext" runat="server" Font-Size="Smaller" Text='<%# Eval("text") %>' />
																								</td>
																								<td>
																									<asp:Label ID="lbldate" runat="server" Font-Size="Smaller" Text='<%# Eval("datecreated") %>' />
																								</td>
																								
																							</tr>
																						</ItemTemplate>
																						<FooterTemplate>
																							</table>
																						</FooterTemplate>
																					</asp:Repeater>

																			   </asp:TableCell>
																		   </asp:TableRow>
																	</asp:Table>

	   </asp:TableCell>
	  
		 <asp:TableCell VerticalAlign="Top">

														  <asp:Table runat="server" CellPadding="15" CellSpacing="15"    >

															<asp:TableRow runat="server">
															
																<asp:TableCell runat="server">
															
																	
																	<telerik:RadListBox    AllowTransferOnDoubleClick="true"  AllowReorder="false" ID="availablelocations" runat="server" AllowTransfer="true" 

																	  SelectionMode="Multiple"

																	TransferToID="selectedlocations" Height="900px"  Width="305px" >

																	<buttonsettings  showtransferall="true" verticalalign="Middle" ></buttonsettings>

																</telerik:RadListBox>
            
                   
															<telerik:RadListBox AllowTransferOnDoubleClick="true"  CheckBoxes="true"   ID="selectedlocations" runat="server"     TransferToID="availablelocations" Height="900px"  Width="305px"  SelectionMode="Multiple"    >

																	<buttonsettings  ReorderButtons="All" ShowReorder="true"  showtransferall="true" verticalalign="Middle"></buttonsettings>
																</telerik:RadListBox>
																	



																</asp:TableCell>


															</asp:TableRow>


														



					
														   </asp:Table>
																	  </asp:TableCell>        
																	 </asp:TableRow>
													</asp:Table>
   
 

	









	
    <asp:SqlDataSource ID="SqlCompanies" runat="server" ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" SelectCommand="SELECT * FROM Companies"></asp:SqlDataSource>
	 <asp:SqlDataSource ID="SqlCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" SelectCommand="SELECT * FROM Customers"></asp:SqlDataSource>




    <asp:SqlDataSource ID="SqlTicketPriorityTypes" runat="server" ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" SelectCommand="SELECT * FROM TicketPriorityTypes"></asp:SqlDataSource>
	 <asp:SqlDataSource ID="SqlTicketTypes" runat="server" ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" SelectCommand="SELECT * FROM TicketTypes"></asp:SqlDataSource>
	 <asp:SqlDataSource ID="SqlTicketStatusTypes" runat="server" ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" SelectCommand="SELECT * FROM TicketStatusTypes"></asp:SqlDataSource>
 </asp:Content>
       

