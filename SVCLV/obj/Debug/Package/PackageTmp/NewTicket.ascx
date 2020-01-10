<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="NewTicket.ascx.vb" Inherits="SVCLV.NewTicket" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
  <asp:RequiredFieldValidator runat="server" id="valProirityType" ControlToValidate="txtPriorityType"  ErrorMessage = "Please choose a Prioirity Type." Display="None" ValidationGroup="Save" SetFocusOnError="True" />
                <asp:RequiredFieldValidator runat="server" id="valTicketType" ControlToValidate="txtTicketType"  ErrorMessage = "Please choose a Ticket Type." Display="None" ValidationGroup="Save" SetFocusOnError="True" />
          <asp:RequiredFieldValidator runat="server" id="valDueDate" ControlToValidate="txtDueDate"  ErrorMessage = "Please choose a Due Date." Display="None" ValidationGroup="Save" SetFocusOnError="True" />
          <div id="ErrorMessages">
                 <asp:ValidationSummary runat="server"  ID="errForm" style="text-align:center; position: absolute; top: 660px; left: 212px;" HeaderText="The form could not be processed. Fix the following and try again." CssClass="Error" ValidationGroup="Save" ShowMessageBox="True" ShowSummary="False" />
                     </div>
		   
<table>
	<tr>      
                                <td align="left" colspan="2">
                                   
                                    <asp:linkButton ID="btnCancel" Text=" X " OnClick="btnCancel_Click" Font-Bold="true" BorderColor="black" BorderStyle="Inset" ForeColor="black" BackColor="gold" runat="server" CausesValidation="False"
                                        CommandName="Cancel"></asp:linkButton>
                                </td>
		<td>
			<asp:Label ID="mode" visible="false" ForeColor="Red" Font-Bold="true"  runat="server"></asp:Label>
			<telerik:RadTextBox visible="false" runat="server" ID="ticketid" Text='<%# Bind("ticketid") %>' MaxLength="50" />
			<telerik:RadTextBox visible="false" runat="server" ID="txtPriorityType" Text='<%# Bind("priorityname") %>'  MaxLength="50" />
			<telerik:RadTextBox visible="false" runat="server" ID="txtTicketType" Text='<%# Bind("typename") %>'  MaxLength="50" />
			

			<asp:Label ID="lblerror" ForeColor="Red" Font-Bold="true"  runat="server"></asp:Label>
		</td>

                            </tr>
</table>


 <telerik:RadTabStrip RenderMode="Lightweight"  runat="server" ID="RadTabStrip1"  MultiPageID="RadMultiPage1" SelectedIndex="2" Skin="Simple" Height="34px" Width="1303px">
            <Tabs>
                <telerik:RadTab  Text="Step 1" Width="200px" Selected="true"></telerik:RadTab>
                <telerik:RadTab Text="Step 2" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="Step 3" Width="200px" ></telerik:RadTab>
				 <telerik:RadTab Text="Step 4" Width="200px" ></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

  <telerik:RadMultiPage runat="server" ID="RadMultiPage1"  SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="PageView1">




 <table id="Table2" cellspacing="" cellpadding="" width="100%" height="100%" background="black"  align="center"  border="0" rules="none"
                            style="border-collapse: collapse;">


							
							<tr>
                                <td align="left" >
                                  <br /><br /><br /><br />
                                </td>
								
                            </tr>


                            <tr class="EditFormHeader">
                                <td colspan="8">
                                    <b><font color="gold">*Priority Level (Pick One)</b>
                                </td>
                            </tr>
							 <tr>
                                            <td>
                                         <asp:button Class="CTNewTicket"  OnClick="btn_Click1"  ID="btnLow" runat="server" Text="Low"></asp:button>
												 
                                            </td>
								  <td>
                                         <asp:button  Class="CTNewTicket"   ID="btnMedium"  OnClick="btn_Click1" runat="server" Text="Medium"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket"   ID="btnHigh"  OnClick="btn_Click1" runat="server" Text="High"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket"   ID="btnUrgent"  OnClick="btn_Click1" runat="server" Text="Urgent"></asp:button>
                                            </td>
                              </tr>
							<tr>
                                <td align="left" colspan="2">
                                  <br /><br /><br />
                                </td>
                            </tr>
							<tr class="EditFormHeader">
                                <td colspan="8">
                                    <b><font color="gold">*Ticket Type (Pick One)</font></b>
                                </td>
                            </tr>
							 <tr>
                                            <td>
                                         <asp:button Class="CTNewTicket"   ID="btnSystemError" OnClick="btnSystemError_Click"  runat="server" Text="System Error"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket"   ID="btnPriceChanges" OnClick="btnPriceChanges_Click" runat="server" Text="Price Changes"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket"   ID="btnPriceTimerRequest" OnClick="btnPriceTimerRequest_Click" runat="server" Text="Price Timer Request"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket"   ID="btnNewMenuItem" OnClick="btnNewMenuItem_Click" runat="server" Text="New Menu Item"></asp:button>
                                            </td>
                              </tr>
							<tr>
                                            <td>
												<br /><br />
												</td>
								</tr>

							<tr>
                                            <td>
                                         <asp:button Class="CTNewTicket"   ID="btnNewHWRequest" runat="server" OnClick="btnNewHWRequest_Click" Text="New HW Request"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket"   ID="btnSystemMaintenance" runat="server" OnClick="btnSystemMaintenance_Click" Text="System Maintenance"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket"   ID="btnSystemErro2" runat="server" OnClick="btnSystemErro2_Click" Text="System Error2"></asp:button>
                                            </td>
								  <td>
                                         <asp:button Class="CTNewTicket"   ID="btnSystemUpdate" runat="server" OnClick="btnSystemUpdate_Click" Text="System Update"></asp:button>
                                            </td>
                              </tr>
							<tr>
                                            <td colspan="8">
												<br />
												<asp:Label runat="server" Font-Size="Large" ForeColor="red" ID="lblPriorityType"  Font-Bold="true"></asp:Label>
												<br /><br /><br />
												</td>
								</tr>
								 <tr>
                                            <td colspan="8">
												<br />
												<asp:Label runat="server" Font-Size="Large" ForeColor="red" ID="lblTicketType"  Font-Bold="true"></asp:Label>
												<br /><br /><br />
												</td>
								</tr>
							<tr>
                                            <td align="right">
                                        <font color="gold"> *Due Date:</font>
                                            </td>
								  <td colspan="2">
                                           <asp:TextBox ID="txtDueDate" AutoPostBack="true"  OnTextChanged="txtDueDate_TextChanged" runat="server" Height="40" Width="180" Font-Size="Large"  TextMode="Date" />
                                            </td>
								 
								  <td>
                                         <asp:button Class="CTNewTicketCont"    ID="btnContinue" OnClick="btnContinue_Click1" runat="server" Text="Continue >>"></asp:button>
                                            </td>
                              </tr>
                          
										
                                      
						 </table>

				 </telerik:RadPageView>
	   <telerik:RadPageView runat="server" ID="PageView2">
<asp:Table runat="server" ID="step2table" width="80%" height="100%" CellPadding="5" CellSpacing="5">

	<asp:TableRow>
																			   <asp:TableCell HorizontalAlign="Right">
																					  <asp:Label ID="Label6" runat="server" ForeColor="Gold" Text="*Subject: "></asp:Label>
																			   </asp:TableCell>
																				<asp:TableCell>
																				 <asp:TextBox runat="server" ID="subject"  Width="300"  ></asp:TextBox>
																			   </asp:TableCell>
																		   </asp:TableRow>
																			<asp:TableRow>
																				<asp:TableCell>
																					<br /><br />
																				</asp:TableCell>
																			</asp:TableRow>
																			 <asp:TableRow>
																			   <asp:TableCell HorizontalAlign="Right">
																					  <asp:Label ID="Label1" runat="server" ForeColor="Gold" Text="*Description: "></asp:Label>
																			   </asp:TableCell>
																				<asp:TableCell>
																				 <asp:TextBox runat="server" ID="description"  TextMode="MultiLine"  Rows="3" Columns="40"></asp:TextBox>
																			   </asp:TableCell>
																		   </asp:TableRow>

																<asp:TableRow>
																				<asp:TableCell>
																					<br /><br />
																				</asp:TableCell>
																			</asp:TableRow>
																		
															   	 <asp:TableRow ID="RowClarify">
																			   <asp:TableCell HorizontalAlign="Right" >
																					  <asp:Label ID="Label4" runat="server" ForeColor="Gold" Text="Clarify: "></asp:Label>
																			   </asp:TableCell>
																				<asp:TableCell ColumnSpan="4">
																				 <asp:TextBox runat="server" ID="Clarify" Width="600" ></asp:TextBox>
																			   </asp:TableCell>
																		   </asp:TableRow>


															   	 <asp:TableRow ID="RowClarifyReply" >
																			   <asp:TableCell HorizontalAlign="Right" >
																					  <asp:Label ID="Label10"  runat="server" ForeColor="Gold" Text="Thread: "></asp:Label>
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
																									<asp:Label ID="Label11" runat="server" ForeColor="gold" Font-Size="Smaller" Text='<%# Eval("fullname") %>' />
																								</td>
																								<td> 
																									<asp:Label ID="lbltext" runat="server" ForeColor="gold"   Font-Size="Smaller" Text='<%# Eval("text") %>' />
																								</td>
																								<td>
																									<asp:Label ID="lbldate" runat="server" ForeColor="gold"  Font-Size="Smaller" Text='<%# Eval("datecreated") %>' />
																								</td>
																								
																							</tr>
																						</ItemTemplate>
																						<FooterTemplate>
																							</table>
																						</FooterTemplate>
																					</asp:Repeater>

																			   </asp:TableCell>
																		   </asp:TableRow>
	<asp:TableRow>
		<asp:TableCell ColumnSpan="6" HorizontalAlign="Right"  >
			<asp:button Class="CTNewTicketCont"   ID="btnContinue2"  OnClick="btnContinue2_Click" runat="server" Text="Continue >>"></asp:button>
		</asp:TableCell>
	</asp:TableRow>

</asp:Table>
		
		  
		   </telerik:RadPageView>


	   <telerik:RadPageView runat="server" ID="PageView3">
		   <asp:Table runat="server" CellPadding="15" CellSpacing="15"  width="80%" height="100%"  >

		  


															<asp:TableRow runat="server">
															<asp:TableCell Width="200">&nbsp;
																	<br /><br />
																</asp:TableCell>
																<asp:TableCell>&nbsp;
																	<br /><br />
																</asp:TableCell>
																<asp:TableCell>&nbsp;
																	<br /><br />
																</asp:TableCell>


																<asp:TableCell runat="server">
															
																	
																	<telerik:RadListBox    AllowTransferOnDoubleClick="true"  AllowReorder="false" ID="availablelocations" runat="server" AllowTransfer="true" 

																	  SelectionMode="Multiple"

																	TransferToID="selectedlocations" Height="400px"  Width="305px" >

																	<buttonsettings  showtransferall="true" verticalalign="Middle" ></buttonsettings>

																</telerik:RadListBox>
            
                   
															<telerik:RadListBox AllowTransferOnDoubleClick="true"    ID="selectedlocations" runat="server"     TransferToID="availablelocations" Height="400px"  Width="305px"  SelectionMode="Multiple"    >

																	<buttonsettings  ReorderButtons="All" ShowReorder="true"  showtransferall="true" verticalalign="Middle"></buttonsettings>
																</telerik:RadListBox>
																	



																</asp:TableCell>
																

															</asp:TableRow>


														<asp:TableRow>
		<asp:TableCell ColumnSpan="10" HorizontalAlign="Right"  >
			 <asp:button Class="CTNewTicketCont"   ID="btnContinue3"   OnClick="btnContinue3_Click" runat="server" Text="Continue >>"></asp:button>
		</asp:TableCell>
	</asp:TableRow>



					
														   </asp:Table>
																

		   </telerik:RadPageView>

	   <telerik:RadPageView runat="server" ID="PageView4">
		  

				
		   <asp:Table runat="server" ID="Table1" width="80%" height="100%" BorderWidth="3" CellPadding="5" CellSpacing="5" BorderColor="Gold" BorderStyle="Dashed">

		    <asp:TableRow runat="server" BorderColor="gold">
																				<asp:TableCell runat="server" HorizontalAlign="Right">
																					<asp:Label ID="Label5" ForeColor="gold" runat="server" Text="Attachment(s):  "></asp:Label>
																				<br /><br />
																				</asp:TableCell>
																				<asp:TableCell runat="server">
																					<asp:FileUpload ID="AttachFile" ForeColor="Gold" runat="server" AllowMultiple="True" />
																					<br /><br />
																				</asp:TableCell>
																			</asp:TableRow>
			      <asp:TableRow runat="server" BorderColor="gold">
																				<asp:TableCell runat="server" HorizontalAlign="Right">
																					<asp:Label ID="Label2" ForeColor="gold" runat="server" Text="Email:  "></asp:Label>
																				</asp:TableCell>
																				<asp:TableCell runat="server">
																					<asp:textbox ID="email1" runat="server"  TextMode="Email"  />   <asp:imagebutton OnClick="addemailimg1_Click" ID="addemailimg1" Width="20" ImageUrl="./images/addemail.png" runat="server" />
																				</asp:TableCell>
																			</asp:TableRow>
			   <asp:TableRow runat="server" Visible="false" ID="emailrow2" BorderColor="gold">
																				<asp:TableCell runat="server" HorizontalAlign="Right">
																					<asp:Label ID="emaillbl2" ForeColor="gold" runat="server" Text="Email:  "></asp:Label>
																				</asp:TableCell>
																				<asp:TableCell runat="server">
																					<asp:textbox ID="email2" runat="server"  TextMode="Email"  /><asp:Imagebutton ID="addemailimg2" OnClick="addemailimg2_Click"  Width="20" ImageUrl="./images/addemail.png" runat="server" />
																				</asp:TableCell>
																			</asp:TableRow>
			   <asp:TableRow runat="server" Visible="false" ID="emailrow3" BorderColor="gold">
																				<asp:TableCell runat="server" HorizontalAlign="Right">
																					<asp:Label ID="emaillbl3" ForeColor="gold" runat="server" Text="Email:  "></asp:Label>
																				</asp:TableCell>
																				<asp:TableCell runat="server">
																					<asp:textbox ID="email3" runat="server"  TextMode="Email"  /><asp:Imagebutton ID="addemailimg3" OnClick="addemailimg3_Click" Width="20" ImageUrl="./images/addemail.png" runat="server" />
																				</asp:TableCell>
																			</asp:TableRow>
			   <asp:TableRow runat="server" Visible="false" ID="emailrow4" BorderColor="gold">
																				<asp:TableCell runat="server" HorizontalAlign="Right">
																					<asp:Label ID="emaillbl4" ForeColor="gold" runat="server" Text="Email:  "></asp:Label>
																				</asp:TableCell>
																				<asp:TableCell runat="server">
																					<asp:textbox ID="email4" runat="server"  TextMode="Email"  />
																				</asp:TableCell>
																			</asp:TableRow>
			  

		    <asp:TableRow runat="server">
				<asp:TableCell ColumnSpan="6" HorizontalAlign="Right"  >
					  <asp:button Class="CTNewTicketCont"   ID="btnContinue4"  OnClick="btnContinue4_Click" runat="server" Text="Continue >>"></asp:button>
					</asp:TableCell>
	</asp:TableRow>

			   </asp:Table>
		      
		   </telerik:RadPageView>

	  </telerik:RadMultiPage>

