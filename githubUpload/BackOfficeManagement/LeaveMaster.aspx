<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/masternew.Master" CodeBehind="LeaveMaster.aspx.cs" Inherits="ElixirCSharp.BackOfficeManagement.LeaveMaster" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="inner" style="padding-top:20px;">
        <div class="row">
              <asp:ScriptManager ID="ScriptManager1" runat="server" />

              <div class="col-lg-12">
                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">    

                       <%--<Triggers>
                         <asp:AsyncPostBackTrigger ControlID="grdLeaveType" EventName="PageIndexChanging" />
                         <asp:AsyncPostBackTrigger ControlID="grdLeaveType" EventName="RowCommand" />
                       </Triggers>--%>

                       <ContentTemplate>


                           <div class="col-lg-12">
                               <div class="well">
                                    <div class="col-md-3">
                                        <asp:Panel ID="pnl_add" runat="server">                                                                     
                                            <asp:LinkButton ID="btnAddLeaveType" runat="server" CssClass="btn btn-success"  Width="100%" OnClick="btnAddLeaveType_Click"> 
                                               <span aria-hidden="true" class="icon-plus"></span>&nbsp;Leave Type
                                            </asp:LinkButton>
                                        </asp:Panel>
                                    </div>

<%--                                    <div class="col-md-3">
                                        <div class="input-group">
                                            <asp:TextBox ID="txtSearchAcademicYear" runat="server" Width="300px" CssClass="form-control" placeholder="Enter Academic Year" />
                                                <span class="input-group-btn">
                                                   <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-default" Text="Search"></asp:Button>
                                                </span>
                                        </div>
                                <!-- /input-group -->
                                    </div>--%>
                                     <div class="clearfix"></div>                                      
                               </div>

                           </div>


                           <div class="col-lg-12">
                             <div class="panel-body ">
                                  <div class="table-responsive">
                                       <asp:GridView ID="grdLeaveType" runat="server" Width="100%" HorizontalAlign="Center" AutoGenerateColumns="false" 
                                           OnRowCommand="grdLeaveType_RowCommand"  AllowPaging="true" DataKeyNames="leave_type" CssClass="table table-striped"  
                                           PageSize="50" GridLines="none" EmptyDataText="No Records Available" >  
                                            <Columns>                                               
                                                 <asp:BoundField DataField="leave_type" HeaderText="Id" Visible="false"/>
                                                 <asp:BoundField DataField="leave_name" HeaderText="Name" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" />                                                                                                                 
                                                 <asp:BoundField DataField="leave_prefix" HeaderText="Prefix" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" />
                                                 <asp:BoundField DataField="no_of_days" HeaderText="No. of Days" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" />
                                                 <asp:BoundField DataField="active" HeaderText="Active" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" />                                                                        
                                                                                                    
                                                 <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="col-lg-2">
                            
                                                      <ItemTemplate>

                                                          <asp:LinkButton ID="hplEdit" CssClass="btn btn-warning btn-circle" CommandName="editDetail" CommandArgument='<%# Eval("leave_type")%>' runat="server"><span aria-hidden="true" class="icon-edit"></span></asp:LinkButton>
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

                  <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                     <ProgressTemplate>
                        <br />
                        <img src="" alt="Loading.. Please wait!" />
                     </ProgressTemplate>
                 </asp:UpdateProgress>


                  <div id="newLeaveType" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" >
                      <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                           <ContentTemplate>
                                <div class="modal-dialog" role="document" style="width:500px !important;">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-title">Leave Master</div>
                                        </div>

                                         <div class="modal-body">
                                             <div class="form-horizontal">

                                                 <asp:HiddenField ID="hf_leavetype" runat="server" />

                                                 <div class="form-group row">
                                                      
                                                      <div class="col-lg-4">
                                                         <div class="label-textbox text-right">Leave Name<label class="alert-danger">*</label></div>
                                                      </div>   
                                    
                                                      <div class="col-lg-7">
                                                         <asp:TextBox ID="txt_leavname" runat="server" CssClass="form-control"  MaxLength="25"></asp:TextBox>                                           
                                                      </div>
                                                          
                                                  </div>

                                                  <div class="form-group row">
                                                       
                                                      <div class="col-lg-4">
                                                         <div class="label-textbox text-right">Leave Prefix<label class="alert-danger">*</label></div>
                                                      </div>   
                                    
                                                      <div class="col-lg-7">
                                                         <asp:TextBox ID="txt_leavprfx" runat="server" CssClass="form-control" MaxLength="5"></asp:TextBox>                                           
                                                      </div> 
                                                           </div>
                                                 
                                                  
                                               
                                                      <div class="form-group row">
                                                      <div class="col-lg-4">
                                                         <div class="label-textbox text-right">No Of Days<label class="alert-danger">*</label></div>
                                                      </div>   
                                    
                                                      <div class="col-lg-7">
                                                         <asp:TextBox ID="txt_nodays" runat="server" CssClass="form-control" MaxLength="5"></asp:TextBox>                                           
                                                      </div> 
                                                          </div>
                                                  


                                                   <div class="row">
                                                      <div class="col-lg-4">
                                                         <div class="label-textbox text-right">Active<label class="alert-danger">*</label></div>
                                                      </div>   
                                    
                                                      <div class="col-lg-7">
                                                           <asp:RadioButtonList ID="rb_active" runat="server" RepeatDirection="Horizontal">
                                                                <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                                <asp:ListItem Value="N">No</asp:ListItem>
                                                           </asp:RadioButtonList>  
                                                      </div>
                                                  </div>


                                                 <asp:Panel ID="pnl_edit" runat="server">
                                                      <div class="row">
                                                           <div class="form-group">
                                                                <label class="control-label col-xs-4 text-right">Reason to Edit<label class="alert-danger">*</label></label>
                                                                     <div class="col-xs-7">
                                                                          <asp:TextBox ID="txt_EditReason" runat="server" CssClass="form-control" MaxLength="100" />                                                   
                                                                     </div>
                                                           </div>
                                                      </div>
                                                 </asp:Panel>

                                                  <div class="row">
                                                      <div class="form-group">
                                                           <label class="col-lg-5 text-right"></label>
                                                                <div class="col-lg-6">
                                                                    <asp:Label ID="lbl_error" CssClass="alert-danger" runat="server" Text=""></asp:Label> 
                                                                 </div>
                                                      </div>
                                                 </div>  

                                             </div>
                                         </div>

                                         <div class="modal-footer">
                                            <asp:LinkButton ID="btnLeaveTypeSubmit" runat="server" CssClass="btn btn-primary" OnClick="btnLeaveTypeSubmit_Click" OnClientClick="return ValidateForm();"  >   <%--  data-toggle="modal" data-target="#newBranchDetail"--%>
                                                 <span aria-hidden="true" class="icon-save"></span>&nbsp;Save
                                            </asp:LinkButton>

                                            <asp:HiddenField ID="hf_LeaveAction" runat="server" />
                                                                                                    
                                            <button type="button" class="btn btn-default" data-dismiss="modal"><span aria-hidden="true" class=" icon-remove ">Cancel</button>
                                         </div>


                                    </div>
                                </div>
                           </ContentTemplate>
                      </asp:UpdatePanel>

                  </div>


              </div>

        </div>

      <script type="text/javascript">

          function showInsertNewLeaveTypeModal() {
              document.getElementById("<%=txt_leavname.ClientID%>").focus();
              $('#newLeaveType').modal('show');
          }

          function closeInsertNewLeaveTypeModal() {
              $('#newLeaveType').modal('hide');
          }

          function showEditLeaveTypeModal() {
              $('#newLeaveType').modal('show');
          }



          function resetLeaveMaster() {

              document.getElementById("<%=txt_leavname.ClientID%>").value = "";
              document.getElementById("<%=txt_leavprfx.ClientID%>").value = "";
              document.getElementById("<%=txt_nodays.ClientID%>").value = "";

              document.getElementById("<%=lbl_error.ClientID%>").innerHTML = "";


          }



          function cancelLeaveMaster() {
              resetLeaveMaster()
              closeInsertNewLeaveTypeModal()
          }


          function ValidateForm() {

              var error_lbl = document.getElementById("<%=lbl_error.ClientID%>");

              error_lbl.innerHTML = "";

              var str;

              var name = document.getElementById("<%=txt_leavname.ClientID%>");
               var prefix = document.getElementById("<%=txt_leavprfx.ClientID%>");
              var days = document.getElementById("<%=txt_nodays.ClientID%>");

              var action = document.getElementById("<%=hf_LeaveAction.ClientID%>").value;
              var editReason = document.getElementById("<%=txt_EditReason.ClientID%>");


              var required = true;
              var req_msg = '';

              var valid_flg = true;
              var err_msg = '';


              if (name.value == '') {
                  if (req_msg == '') {
                      req_msg = 'Leave Name';
                  }
                  else {
                      req_msg += ', ' + 'Leave Name';
                  }
                  required = false;
              }
              else if (name.value.length > 25) {
                  err_msg += "Leave Name should not exceed 25 charecters <br/>";
                  valid_flg = false;
              }


              if (prefix.value == '') {
                  if (req_msg == '') {
                      req_msg = 'Leave Prefix';
                  }
                  else {
                      req_msg += ', ' + 'Leave Prefix';
                  }
                  required = false;
              }
              else if (prefix.value.length > 5) {
                  err_msg += "Leave prefix should not exceed 5 charecters <br/>";
                  valid_flg = false;
              }


              if (days.value == '') {
                  if (req_msg == '') {
                      req_msg = 'NO of days';
                  }
                  else {
                      req_msg += ', ' + 'NO of days';
                  }
                  required = false;
              }
              //else if (prefix.value.length > 5) {
              //    err_msg += "Leave prefix should not exceed 5 charecters <br/>";
              //    valid_flg = false;
              //}


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



      </script>


    </div>

</asp:Content>