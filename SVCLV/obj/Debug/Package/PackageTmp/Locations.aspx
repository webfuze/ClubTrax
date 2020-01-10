<%@ Page Title="Tickets" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Locations.aspx.vb" Inherits="SVCLV.Locations" %>

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
   
       
       
        <telerik:RadGrid  ID="RadGrid1" runat="server"  OnItemDataBound="RadGrid1_ItemDataBound"
            AutoPostBackOnFilter="true" ShowStatusBar="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlLocations"  AutoGenerateColumns="False" GroupPanelPosition="Top">
                <GroupingSettings CaseSensitive="False" />
                <ExportSettings ExportOnlyData="True"></ExportSettings>
                <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true">
                   <KeyboardNavigationSettings AllowSubmitOnEnter="true"  EnableKeyboardShortcuts="true" />
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <SelectedItemStyle CssClass="SelectedItem"></SelectedItemStyle>
                <MasterTableView DataKeyNames="CompanyID" CommandItemDisplay="Top" DataSourceID="SqlLocations">










                    <CommandItemTemplate>
                        <div style="padding: 11px 11px;">
                            <asp:LinkButton   ID="lnkNewLocation" runat="server"  CommandName="NewLocation" ><i style="font-size: 20px;" class="fa fa-map-marker" aria-hidden="true"></i> New Location</asp:LinkButton>&nbsp;&nbsp;
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
						    <telerik:GridBoundColumn DataField="locationName"  HeaderStyle-HorizontalAlign="Left"  HeaderText="Location"
                            SortExpression="locationname" AutoPostBackOnFilter="true"  CurrentFilterFunction="Contains"
                            UniqueName="locationname">
                          
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                          
                        </telerik:GridBoundColumn>
                       
                           
                     


              



     <telerik:GridBoundColumn DataField="address"  HeaderStyle-HorizontalAlign="Left" 
                            FilterControlAltText="Filter Name column" HeaderText="Address" SortExpression="address" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                            UniqueName="address">
                          
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                          
                        </telerik:GridBoundColumn>






						   <telerik:GridBoundColumn DataField="city"  HeaderStyle-HorizontalAlign="Left" 
                            FilterControlAltText="Filter Name column" HeaderText="City" SortExpression="city" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                            UniqueName="city">
                          
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                          
                        </telerik:GridBoundColumn>

                     
                        <telerik:GridBoundColumn DataField="state" 
                            FilterControlAltText="Filter Description column" HeaderText="State" SortExpression="state" 
                            UniqueName="state"></telerik:GridBoundColumn>
                     
						 
                       
						  
					 
                       
                    </Columns>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" AlwaysVisible="true"/>
                </MasterTableView>
            </telerik:RadGrid>
       

	<asp:SqlDataSource runat="server"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlCompanies" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" 
            
            SelectCommand="SELECT * from companies"
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





      <asp:SqlDataSource ID="Sqlstatus" runat="server" ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" SelectCommand="SELECT status FROM Companies GROUP BY status  Order BY status "></asp:SqlDataSource>
     



	 <asp:SqlDataSource ID="SqlLocations" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cnWebClubTrax %>" 
            
            SelectCommand="SELECT customers.customerid,customers.status,companies.companyid,companies.name as companyname,customers.name as customername,locations.address,locations.city,locations.state,locations.name as locationname from Locations INNER JOIN Customers ON Customers.customerid=Locations.customerid INNER JOIN companies on  Companies.companyid=Locations.companyID"
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
       

