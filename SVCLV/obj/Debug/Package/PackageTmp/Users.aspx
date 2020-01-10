<%@ Page Title="Tickets" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.vb" Inherits="SVCLV.Users" %>

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
   
       
       
        <telerik:RadGrid  ID="RadGrid1" runat="server"  OnItemDataBound="RadGrid1_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand"
            AutoPostBackOnFilter="true" ShowStatusBar="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlUsers"  AutoGenerateColumns="False" GroupPanelPosition="Top">
                <GroupingSettings CaseSensitive="False" />
                <ExportSettings ExportOnlyData="True"></ExportSettings>
                <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true">
                   <KeyboardNavigationSettings AllowSubmitOnEnter="true"  EnableKeyboardShortcuts="true" />
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <SelectedItemStyle CssClass="SelectedItem"></SelectedItemStyle>
                <MasterTableView DataKeyNames="UserID" CommandItemDisplay="Top" DataSourceID="SqlUsers">










                    <CommandItemTemplate>
                        <div style="padding: 11px 11px;">
                            <asp:LinkButton   ID="lnkNewUser" runat="server" OnClick="lnkNewUser_Click"  CommandName="NewUser" ><i style="font-size: 20px;" class="fa fa-user" aria-hidden="true"></i> New User</asp:LinkButton>&nbsp;&nbsp;
                        </div>
                    </CommandItemTemplate>
                    <SortExpressions>
                    <%--    <telerik:GridSortExpression FieldName="companyid" SortOrder="Ascending" />--%>
                    </SortExpressions>
                    <NoRecordsTemplate>
                        <asp:Label ID="lblNoRecords" runat="server" Text="No Records"></asp:Label>
                    </NoRecordsTemplate>
                      <Columns>
					 <telerik:GridTemplateColumn FilterControlWidth="70px" DataField="status" HeaderText="Status" SortExpression="status" AllowSorting="true" AllowFiltering="true" UniqueName="status">
                     <ItemTemplate>
                         
                         <asp:Label runat="server" Text='<%# Bind("status")%>' ID="labelAB"></asp:Label>
                    </ItemTemplate>
                     <ItemStyle Width="90px" />
                     <HeaderStyle Width="90px" />
                    <FilterTemplate>
                        <telerik:RadComboBox ID="RadComboBoxTitle2" DataSourceID="Sqlstatus" DataTextField="status"
                            DataValueField="status" Height="200px" AppendDataBoundItems="true" SelectedValue='<%# TryCast(Container, GridItem).OwnerTableView.GetColumn("status").CurrentFilterValue%>'
                            runat="server" OnClientSelectedIndexChanged="TitleIndexChangedD">
                            <Items>
                                <telerik:RadComboBoxItem Text="All" />
                            </Items>
                        </telerik:RadComboBox>
                        <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
                            <script type="text/javascript">
								function TitleIndexChangedD(sender, args) {
									var tableView = $find("<%# TryCast(Container, GridItem).OwnerTableView.ClientID %>");
									tableView.filter("status", args.get_item().get_value(), "EqualTo");
								}
                            </script>
                        </telerik:RadScriptBlock>
                    </FilterTemplate>
                 </telerik:GridTemplateColumn>
						   <telerik:GridBoundColumn DataField="userID"  HeaderStyle-HorizontalAlign="Left"  
                            SortExpression="userID" AutoPostBackOnFilter="true"  CurrentFilterFunction="Contains" HeaderText="userID"  Display="true"
                            UniqueName="userid">
                          
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                          
                        </telerik:GridBoundColumn>

						    <telerik:GridBoundColumn DataField="CompanyID"  HeaderStyle-HorizontalAlign="Left"  
                            SortExpression="CompanyID" AutoPostBackOnFilter="true"  CurrentFilterFunction="Contains" HeaderText="CompanyID"  Display="false"
                            UniqueName="CompanyID2">
                          
							<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                          
                        </telerik:GridBoundColumn>

						
						    <telerik:GridBoundColumn DataField="CustomerID"  HeaderStyle-HorizontalAlign="Left"  
                            SortExpression="CustomerID" AutoPostBackOnFilter="true"  CurrentFilterFunction="Contains" HeaderText="CustomerID"  Display="false"
                            UniqueName="CustomerID2">
                          
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                          
                        </telerik:GridBoundColumn>

						      <telerik:GridBoundColumn DataField="Companyname"  HeaderStyle-HorizontalAlign="Left"  HeaderText="Company"
                            SortExpression="name" AutoPostBackOnFilter="true"  CurrentFilterFunction="Contains"
                            UniqueName="companyname">
                          
                        </telerik:GridBoundColumn>
                       

						    <telerik:GridBoundColumn DataField="Customername"  HeaderStyle-HorizontalAlign="Left"  HeaderText="Customer"
                            SortExpression="name" AutoPostBackOnFilter="true"  CurrentFilterFunction="Contains"
                            UniqueName="customername">
                          
                        </telerik:GridBoundColumn>
						 
                     


              



     <telerik:GridBoundColumn DataField="fullname"  HeaderStyle-HorizontalAlign="Left" 
                            FilterControlAltText="Filter Name column" HeaderText="fullname" SortExpression="fullname" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                            UniqueName="fullname">
                          
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                          
                        </telerik:GridBoundColumn>






						   <telerik:GridBoundColumn DataField="username"  HeaderStyle-HorizontalAlign="Left" 
                            FilterControlAltText="Filter Name column" HeaderText="Username" SortExpression="username" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                            UniqueName="username">
                          
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                          
                        </telerik:GridBoundColumn>

                     
                        <telerik:GridBoundColumn DataField="email" 
                            FilterControlAltText="Filter Email column" HeaderText="Email" SortExpression="Email" 
                            UniqueName="email"></telerik:GridBoundColumn>
                     
						  <telerik:GridBoundColumn DataField="usertype" 
                            FilterControlAltText="Filter usertype column" HeaderText="User Type" SortExpression="usertype" 
                            UniqueName="usertype"></telerik:GridBoundColumn> 
                       
						  
					 
                       
                    </Columns>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" AlwaysVisible="true"/>
                </MasterTableView>
            </telerik:RadGrid>
       

	<asp:SqlDataSource runat="server"></asp:SqlDataSource>
    
   



	 <asp:SqlDataSource ID="SqlUsers" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" 
            
            SelectCommand=""
            DeleteCommand="DELETE FROM customers  WHERE CustomerId = @CustomerId" 
            InsertCommand="INSERT INTO customers (CompanyId, Name, Address, City, State, Zip, Status) VALUES (@CompanyId, @Name, @Address, @City, @State, @Zip, 'Current')" 
            >
            <SelectParameters>
             
            </SelectParameters>
            <DeleteParameters>
               
            </DeleteParameters>
            <InsertParameters>
                
				
            </InsertParameters>
        </asp:SqlDataSource>

 </asp:Content>
       

