<%@ Page Title="Tickets" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TicketView.aspx.vb" Inherits="SVCLV.TicketView" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register TagPrefix="uc"  TagName="usercontrol" Src="~/NewTicket.ascx" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
 
    <%--<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
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
					<telerik:AjaxUpdatedControl ControlID="RadWindow1" />
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
	<telerik:RadScriptManager ID="Radscriptmanager1" runat="server"></telerik:RadScriptManager>
--%>


	
		
	<br /><br /><br /><br /><br />
   
    	<asp:Label ID="mode" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
       
        <telerik:RadGrid  ID="RadGrid1" runat="server" AllowFilteringByColumn="True" CurrentFilterFunction="Contains"   OnItemDataBound="RadGrid1_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand"
            AutoPostBackOnFilter="true" ShowStatusBar="True" AllowPaging="True" ShowHeader="true" AllowSorting="True" DataSourceID="SqlTickets"   AllowAutomaticUpdates="true" AllowAutomaticInserts="true"
               Skin="Default"  AutoGenerateColumns="false">
                <GroupingSettings CaseSensitive="False" />
                <ExportSettings ExportOnlyData="True"></ExportSettings>
                <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true">
                   <KeyboardNavigationSettings AllowSubmitOnEnter="true"  EnableKeyboardShortcuts="true" />
                    <Selecting AllowRowSelect="True" />

                </ClientSettings>
                <SelectedItemStyle CssClass="SelectedItem"></SelectedItemStyle>
                <MasterTableView DataKeyNames="ticketId" CommandItemDisplay="Top" DataSourceID="SqlTickets">
                    <CommandItemTemplate>
                        <div style="padding: 11px 11px;">
                            <asp:LinkButton   ID="lnkNewTicket" runat="server" CommandName="InitInsert"  OnClick="lnkNewTicket_Click1"  ><i style="font-size: 20px;" class="fa fa-ticket" aria-hidden="true"></i> New Ticket</asp:LinkButton>&nbsp;&nbsp;
                        </div>
                    </CommandItemTemplate>
                   
                    <NoRecordsTemplate>
                        <asp:Label ID="lblNoRecords" runat="server" Text="No Records"></asp:Label>
                    </NoRecordsTemplate>
                      <Columns>
						    <telerik:GridEditCommandColumn  HeaderText="Edit" ButtonType="ImageButton" UniqueName="EditCommandColumn" >
                              <HeaderStyle Width="100px" />
                             <ItemStyle Width="100px" />  
                       </telerik:GridEditCommandColumn>


						   <telerik:GridBoundColumn DataField="ticketid"  HeaderStyle-HorizontalAlign="Left"  Display="false"
                            FilterControlAltText="Filter Ticket# column" HeaderText="TicketID" SortExpression="" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                            UniqueName="TicketID">
                          
                        </telerik:GridBoundColumn>

						  
						   <telerik:GridBoundColumn DataField="priorityname"  HeaderStyle-HorizontalAlign="Left"  Display="false"
                              SortExpression="" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                            UniqueName="priorityname">
                          
                        </telerik:GridBoundColumn>

						    <telerik:GridBoundColumn DataField="typename"  HeaderStyle-HorizontalAlign="Left"  Display="false"
                              SortExpression="" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                            UniqueName="typename">
                          
                        </telerik:GridBoundColumn>

						 <%--  <telerik:GridBoundColumn DataField="ownedbyuserid"  HeaderStyle-HorizontalAlign="Left"  Display="true"
                            FilterControlAltText="Filter column" HeaderText="OwnedByUserID" SortExpression="" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                            UniqueName="ownedbyuserid">
                          
                        </telerik:GridBoundColumn>--%>

						    <telerik:GridBoundColumn DataField="companyid"  HeaderStyle-HorizontalAlign="Left"  Display="false"
                            FilterControlAltText="Filter Ticket# column" HeaderText="companyID" SortExpression="" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                            UniqueName="companyID">
                          
                        </telerik:GridBoundColumn>

						    <telerik:GridTemplateColumn FilterControlWidth="110px" DataField="StatusID" HeaderText="Status" SortExpression="StatusID" AllowSorting="true" AllowFiltering="true" UniqueName="StatusID">
                     <ItemTemplate>
						 <asp:Image runat="server" ImageUrl='<%# Bind("statusImage")%>' ID="imageA" Width="20" ></asp:Image>
                           <asp:Label runat="server" Text='<%# Bind("statusName")%>' ID="labelB"></asp:Label>
                        
                    </ItemTemplate>
                    
                    <FilterTemplate>
                        <telerik:RadComboBox ID="RadComboBoxTitle2" DataSourceID="SqlTicketStatusTypes" DataTextField="Name"
                            DataValueField="StatusID"  Width="95" AppendDataBoundItems="true" SelectedValue='<%# TryCast(Container, GridItem).OwnerTableView.GetColumn("StatusID").CurrentFilterValue%>'
                            runat="server" OnClientSelectedIndexChanged="TitleIndexChangedB">
                            <Items>
                                <telerik:RadComboBoxItem Text="All" />
                            </Items>
                        </telerik:RadComboBox>
                        <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
                            <script type="text/javascript">
								function TitleIndexChangedB(sender, args) {
									var tableView = $find("<%# TryCast(Container, GridItem).OwnerTableView.ClientID %>");
									tableView.filter("StatusID", args.get_item().get_value(), "EqualTo");
								}
                            </script>
                        </telerik:RadScriptBlock>
                    </FilterTemplate>
                 </telerik:GridTemplateColumn>



						   <telerik:GridBoundColumn DataField="ticketnumber"  HeaderStyle-HorizontalAlign="Left" 
                            FilterControlAltText="Filter Ticket# column" HeaderText="Ticket #" SortExpression="" AutoPostBackOnFilter="true" CurrentFilterFunction="EqualTo"
                            UniqueName="ticketnumber">
                             <HeaderStyle Width="70px" />
                        </telerik:GridBoundColumn>


						    <telerik:GridBoundColumn DataField="companyname" 
                            FilterControlAltText="Filter companyname column" HeaderText="Company" SortExpression="subject" 
                            UniqueName="companyname"></telerik:GridBoundColumn>


                       <telerik:GridBoundColumn DataField="customername" 
                            FilterControlAltText="Filter customername column" HeaderText="Customer" SortExpression="customername" 
                            UniqueName="customername"></telerik:GridBoundColumn>
                     

						    <telerik:GridTemplateColumn FilterControlWidth="220px" DataField="TicketTypeID" HeaderText="Type" SortExpression="TicketTypeID" AllowSorting="true" AllowFiltering="true" UniqueName="TicketTypeID">
                     <ItemTemplate>
                         
                         <asp:Label runat="server" Text='<%# Bind("typeName")%>' ID="labelA"></asp:Label>
                    </ItemTemplate>
                     
                    <FilterTemplate>
                        <telerik:RadComboBox ID="RadComboBoxTitle1" DataSourceID="SqlTicketTypes" DataTextField="Name"
                            DataValueField="TicketTypeID"  Width="95" AppendDataBoundItems="true" SelectedValue='<%# TryCast(Container, GridItem).OwnerTableView.GetColumn("TicketTypeID").CurrentFilterValue%>'
                            runat="server" OnClientSelectedIndexChanged="TitleIndexChangedA">
                            <Items>
                                <telerik:RadComboBoxItem Text="All" />
                            </Items>
                        </telerik:RadComboBox>
                        <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                            <script type="text/javascript">
								function TitleIndexChangedA(sender, args) {
									var tableView = $find("<%# TryCast(Container, GridItem).OwnerTableView.ClientID %>");
									tableView.filter("TicketTypeID", args.get_item().get_value(), "EqualTo");
								}
                            </script>
                        </telerik:RadScriptBlock>
                    </FilterTemplate>
                 </telerik:GridTemplateColumn>



						    

				


                 <telerik:GridTemplateColumn FilterControlWidth="70px" DataField="PriorityID" HeaderText="Priority" SortExpression="PriorityID" AllowSorting="true" AllowFiltering="true" UniqueName="PriorityID">
                     <ItemTemplate>
                        	
                          <asp:Label runat="server" Text='<%# Bind("priorityName")%>' ID="labelC"></asp:Label>
                    </ItemTemplate>
                     <ItemStyle Width="90px" />
                     <HeaderStyle Width="90px" />
                    <FilterTemplate>
                        <telerik:RadComboBox ID="RadComboBoxTitle3" DataSourceID="SqlTicketPriorityTypes" DataTextField="Name"
                            DataValueField="PriorityID"   Width="85" AppendDataBoundItems="true" SelectedValue='<%# TryCast(Container, GridItem).OwnerTableView.GetColumn("PriorityID").CurrentFilterValue%>'
                            runat="server" OnClientSelectedIndexChanged="TitleIndexChangedC">
                            <Items>
                                <telerik:RadComboBoxItem Text="All" />
                            </Items>
                        </telerik:RadComboBox>
                        <telerik:RadScriptBlock ID="RadScriptBlock3" runat="server">
                            <script type="text/javascript">
								function TitleIndexChangedC(sender, args) {
									var tableView = $find("<%# TryCast(Container, GridItem).OwnerTableView.ClientID %>");
									tableView.filter("PriorityID", args.get_item().get_value(), "EqualTo");
								}
                            </script>
                        </telerik:RadScriptBlock>
                    </FilterTemplate>
                 </telerik:GridTemplateColumn>

						   <telerik:GridBoundColumn DataField="subject" 
                            FilterControlAltText="Filter subject column" HeaderText="Subject" SortExpression="subject" 
                            UniqueName="subject"></telerik:GridBoundColumn>
                     


                               <telerik:GridBoundColumn DataField="fullname"  HeaderStyle-HorizontalAlign="Left" 
                            FilterControlAltText="Filter Name column" HeaderText="Created By" SortExpression="fullname" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                            UniqueName="fullname">
                          
                        </telerik:GridBoundColumn>



						    <telerik:GridDateTimeColumn DataField="dateCreated" HeaderText="Create Date" SortExpression="Created" DataFormatString="{0:MM/dd/yyyy hh:mm:ss tt}"
                    FilterControlWidth="120px" UniqueName="Created" PickerType="DateTimePicker" EnableRangeFiltering="true">
                    <HeaderStyle Width="150px" />
                </telerik:GridDateTimeColumn>

						    <telerik:GridDateTimeColumn DataField="datedue" HeaderText="Due Date" SortExpression="Due" DataFormatString="{0:MM/dd/yyyy hh:mm:ss tt}"
                    FilterControlWidth="120px" UniqueName="datedue" PickerType="DateTimePicker" EnableRangeFiltering="true">
                    <HeaderStyle Width="150px" />
                </telerik:GridDateTimeColumn>

						  
                     
                    <%--     <telerik:GridTemplateColumn AllowFiltering="false" HeaderText="Image(s)" >
                        <ItemTemplate>
                            <itemstyle Wrap="True"    Font-Underline="true" /> 
                            <asp:HyperLink forecolor="white"  Target="new" Font-Underline="true"  runat="server" Text="view" ID="imagelink" NavigateUrl='<%# String.Format("./ticketimages.aspx?ticketid={0}", DataBinder.Eval(Container.DataItem, "ticketid"))%>' onclick="javascript:w= window.open(this.href,'Ticket Images','location=no,toolbar=0,resizable=1,scrollbars=1,width=800,height=800');return false;"></asp:HyperLink>

                        </ItemTemplate>
                       
                 </telerik:GridTemplateColumn>
						  
						  <telerik:GridTemplateColumn AllowFiltering="false" HeaderText="Clarify" >
                        <ItemTemplate>
                            <itemstyle Wrap="True"    Font-Underline="true" /> 
                            <asp:HyperLink forecolor="white"  Target="new" Font-Underline="true"  runat="server" Text="clarify" ID="clarifylink" NavigateUrl='<%# String.Format("./ticketimages.aspx?ticketid={0}", DataBinder.Eval(Container.DataItem, "ticketid"))%>' onclick="javascript:w= window.open(this.href,'Clarify Ticket','location=no,toolbar=0,resizable=1,scrollbars=1,width=800,height=800');return false;"></asp:HyperLink>

                        </ItemTemplate>
                       
                 </telerik:GridTemplateColumn>
						  --%>
                       
						  
					 
                       
                    </Columns>


					<EditFormSettings EditFormType="WebUserControl"  FormStyle-BackColor="Black"></EditFormSettings>
                    <%--<FormTemplate >
                        <table id="Table2" cellspacing="" cellpadding="" width="60%" height="100%"  align="center"  border="1" rules="none"
                            style="border-collapse: collapse;">


							<tr>
                                <td align="left" colspan="2">
                                   
                                    <asp:linkButton ID="btnCancel" Text=" X " Font-Bold="true" BorderColor="black" BorderStyle="Inset" ForeColor="black" BackColor="gold" runat="server" CausesValidation="False"
                                        CommandName="Cancel"></asp:linkButton>
                                </td>

                            </tr>

							<tr>
                                <td align="left" >
                                  <br /><br />
                                </td>
								<td align="center" >
                                 <b>New Ticket</b>
                                </td>
                            </tr>


                            <tr class="EditFormHeader">
                                <td colspan="8">
                                    <b>Priority Level (Pick One)</b>
                                </td>
                            </tr>
							 <tr>
                                            <td>
                                         <asp:button Class="CTNewTicket"  OnClientClick="return false;" OnInit="btnLow_Init" OnClick="btnLow_Click" ID="btnLow" runat="server" Text="Low"></asp:button>
                                            </td>
								  <td>
                                         <asp:button  Class="CTNewTicket" ID="btnMedium" OnClick="btnMedium_Click" runat="server" Text="Medium"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket" ID="btnHigh" OnClick="btnHigh_Click" runat="server" Text="High"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket" ID="btnUrgent" OnClick="btnUrgent_Click" runat="server" Text="Urgent"></asp:button>
                                            </td>
                              </tr>
							<tr>
                                <td align="left" colspan="2">
                                  <br /><br />
                                </td>
                            </tr>
							<tr class="EditFormHeader">
                                <td colspan="8">
                                    <b>Ticket Type (Pick One)</b>
                                </td>
                            </tr>
							 <tr>
                                            <td>
                                         <asp:button Class="CTNewTicket" ID="btnSystemError" OnClick="btnSystemError_Click"  runat="server" Text="System Error"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket" ID="btnPriceChanges" OnClick="btnPriceChanges_Click" runat="server" Text="Price Changes"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket" ID="btnPriceTimerRequest" OnClick="btnPriceTimerRequest_Click" runat="server" Text="Price Timer Request"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket" ID="btnNewMenuItem" OnClick="btnNewMenuItem_Click" runat="server" Text="New Menu Item"></asp:button>
                                            </td>
                              </tr>
							<tr>
                                            <td>
												<br />
												</td>
								</tr>

							<tr>
                                            <td>
                                         <asp:button Class="CTNewTicket" ID="btnNewHWRequest" runat="server" OnClick="btnNewHWRequest_Click" Text="New HW Request"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket" ID="btnSystemMaintenance" runat="server" OnClick="btnSystemMaintenance_Click" Text="System Maintenance"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket" ID="btnSystemErro2" runat="server" OnClick="btnSystemErro2_Click" Text="System Error2"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket" ID="btnSystemUpdate" runat="server" OnClick="btnSystemUpdate_Click" Text="System Update"></asp:button>
                                            </td>
                              </tr>
							<tr>
                                            <td>
												<br />
												</td>
								</tr>
							<tr>
                                            <td align="right">
                                         Due Date:
                                            </td>
								  <td colspan="2">
                                           <asp:TextBox ID="txtDueDate" runat="server" Height="40" Width="180" Font-Size="Large"  TextMode="Date" />
                                            </td>
								 
								  <td>
                                         <asp:button Class="CTNewTicketCont" ID="btnContinue" OnClick="btnContinue_Click" runat="server" Text="Continue >>"></asp:button>
                                            </td>
                              </tr>
                          
										
                                      
						 </table>
						</FormTemplate>
                </EditFormSettings>
					  <EditFormSettings UserControlName="NewTicket.ascx" EditFormType="WebUserControl">
                    <EditColumn UniqueName="EditCommandColumn1">
                    </EditColumn>
                </EditFormSettings>--%>

                    <PagerStyle Mode="NextPrevNumericAndAdvanced" AlwaysVisible="true"/>
                </MasterTableView>
            </telerik:RadGrid>
       

	<asp:SqlDataSource runat="server"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlTickets" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" 
            
            SelectCommand="SELECT * FROM TicketView ORDER BY TicketId desc"
            UpdateCommand="UPDATE Tickets SET Notes=@Notes  WHERE TicketId = @TicketId" 
            InsertCommand="INSERT INTO customers (CompanyId, Name, Address, City, State, Zip, Status) VALUES (@CompanyId, @Name, @Address, @City, @State, @Zip, 'Current')" 
            >
            <SelectParameters>
            
            </SelectParameters>
            <UpdateParameters>
              <asp:Parameter Name="Notes" Type="String" />
			<asp:Parameter Name="Clarify" Type="String" />
            </UpdateParameters>
            <InsertParameters>
              
            </InsertParameters>
        </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlTicketTypes" runat="server" ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" SelectCommand="SELECT * FROM TicketTypes"></asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlTicketPriorityTypes" runat="server" ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" SelectCommand="SELECT * FROM TicketPriorityTypes"></asp:SqlDataSource>
	 <asp:SqlDataSource ID="SqlTicketStatusTypes" runat="server" ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" SelectCommand="SELECT * FROM TicketStatusTypes"></asp:SqlDataSource>

	 <asp:SqlDataSource ID="SqlUsers" runat="server" ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" SelectCommand="SELECT * FROM Users "></asp:SqlDataSource>
 </asp:Content>
      

