<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/masternew.Master" CodeBehind="LeaveApproval.aspx.cs" Inherits="ElixirCSharp.BackOfficeManagement.LeaveApproval" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="inner" style="padding-top:20px;" >
           <div class="row">
          
      </div>
           <div class="row">
                <div class="col-lg-12">
                    <asp:ScriptManager ID="ScriptManager1" runat="server" />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                      <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="grdLeavAppln" EventName="PageIndexChanging" />
                            <asp:AsyncPostBackTrigger ControlID="grdLeavAppln" EventName="RowCommand" />
                          </Triggers>
                   <ContentTemplate>

                       <div class="col-lg-12">
                           <asp:Panel ID="pnl_error" runat="server" CssClass="panel panel-danger">
                               <div class="panel-heading">
                                   <asp:Label ID="lbl_validerror" runat="server" CssClass="alert-danger"></asp:Label>
                               </div>
                           </asp:Panel>
                       </div>

                         <div class="col-lg-12">
                            <div class="panel-body ">
                                <div class="table-responsive">
                                     <asp:GridView ID="grdLeavAppln" runat="server"
                                    Width="100%" HorizontalAlign="Center"
                   
                                    AutoGenerateColumns="false" AllowPaging="true"
                                    DataKeyNames="appl_id" 
                                    CssClass="table table-striped" PageSize="50" GridLines="none" EmptyDataText="No Leave Requests" OnRowCommand="grdLeavAppln_RowCommand" OnRowCreated="grdLeavAppln_RowCreated" >
                                             <Columns>
                                                    <asp:BoundField DataField="appl_id" HeaderText="Id" Visible="false"/>
                                                    <asp:BoundField DataField="staff_leave" HeaderText="Id" Visible="false"/>
                                                    <asp:BoundField DataField="appl_no" HeaderText="Application No" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2"/>
                                                    <asp:BoundField DataField="appl_date" HeaderText="Application Date" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" dataformatstring="{0:d}" />
                                                    <asp:BoundField DataField="staff_id" HeaderText="Staff ID" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2"/>
                                                   <asp:BoundField DataField="applicant_code" HeaderText="code"  />
                                                    <asp:BoundField DataField="applicant_name" HeaderText="Name" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" />
                                                    <asp:BoundField DataField="approv_status" HeaderText="Status" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" />
                                                   <%-- <asp:BoundField DataField="desig_code" HeaderText="Id" Visible="false"/>--%>
                                                    <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="col-lg-2">
                                    <ItemTemplate>
                                        <div class="btn-group pull-left">
                                            <button class="btn btn-default dropdown-toggle" type="button" id="ddlAction" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                <span class="icon-list" aria-hidden="true"></span>
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu slidedown" aria-labelledby="ddlAction">

                                                  <li >
                                                      <asp:LinkButton ID="hplViewDetail" CssClass=" " CommandName="viewDetail" CommandArgument='<%# Eval("appl_id")%>'  runat="server" ><span aria-hidden="true" class="icon-eye-open"></span>&nbsp;View</asp:LinkButton>
                                                 </li>
                                       
                                       
                                                    <li >
                                                        <asp:LinkButton ID="hplApproveDetail" CssClass=" " CommandName="approveDetail" CommandArgument='<%# Eval("appl_id")%>'  runat="server" ><span aria-hidden="true" class="icon-check"></span>&nbsp;Approve</asp:LinkButton>
                                                    </li>
                                       
                                            </ul>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                            </Columns>
                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="10"
                                FirstPageText="Previous"
                                LastPageText="Next"
                                Position="bottom" />
                            <PagerStyle CssClass="grid-pagination text-right "/>
                        </asp:GridView>
                                </div>
                            </div> 
                        </div>

                   </ContentTemplate> 
                </asp:UpdatePanel> 

                    <!-- MODAL POPUP -->
                   <div class="col-lg-12">
                        <div id="CurrentLeaveDetails" class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="width:50%; important;">
                            <div class="modal-content">
                                 <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                    <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-title"><h2>Leave Application</h2></div>
                                    </div>                                   

                                    <div class="modal-body">                           
                                        <div class="row">
                                            <div class="col-lg-12">

                                                <div class="panel panel-success">
                                                     <div class="panel-heading">Application Details</div>
                                                     <div class="panel-body">
                                                         <div class="form-group row">
                                                            <label class="col-lg-4 text-right">Application No</label>
                                                            <div class="col-lg-8">
                                                                    <b><asp:Label ID="lbl_vapplNo" runat="server"></asp:Label></b>
                                                            </div>
                                                          </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-4 text-right">Application Date</label>
                                                            <div class="col-lg-8">
                                                                <b><asp:Label ID="lbl_vApplDate" runat="server"></asp:Label></b>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-4 text-right">Employee ID</label>
                                                            <div class="col-lg-8">
                                                                <b><asp:Label ID="lbl_vemplID" runat="server" Text=""></asp:Label></b>
                                                            </div>
                                                         </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-4 text-right">Employee Name</label>
                                                            <div class="col-lg-8">
                                                                <b><asp:Label ID="lbl_vempName" runat="server" Text=""></asp:Label></b>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-4 text-right">Department</label>
                                                            <div class="col-lg-8">
                                                                <b><asp:Label ID="lbl_vDept" runat="server" Text=""></asp:Label></b>
                                                            </div>
                                                         </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-4 text-right">Designation</label>
                                                            <div class="col-lg-8">
                                                                  <b><asp:Label ID="lbl_vDesig" runat="server" Text=""></asp:Label></b>
                                                            </div>
                                                        </div>
                                                     </div> 
                                                </div> 

                                                <div class="panel panel-info">
                                                    <div class="panel-heading">Leave Details</div>
                                                     <div class="panel-body">
                                                         <div class="form-group row">
                                                                    <label class="col-lg-4 text-right">Leave Type</label>
                                                                    <div class="col-lg-8">
                                                                        <b><asp:Label ID="lbl_vLeavType" runat="server" Text=""></asp:Label></b>
                                                                    </div>                                                                  
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-lg-4 text-right">Leave Start Date</label>
                                                                    <div class="col-lg-8">
                                                                        <b><asp:Label ID="lbl_vstartDate" runat="server" Text=""></asp:Label></b>
                                                                    </div>
                                                                   
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-lg-4 text-right">Leave end Date</label>
                                                                    <div class="col-lg-8">
                                                                       <b><asp:Label ID="lbl_vEnddate" runat="server" Text=""></asp:Label></b>
                                                                    </div>
                                                                   
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-lg-4 text-right">No of Days</label>
                                                                    <div class="col-lg-8">
                                                                        <b><asp:Label ID="lbl_vNoOfDays" runat="server" Text=""></asp:Label></b> 
                                                                    </div>                                                                   
                                                                </div>

                                                          <asp:Panel ID="pnl_status" runat="server">
                                                         <div class="form-group row">
                                                            <label class="col-lg-4 text-right">Status</label>
                                                            <div class="col-lg-8">
                                                                 <b><asp:Label ID="lbl_vstatus" runat="server" Text=""></asp:Label></b>
                                                            </div>                                                                   
                                                        </div>
                                                              </asp:Panel>

                                                     </div> 
                                                </div> 

                                                 <asp:Panel ID="pnl_approvaldetalis" runat="server">

                                                <div class="panel panel-danger">
                                                    <div class="panel-heading">Approval Details</div>
                                                     <div class="panel-body">
                                                         <asp:HiddenField ID="hf_staffleave" runat="server" />  
                                                        <asp:HiddenField ID="hf_applID" runat="server" /> 
                                                       <asp:HiddenField ID="hf_attendDate" runat="server" /> 
                                                         <div class="form-group row">
                                                                    <label class="col-lg-4 text-right">Comment</label>
                                                                    <div class="col-lg-8">
                                                                        <asp:TextBox ID="txt_commnt" runat="server" CssClass="form-control" TabIndex="1"></asp:TextBox>
                                                                    </div>                                                                   
                                                                </div>

                                                                <div class="form-group row">
                                                                     <div class="col-lg-3"></div> 
                                                                    <div class="col-lg-9">
                                                                         <asp:RadioButtonList ID="rb_approv" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" Height="18px" Width="300px" TabIndex="2">
                                                                            <asp:ListItem Text="Approve" Value="A" ></asp:ListItem>
                                                                            <asp:ListItem Text="On hold" Value="H"></asp:ListItem>
                                                                            <asp:ListItem Text="Reject" Value="R"></asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </div>
                                                                   
                                                                </div>

                                                                <asp:Panel ID="pnl_edit" runat="server">
                                                                        <div class="row">
                                                                            <div class="form-group">
                                                                                    <label class="col-lg-4 text-right">Reason to Edit<label class="alert-danger">*</label></label>
                                                                                    <div class="col-lg-8">
                                                                                        <asp:TextBox ID="txt_EditReason" runat="server" CssClass="form-control" TabIndex="3" />                                                   
                                                                                     </div>
                                                                                </div>
                                                                        </div>
                                                                </asp:Panel>

                                                         <div class="row">
                                                            <div class="form-group">
                                                                <label class="col-lg-2 text-right"></label>
                                                                <div class="col-lg-4">
                                                                    <asp:Label ID="lbl_error" class="label alert-danger" runat="server" Text=""></asp:Label> 
                                                                </div>
                                                            </div>
                                                           </div> 

                                                     </div>
                                                     
                                                </div> 
                                                     </asp:Panel>


                                            </div>
                                        </div>
                                    </div>
                                  
                                    <div class="modal-footer">
                                        <asp:HiddenField ID="hf_onhold" runat="server" /> 
                                        <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" OnClientClick="return ValidateForm();"  TabIndex="4" >   <%--  data-toggle="modal" data-target="#newBranchDetail"--%>
                                     <span aria-hidden="true" class="icon-save"></span>&nbsp;Save
                               </asp:LinkButton>
                                        
                                        <button type="button" class="btn btn-default" data-dismiss="modal" tabindex="5"><span aria-hidden="true" class=" icon-remove ">Cancel</button>

                                    </div>

                                         </ContentTemplate> 
                                    </asp:UpdatePanel>
                            </div>
                        </div>
                        </div>
                    </div>
                <!-- /MODAL POPUP -->

                  


                </div> 
           </div> 

             

            <script type="text/javascript">

                function showCurrentLeaveDetails() {

                    $('#CurrentLeaveDetails').modal('show');
                }

                function closeCurrentLeaveDetails() {

                    $('#CurrentLeaveDetails').modal('hide');
                }


                function resetLeaveApproval() {

                    document.getElementById("<%=txt_commnt.ClientID%>").innerHTML = "";

                    document.getElementById("<%=lbl_error.ClientID%>").innerHTML = "";

                }

                function cancelLeaveApproval() {
                    resetLeaveApproval()
                    closeCurrentLeaveDetails()
                }


                function ValidateForm() {

                    document.getElementById("<%=txt_commnt.ClientID%>").value = "";
                    var error_lbl = document.getElementById("<%=lbl_error.ClientID%>");

                    error_lbl.innerHTML = "";

                    var str;

                    var cmnt = document.getElementById("<%=txt_commnt.ClientID%>");
                     var action = document.getElementById("<%=hf_onhold.ClientID%>").value;
                    var editReason = document.getElementById("<%=txt_EditReason.ClientID%>");

                    var required = true;
                    var req_msg = '';

                    var valid_flg = true;
                    var err_msg = '';


                    if (cmnt.value != '') {

                        if (cmnt.value.length > 200) {
                            err_msg += " Comment should not exceed 200 charecters <br/>";
                            valid_flg = false;
                        }

                    }


                    if (action == 'H') {
                        if (editReason.value == '') {
                            if (req_msg == '') {
                                req_msg = 'Reason to Edit';
                            }
                            else {
                                req_msg += ', ' + 'Reason to Edit';
                            }
                            required = false;
                        }
                        else if (editReason.value.length > 100) {
                            err_msg += 'Reason to Edit should not exceed 100 characters <br/>';
                            valid_flg = false;
                        }
                    }


                    if (required == false) {
                        error_lbl.innerHTML = "The following field(s) are required : <br/>";
                        error_lbl.innerHTML += req_msg;
                    }

                    if (valid_flg == false) {
                        error_lbl.innerHTML += '<br/>' + err_msg;
                    }

                    if (required == false || valid_flg == false) {

                        return false;
                    }




                }

        </script>

       </div> 
</asp:Content>