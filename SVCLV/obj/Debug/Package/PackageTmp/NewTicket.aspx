<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="NewTicket.aspx.vb" Inherits="SVCLV.NewTicket1" %>

<!DOCTYPE html>
<table id="Table2" cellspacing="" cellpadding="" width="100%" height="100%" background="black"  align="center"  border="1" rules="none"
                            style="border-collapse: collapse;">


							
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
                                         <asp:Button Class="CTNewTicket"    OnClick="btnLow_Click" ID="btnLow" runat="server" Text="Low"></asp:Button>
                                            </td>
								  <td>
                                         <asp:Button  Class="CTNewTicket" ID="btnMedium" OnClick="btnMedium_Click" runat="server" Text="Medium"></asp:Button>
                                            </td>
								  <td>
                                         <asp:Button Class="CTNewTicket" ID="btnHigh" OnClick="btnHigh_Click" runat="server" Text="High"></asp:Button>
                                            </td>
								  <td>
                                         <asp:Button Class="CTNewTicket" ID="btnUrgent" OnClick="btnUrgent_Click" runat="server" Text="Urgent"></asp:Button>
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