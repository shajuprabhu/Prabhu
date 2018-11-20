<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/masternew.Master" CodeBehind="LeaveRequest.aspx.cs" Inherits="ElixirCSharp.BackOfficeManagement.LeaveRequest" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="inner" style="padding-top:20px;" >
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

                       <div class="well">
                            <div class="col-md-3">
                                <asp:Panel ID="pnl_add" runat="server">
                                   <asp:LinkButton ID="btnAddLeavAppl" runat="server" CssClass="btn btn-success"  Width="100%" OnClick="btnAddLeavAppl_Click"> 
                                            <span aria-hidden="true" class="icon-plus"></span>&nbsp;New Leave Application
                                    </asp:LinkButton>
                                </asp:Panel>
                            </div>
                     
                            <%--<div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox ID="txtSearchLeavAppl" runat="server" Width="300px" CssClass="form-control" placeholder="Enter Staff Name" />
                                    <span class="input-group-btn">
                                        <asp:Button ID="btnSearchLeavAppl" runat="server" CssClass="btn btn-default" Text="Search"></asp:Button>
                                    </span>
                                </div>
                            </div>--%>

                            <div class="clearfix"></div>
                        </div>

                        <div class="col-lg-12">
                            <div class="panel-body ">
                                <div class="table-responsive">
                                     <asp:GridView ID="grdLeavAppln" runat="server" Width="100%" HorizontalAlign="Center" AutoGenerateColumns="false" 
                                         AllowPaging="true" DataKeyNames="appl_id" CssClass="table table-striped" PageSize="50" GridLines="none" OnRowCommand ="grdLeavAppln_RowCommand" OnRowCreated="grdLeavAppln_RowCreated" >
                                             <Columns>
                                                    <asp:BoundField DataField="appl_id" HeaderText="Id" Visible="false"/>
                                                    <asp:BoundField DataField="staff_leave" HeaderText="Id" Visible="false"/>
                                                 <asp:BoundField DataField="appl_date" HeaderText="Application Date" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" dataformatstring="{0:d}" />
                                                    <asp:BoundField DataField="appl_no" HeaderText="Application No" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2"/>
                                                    <asp:BoundField DataField="staff_id" HeaderText="Staff ID" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2"/>
                                                   <asp:BoundField DataField="applicant_code" HeaderText="code"  />
                                                    <asp:BoundField DataField="applicant_name" HeaderText="Name" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" />
                                                    <asp:BoundField DataField="approv_status" HeaderText="Status" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" />
                        
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
                                        
                                                                        <li>
                                                                        <asp:LinkButton ID="hplEdit" CssClass="grid-action-btn" CommandName="editDetail" CommandArgument='<%# Eval("appl_id")%>' runat="server"><span aria-hidden="true" class="icon-edit"></span>&nbsp;Edit</asp:LinkButton>
                                                                        </li>
                                       
                                                                        <li >
                                                                        <asp:LinkButton ID="hplDelete" CssClass="grid-action-btn" CommandName="deleteDetail" CommandArgument='<%# Eval("appl_id")%>' runat="server"><span aria-hidden="true" class="icon-remove"></span>&nbsp;Delete</asp:LinkButton>
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
                        <div id="newLeaveDetails" class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false" >
                        <div class="modal-dialog" style="width:50%; important;">
                            <div class="modal-content">
                                 
                                    <div class="modal-header">

                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-title"><h2>Leave Application</h2></div>
                                    </div>
                                   


                                    <div class="modal-body">                           
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <div class="panel panel-success">
                                                     <div class="panel-heading">Applicant Details</div>
                                                     <div class="panel-body">
                                                          <div class="form-group row">
                                                                <label class="col-lg-4 text-right">Application No</label>
                                                                <div class="col-lg-5">
                                                                        <b><asp:Label ID="lbl_applnno" runat="server"></asp:Label></b> 
                                                                </div>
                                                          </div> 
                                                            <div class="form-group row">
                                                                <label class="col-lg-4 text-right">Application Date</label>
                                                                <div class="col-lg-5">
                                                                     <b><asp:Label ID="lbl_applndat" runat="server"></asp:Label></b>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-lg-4 text-right">Employee ID</label>
                                                                <div class="col-lg-5">
                                                                     <b><asp:Label ID="lbl_empid" runat="server" Text=""></asp:Label></b>
                                                                </div>
                                                            </div> 
                                                            <div class="form-group row">
                                                                <label class="col-lg-4 text-right">Employee Name</label>
                                                                <div class="col-lg-5">
                                                                     <b><asp:Label ID="lbl_employname" runat="server" Text=""></asp:Label></b>
                                                                </div>
                                                            </div>
                                                              <div class="form-group row">
                                                                <label class="col-lg-4 text-right">Department</label>
                                                                <div class="col-lg-5">
                                                                     <b><asp:Label ID="lbl_deptname" runat="server" Text=""></asp:Label></b>
                                                                </div>
                                                            </div> 
                                                            <div class="form-group row">
                                                                <label class="col-lg-4 text-right">Designation</label>
                                                                <div class="col-lg-5">
                                                                     <b><asp:Label ID="lbl_designame" runat="server" Text=""></asp:Label></b>
                                                                </div>
                                                            </div>
                                                     </div> 
                                                 </div> 
                                                </ContentTemplate> 
                                                </asp:UpdatePanel>
                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                <ContentTemplate>
                                                    <div class="panel panel-info">                                                   
                                                    <div class="panel-heading">
                                                        <div class="row">
                                                            <div class="col-lg-10">Leave Details</div>
                                                            <div class="col-lg-2">
                                                                
                                                            </div>
                                                        </div> 
                                                                  

                                                    </div>
                                                     <div class="panel-body">
                                                         <asp:HiddenField ID="hf_staffcode" runat="server" />                                                                                                                                                             
                                                   <asp:HiddenField ID="hf_staffleave" runat="server" />
                                                   <asp:HiddenField ID="hf_applID" runat="server" /> 
                                                          <div class="form-group row">
                                                                    <label class="col-lg-4 text-right">Leave Type<label class="alert-danger">*</label></label>
                                                                    <div class="col-lg-8">
                                                                        <asp:DropDownList ID="combo_leavetyp" class="form-control" runat="server" CssClass="form-control"></asp:DropDownList>
                                                                    </div>
                                                                  
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-lg-4 text-right">Leave Start Date<label class="alert-danger">*</label></label>
                                                                    <div class="col-lg-8">
                                                                        <asp:TextBox ID="txt_startdat" runat="server" class="form-control" MaxLength="15" CssClass="form-control" onchange ="CalculateDifference()"></asp:TextBox>
                                                                    </div>
                                                                   
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-lg-4 text-right">Leave end Date<label class="alert-danger">*</label></label>
                                                                    <div class="col-lg-8">
                                                                       <asp:TextBox ID="txt_enddate" runat="server" class="form-control" MaxLength="15" CssClass="form-control" onchange ="CalculateDifference()"></asp:TextBox>
                                                                    </div>
                                                                   
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-lg-4 text-right">No of Days<label class="alert-danger">*</label></label>
                                                                    <div class="col-lg-8">
                                                                        <asp:TextBox ID="txt_noofdays" runat="server" class="form-control" CssClass="form-control"></asp:TextBox>
                                                                    </div>
                                                                   
                                                                </div>
                                                                
                                                                <asp:Panel ID="pnl_halfFull" runat="server">
                                                                 <div class="form-group row">
                                                                     <div class="col-lg-4"></div> 
                                                                    <div class="col-lg-6">
                                                                         <asp:RadioButtonList ID="rb_halffull" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" Height="18px" Width="184px" OnSelectedIndexChanged="rb_halffull_SelectedIndexChanged">
                                                                            <asp:ListItem Text="Full Day" Value="F"></asp:ListItem>
                                                                            <asp:ListItem Text="Half Day" Value="H"></asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </div>
                                                                   
                                                                </div>
                                                                </asp:Panel>
                                                   
                                                                 <asp:Panel ID="pnl_forAfter" runat="server">
                                                                 <div class="form-group row">
                                                                     <div class="col-lg-4"></div> 
                                                                    <div class="col-lg-6 ">
                                                                         <asp:RadioButtonList ID="rb_forafter" runat="server" RepeatDirection="Horizontal" Height="18px" Width="184px">
                                                                            <asp:ListItem Text="Fore noon" Value="F"></asp:ListItem>
                                                                            <asp:ListItem Text="After noon" Value="A"></asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </div>
                                                                   
                                                                </div>
                                                                </asp:Panel> 

                                                                 <asp:Panel ID="pnl_edit" runat="server">
                                                                        <div class="row">
                                                                            <div class="form-group">
                                                                                    <label class="col-lg-4 text-right">Reason to Edit<label class="alert-danger">*</label></label>
                                                                                    <div class="col-lg-8">
                                                                                        <asp:TextBox ID="txt_EditReason" runat="server" CssClass="form-control" />                                                   
                                                                                     </div>
                                                                                </div>
                                                                        </div>
                                                                </asp:Panel>


                                                         <div class="row">
                                                            <div class="form-group">
                                                                <label class="col-lg-2 text-right"></label>
                                                                <div class="col-lg-4">
                                                                    <asp:Label ID="lbl_errorr" class="label alert-danger" runat="server" Text=""></asp:Label> 
                                                                </div>
                                                            </div>
                                                           </div> 
                                                         
                                                     </div> 
                                                </div> 
                                                </ContentTemplate> 
                                                </asp:UpdatePanel>
            
                                            </div>
                                        </div>
                                    </div>


                                  
                                    <div class="modal-footer">
                                               <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <ContentTemplate> 
                                        
                                       <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" OnClientClick="return ValidateForm();"  >   <%--  data-toggle="modal" data-target="#newBranchDetail"--%>
                                                 <span aria-hidden="true" class="icon-save"></span>&nbsp;Save
                                            </asp:LinkButton>
                                                                 
                                    <asp:HiddenField ID="hf_action" runat="server" />                                   
                                    <button type="button" class="btn btn-default" data-dismiss="modal"><span aria-hidden="true" class=" icon-remove ">Cancel</button>
                                        </ContentTemplate> 
                                    </asp:UpdatePanel>
                                    </div>

                                         
                            </div>
                        </div>
                        </div>
                    </div>
                <!-- /MODAL POPUP -->

                    <!-- MODAL POPUP -->
                   <div class="col-lg-12">
                        <div id="CurrentLeaveDetails" class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  data-backdrop="static" data-keyboard="false">
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
                                                        <div class="form-group row">
                                                            <label class="col-lg-4 text-right">Status</label>
                                                            <div class="col-lg-8">
                                                                 <b><asp:Label ID="lbl_vstatus" runat="server" Text=""></asp:Label></b>
                                                            </div>                                                                   
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-4 text-right">Comment</label>
                                                            <div class="col-lg-8">
                                                                 <b><asp:Label ID="lbl_comment" runat="server" Text=""></asp:Label></b>
                                                            </div>                                                                   
                                                        </div>
                                                   

                                              
                                            </div>
                                        </div>
                                    </div>


                                  
                                    <div class="modal-footer">                                                                  
                                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="cancelEvent()"><span aria-hidden="true" class="icon-ok">OK</button>
                                    </div>

                                         </ContentTemplate> 
                                    </asp:UpdatePanel>
                            </div>
                        </div>
                        </div>
                    </div>
                <!-- /MODAL POPUP -->

                  <div id="deleteStaffLeaveDetail" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel"  data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <div class="modal-title">Delete Leave Application</div>
                            </div>

                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        
                                <ContentTemplate>

                                    <div class="modal-body">
                                        <asp:HiddenField ID="hfDelLeavApplID" runat="server" />
                                        <div class="form-horizontal">           
                                            <div class="form-group">
                                                <label for="txtetails" class="control-label col-xs-4">Reason to delete<label class="alert-danger">*</label></label>
                                                <div class="col-xs-7">
                                                    <asp:TextBox runat="server" Columns="5" Rows="5" TextMode="multiline" ID="txtReasonToDelete" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                                            <div class="form-group">
                                                                <label class="col-lg-2 text-right"></label>
                                                                <div class="col-lg-4">
                                                                    <asp:Label ID="lbl_errorr_delete" class="label alert-danger" runat="server" Text=""></asp:Label> 
                                                                </div>
                                                            </div>
                                                           </div> 

                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-primary" OnClick="btnDelete_Click" OnClientClick="return ValidateForm_Delete();"  >   <%--  data-toggle="modal" data-target="#newBranchDetail"--%>
                                     <span aria-hidden="true" class="icon-trash"></span>&nbsp;Delete
                               </asp:LinkButton>

                                <button type="button" class="btn btn-default" data-dismiss="modal"><span aria-hidden="true" class=" icon-remove ">Cancel</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>

             </div> 
        </div> 

        
        <script type="text/javascript">

            //function showCurrentContactModal() {
            //    $('#currentContact').modal('show');
            //}

            function showInsertnewLeaveDetails() {

                setCalendar();

                $('#newLeaveDetails').modal('show');
            }

            function setCalendar() {
                $('#<%=txt_startdat.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' }).on('changeDate', function (e) {
                    $(this).datepicker('hide');
                    CalculateDifference();
                });
                $('#<%=txt_enddate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' }).on('changeDate', function (e) {
                    $(this).datepicker('hide');
                    CalculateDifference();
                });
            }

            function closeInsertnewLeaveDetails() {

                $('#newLeaveDetails').modal('hide');
            }

            function showCurrentLeaveDetails() {

                $('#CurrentLeaveDetails').modal('show');
            }

            function DeleteLeaveDetails() {

                $('#deleteStaffLeaveDetail').modal('show');
            }

            /////FUNCTION FOR CALCULATING DATE DIFFERENCE
            function CalculateDifference() {


                var fBDate1 = document.getElementById("<%=txt_startdat.ClientID%>").value;
                var TBDate = document.getElementById("<%=txt_enddate.ClientID%>").value;

                if (fBDate1 != '') {

                    var aFromDate = fBDate1.split("/");
                    var fdd1 = aFromDate[0]; //get the day part- From date
                    var fmm1 = aFromDate[1]; //get the month part- From date
                    var fyyyy1 = aFromDate[2]; //get the year part- From date
                    var fromDate = new Date(parseFloat(fyyyy1), parseFloat(fmm1 - 1), parseFloat(fdd1, 10));

                    var today = new Date();


                    if (fromDate <= (today.setDate(today.getDate() - 1))) {
                        alert('Starting date should not be Less than Current Date');
                        document.getElementById("<%=txt_startdat.ClientID%>").focus();
                        document.getElementById("<%=txt_startdat.ClientID%>").value = "";
                        return false;
                    }
                }

                if (fBDate1 != '' && TBDate != '') {

                    var aFromDate = fBDate1.split("/");
                    var fdd1 = aFromDate[0]; //get the day part- From date
                    var fmm1 = aFromDate[1]; //get the month part- From date
                    var fyyyy1 = aFromDate[2]; //get the year part- From date
                    var fromDate = new Date(parseFloat(fyyyy1), parseFloat(fmm1 - 1), parseFloat(fdd1, 10));
                    var aToDate = TBDate.split("/");
                    var tdd1 = aToDate[0]; //get the day part-To date
                    var tmm1 = aToDate[1]; //get the month part-To date
                    var tyyyy1 = aToDate[2]; //get the year part-To date
                    var toDate = new Date(parseFloat(tyyyy1), parseFloat(tmm1 - 1), parseFloat(tdd1, 10));

                    if (fromDate > toDate) {
                        alert('Starting date should not be greater than Ending Date');
                        document.getElementById("<%=txt_startdat.ClientID%>").focus();
                     document.getElementById("<%=txt_startdat.ClientID%>").value = "";
                     document.getElementById("<%=txt_enddate.ClientID%>").value = "";
                     return false;
                 }


                    // //debugger;
                 var differenceTravel = toDate.getTime() - fromDate.getTime();
                 YearDifferenceTravel = Math.floor(differenceTravel / 1000 / 60 / 60 / 24 / 365);
                 var month = toDate.getMonth() - fromDate.getMonth() + (12 * (toDate.getFullYear() - fromDate.getFullYear()));
                 var diffDays = Math.abs((differenceTravel) / (1000 * 60 * 60 * 24));
                 var hours = Math.abs((differenceTravel) / (1000 * 60 * 60));
                 var minutes = Math.abs((differenceTravel) / (1000 * 60));
                 var seconds = Math.abs((differenceTravel) / (1000));
                 var difference_ms = differenceTravel;

             <%--  document.getElementById("<%=tdYear.ClientID%>").innerHTML = YearDifferenceTravel;
            document.getElementById("<%=tdMonths.ClientID%>").innerHTML = month;--%>
                    document.getElementById("<%=txt_noofdays.ClientID%>").value = diffDays + 1;

                    return false;
                }


            }


            function resetLeaveRequest() {

                document.getElementById("<%=combo_leavetyp.ClientID%>").value = -1;
                document.getElementById("<%=txt_startdat.ClientID%>").value = "";
                document.getElementById("<%=txt_enddate.ClientID%>").value = "";
                document.getElementById("<%=txt_noofdays.ClientID%>").value = "";

                document.getElementById("<%=lbl_errorr.ClientID%>").innerHTML = "";
            }

            function cancelLeaveRequest() {
                resetLeaveRequest()
                closeInsertnewLeaveDetails()
            }

            function ValidateForm() {

                var error_lbl = document.getElementById("<%=lbl_errorr.ClientID%>");

                error_lbl.innerHTML = "";

                var str;


                var type = document.getElementById("<%=combo_leavetyp.ClientID%>");
                 var startdate = document.getElementById("<%=txt_startdat.ClientID%>");
                var enddate = document.getElementById("<%=txt_enddate.ClientID%>");
                var days = document.getElementById("<%=txt_noofdays.ClientID%>");

                var action = document.getElementById("<%=hf_action.ClientID%>").value;
                var editReason = document.getElementById("<%=txt_EditReason.ClientID%>");



                var required = true;
                var req_msg = '';

                var valid_flg = true;
                var err_msg = '';

                //Leave Type

                if (type.value == '' || type.value == '-1') {

                    if (req_msg == '') {
                        req_msg = 'Leave Type';
                    }
                    else {
                        req_msg += ', ' + 'Leave Type';
                    }
                    required = false;
                }

                //Start Date

                var filter = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
                if (startdate.value == '') {
                    if (req_msg == '') {
                        req_msg = 'Leave Start  Date';
                    }
                    else {
                        req_msg += ', ' + 'Leave Start  Date';
                    }
                    required = false;
                }
                else if (!filter.test(startdate.value)) {
                    err_msg += 'Invalid Leave Start  Date ';
                    valid_flg = false;
                }

                //End Date

                var filter = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
                if (enddate.value == '') {
                    if (req_msg == '') {
                        req_msg = 'Leave end  Date';
                    }
                    else {
                        req_msg += ', ' + 'Leave end  Date';
                    }
                    required = false;
                }
                else if (!filter.test(enddate.value)) {
                    err_msg += 'Invalid Leave end  Date ';
                    valid_flg = false;
                }

                //Noof Days

                if (days.value == '') {
                    if (req_msg == '') {
                        req_msg = 'NO of days';
                    }
                    else {
                        req_msg += ', ' + 'NO of days';
                    }
                    required = false;
                }

                //DATE CHECK - WHETHER IT IS LESS THAN THE SAVED/MODIFIED DATE
                var fBDate1 = document.getElementById("<%=txt_startdat.ClientID%>").value;
                var TBDate = document.getElementById("<%=txt_enddate.ClientID%>").value;

                if (fBDate1 != '') {

                    var aFromDate = fBDate1.split("/");
                    var fdd1 = aFromDate[0]; //get the day part- From date
                    var fmm1 = aFromDate[1]; //get the month part- From date
                    var fyyyy1 = aFromDate[2]; //get the year part- From date
                    var fromDate = new Date(parseFloat(fyyyy1), parseFloat(fmm1 - 1), parseFloat(fdd1, 10));

                    var today = new Date();


                    if (fromDate <= today) {
                        document.getElementById("<%=txt_startdat.ClientID%>").focus();
                        document.getElementById("<%=txt_startdat.ClientID%>").value = "";
                        document.getElementById("<%=txt_enddate.ClientID%>").value = "";

                        err_msg += 'Starting date should not be Less than Current Date <br/>';
                        valid_flg = false;
                    }
                }



                if (action == 'Edit') {
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


            function resetLeaveRequestDelete() {

                document.getElementById("<%=lbl_errorr_delete.ClientID%>").innerHTML = "";

            }

            function cancelLeaveRequestDelete() {
                resetLeaveRequestDelete()
                closeInsertnewLeaveDetails()
            }

            function ValidateForm_Delete() {

                var error_lbl = document.getElementById("<%=lbl_errorr_delete.ClientID%>");

                error_lbl.innerHTML = "";

                var str;

                var deleteReason = document.getElementById("<%=txtReasonToDelete.ClientID%>");

                 var required = true;
                 var req_msg = '';

                 var valid_flg = true;
                 var err_msg = '';

                 if (deleteReason.value == '') {
                     if (req_msg == '') {
                         req_msg = 'Reason to Delete';
                     }
                     else {
                         req_msg += ', ' + 'Reason to Delete';
                     }
                     required = false;
                 }
                 else if (deleteReason.value.length > 100) {
                     err_msg += 'Reason to Delete should not exceed 100 characters <br/>';
                     valid_flg = false;
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