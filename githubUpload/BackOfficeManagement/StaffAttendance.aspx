<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/masternew.Master" CodeBehind="StaffAttendance.aspx.cs" Inherits="ElixirCSharp.BackOfficeManagement.StaffAttendance" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="inner" style="padding-top: 20px;">
        <div class="row">
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <div class="col-lg-12">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">


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
                                    <%-- <asp:Button ID="btnAddStaff" runat="server" class="btn btn-success" Text="New Student" />--%>

                                    <%-- <button  class="btn btn-success" data-toggle="modal" data-target="#buttonedModal">
                                                <span aria-hidden="true" class="glyphicon glyphicon-cog"></span>
                                                New Student
                                            </button>--%>

                                    <asp:LinkButton ID="btnTodayAttendance" runat="server" CssClass="btn btn-success" Width="100%" OnClick="btnTodayAttendance_Click"> 
                                                    <span aria-hidden="true" class="icon-plus"></span>&nbsp;Today's Attendance
                                    </asp:LinkButton>
                                </asp:Panel>

                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" >
                                    <ProgressTemplate>
                                        <br />
                                        <img src="../img/indicator.gif" />
                                                        <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Blue">Loading... Please wait!</asp:Label>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>

                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox ID="txtSearchAttendace" runat="server" Width="300px" CssClass="form-control" placeholder="Enter Attendance Date" />
                                    <span class="input-group-btn">
                                        <asp:Button ID="btnSearchAttendDate" runat="server" CssClass="btn btn-default" Text="Search"></asp:Button>
                                    </span>
                                </div>
                                <!-- /input-group -->
                            </div>

                            <div class="clearfix"></div>
                        </div>

                        <div class="col-lg-12 text-right text-info ">
                            <asp:Label ID="lbl_date" CssClass="text-right text-warning" runat="server"></asp:Label>
                        </div>

                        <div class="col-lg-12">
                            <div class="panel-body ">
                                <div class="table-responsive">
                                    <asp:GridView ID="grdStaffAttendance1" runat="server" Width="100%" HorizontalAlign="Center" AutoGenerateColumns="true"
                                        DataKeyNames="staff_code" CssClass="table table-striped" GridLines="None" EmptyDataText="No Records Available" OnRowCreated="grdStaffAttendance1_RowCreated" OnRowDataBound="grdStaffAttendance1_RowDataBound">

                                        <%--<Columns>

                                                           <asp:TemplateField>
                                                                <EditItemTemplate>
                                                                     <asp:CheckBox ID="CheckBox1" runat="server" />                       
                                                                </EditItemTemplate>
                                                                <ItemTemplate>                      
                                                                     <asp:CheckBox ID="CheckBox1" runat="server" />
                                                                </ItemTemplate>           
                                                           </asp:TemplateField>

                                                           <asp:BoundField DataField="staff_code" HeaderText="Staff Code" Visible="false"/>
                                                           <asp:BoundField DataField="staff_id" HeaderText="Staff Id" Visible="false"/>                                                                                                                 
                                                           <asp:BoundField DataField="staff_name" HeaderText="Staff Name" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" />
                                                           <asp:BoundField DataField="subdept_name" HeaderText="SubDepartment Name" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" />
                                                           <asp:BoundField DataField="desig_name" HeaderText="Designation Name" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" />                                                                        
                                                 
                                                           <asp:TemplateField HeaderText="In-Time" ItemStyle-CssClass="col-lg-2">
                                                                <ItemTemplate>
                                                                     <asp:TextBox ID="txt_intime" runat="server" CssClass="form-control" ></asp:TextBox>      
                                                                </ItemTemplate>
                                                           </asp:TemplateField>

                                                           <asp:TemplateField HeaderText="Out-Time" ItemStyle-CssClass="col-lg-2">
                                                                <ItemTemplate>
                                                                     <asp:TextBox ID="txt_outtime" runat="server" CssClass="form-control" ></asp:TextBox>        
                                                                </ItemTemplate>
                                                           </asp:TemplateField>

                                                           <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="col-lg-2">
                                                                <ItemTemplate>
                                                                     <asp:Label ID="lbl_status1" runat="server"  Visible="False"></asp:Label> 
                                                                     <asp:DropDownList ID="combo_status1" runat="server" onchange="doAlert(this);">
                                                                     </asp:DropDownList>
                                                                </ItemTemplate>
                                                           </asp:TemplateField>

                                                      </Columns>--%>
                                    </asp:GridView>

                                    <%-- <div class="row">
                                                      <div class="col-lg-1">
                                                           <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn btn-primary" >   
                                                                <span aria-hidden="true" class="icon-save"></span>&nbsp;Save
                                                           </asp:LinkButton>
                                                      </div>

                                                      <button type="button" class="btn btn-default" data-dismiss="modal"><span aria-hidden="true" class=" icon-remove ">Cancel</button>
                                                 </div>--%>
                                </div>
                            </div>
                        </div>


                    </ContentTemplate>

                </asp:UpdatePanel>
            </div>
            

            <!-- MODAL POPUP -->
            <div class="col-lg-12">
                <div id="newStaffAttendance" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog" style="width: 80%; important;">
                        <div class="modal-content">

                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="grdStaffAttendance" EventName="PageIndexChanging" />
                                    <asp:AsyncPostBackTrigger ControlID="grdStaffAttendance" EventName="RowCommand" />
                                </Triggers>
                                <ContentTemplate>

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                        <div class="modal-title">Attendance Date : <b>
                                            <asp:Label ID="lbl_attenddate" runat="server">ggtrt</asp:Label></b></div>
                                    </div>



                                    <div class="modal-body">

                                        <asp:HiddenField ID="hf_intime" runat="server" />
                                        <asp:HiddenField ID="hf_outtime" runat="server" />

                                        <div class="form-group row">

                                            <label class="col-lg-2 text-right">Department</label>
                                            <div class="col-lg-3">
                                                <asp:DropDownList ID="combo_dept" class="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="combo_dept_SelectedIndexChanged"></asp:DropDownList>
                                            </div>

                                            <div class="col-lg-5">
                                                <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                                                    <ProgressTemplate>
                                                        <br />
                                                        <img src="../img/indicator.gif" />
                                                        <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Blue">Loading... Please wait!</asp:Label>
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                                </div>
                                        </div>

                                        


                                        <div class="col-lg-12">
                                            <asp:Panel ID="Panel1" runat="server" Style="height: 500px;" ScrollBars="Vertical">
                                                <div class="panel-body ">
                                                    <div class="table-responsive">
                                                        <asp:GridView ID="grdStaffAttendance" runat="server" Width="100%" HorizontalAlign="Center" AutoGenerateColumns="false"
                                                            DataKeyNames="attend_id" CssClass="table table-striped" GridLines="none" 
                                                            EmptyDataText="No Records Available" OnRowCreated="grdStaffAttendance_RowCreated" OnRowDataBound="grdStaffAttendance_RowDataBound">
                                                            <%--OnRowCommand="grdStaffAttendance_RowCommand"--%>
                                                            <Columns>

                                                                <asp:BoundField DataField="attend_id" HeaderText="Staff Code" />
                                                                <asp:BoundField DataField="staff_code" HeaderText="Staff Code" />
                                                                <asp:BoundField DataField="staff_id" HeaderText="Staff Id" />
                                                                <asp:BoundField DataField="staff_name" HeaderText="Name" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" />
                                                                <asp:BoundField DataField="subdept_name" HeaderText="SubDepartment" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" />
                                                                <asp:BoundField DataField="desig_name" HeaderText="Designation" ItemStyle-CssClass="col-lg-2" HeaderStyle-CssClass="col-lg-2" />
                  
                                                                <asp:TemplateField HeaderText="In-Time" ItemStyle-CssClass="col-lg-2">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txt_intime" runat="server" Text='<%# Bind("in_time")%>' CssClass="form-control" onchange="doAlert(this);"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Out-Time" ItemStyle-CssClass="col-lg-2">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txt_outtime" runat="server" Text='<%# Bind("out_time")%>' CssClass="form-control" onchange="doAlert(this);"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="col-lg-2">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbl_status1" runat="server" Text='<%# Bind("pstatus") %>' Visible="False"></asp:Label>
                                                                        <asp:DropDownList ID="combo_status1" class="form-control" onchange="ChangeColor(this);"
                                                                            runat="server" AutoPostBack="true">
                                                                        </asp:DropDownList>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="col-lg-2">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbl_Linkstatus1" runat="server" Text='<%# Bind("pstatus") %>' Visible="False" ></asp:Label>
                                                                        <asp:LinkButton ID="lnkBtnStatus" CssClass="btn btn-success"
                                                                            runat="server" Width="100%" CommandName="update" CommandArgument='<%# Eval("attend_id")%>' OnClientClick="return ShownewEditReason(this);"  ></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:BoundField DataField="saved" HeaderText="saved" />
                                                            </Columns>
                                                        </asp:GridView>


                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                </ContentTemplate>

                            </asp:UpdatePanel>
                        </div>



                        <div class="modal-footer">
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" OnClientClick="return ValidateForm();">  <%-- --%>  <%--  data-toggle="modal" data-target="#newBranchDetail"--%>
                                        <span aria-hidden="true" class="icon-save"></span>&nbsp;Save
                                    </asp:LinkButton>
                                    <asp:HiddenField ID="hf_action" runat="server" />
                                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="cancelEvent()"><span aria-hidden="true" class=" icon-remove "></span>Cancel</button>

                                    <asp:UpdateProgress ID="UpdateProgress3" runat="server" >
                                    <ProgressTemplate>
                                        <br />
                                        <img src="../img/indicator.gif" />
                                                        <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Blue">Loading... Please wait!</asp:Label>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnSave" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>

                    </div>
                </div>
            </div>

            <!-- /MODAL POPUP -->

            <div id="newEditReason" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog" role="document">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="modal-content">

                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <div class="modal-title">Update attendance</div>
                                </div>


                                <div class="modal-body">
                                    <div class="form-horizontal">
                                        <asp:HiddenField ID="hf_attendID" runat="server" />
                                        <asp:HiddenField ID="hf_staffID" runat="server" />
                                        <div class="form-group row">
                                            <label class="col-lg-4 text-right">Status</label>
                                            <div class="col-lg-6">
                                                <asp:RadioButtonList ID="rbtn_status" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Text="Present" Value="P"></asp:ListItem>
                                                    <asp:ListItem Text="Absent" Value="A"></asp:ListItem>
                                                    <asp:ListItem Text="Leave" Value="L"></asp:ListItem>
                                                    <asp:ListItem Text="Sick" Value="S"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-lg-4 text-right">In-Time</label>
                                            <div class="col-lg-6">
                                                <asp:TextBox ID="txt_Intime2" runat="server" class="form-control" MaxLength="8"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 text-right">Out-Time</label>
                                            <div class="col-lg-6">
                                                <asp:TextBox ID="txt_Outtime2" runat="server" class="form-control" MaxLength="8"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-lg-4 text-right">Reason to Edit<label class="alert-danger">*</label></label>
                                            <div class="col-lg-6">
                                                <asp:TextBox ID="txt_editReason" runat="server" class="form-control" MaxLength="100"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>
                                </div>


                                <div class="modal-footer">
                                    <asp:Button ID="btnSaveReason" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnSaveReason_Click" />
                                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="cancelEvent()">Cancel</button>

                                    <asp:UpdateProgress ID="UpdateProgress4" runat="server" >
                                    <ProgressTemplate>
                                        <br />
                                        <img src="../img/indicator.gif" />
                                                        <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Blue">Loading... Please wait!</asp:Label>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                                </div>

                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>


          <script type="text/javascript">

              function GetChildControl(element, id) {

                  var child_elements = element.getElementsByTagName("*");

                  for (var i = 0; i < child_elements.length; i++) {

                      if (child_elements[i].id.indexOf(id) != -1) {
                          return child_elements[i];
                      }
                  }
              }

              function ShownewEditReason(ctl) {



                  var iEdit = document.getElementById("iEdit").value;
                  // alert(iEdit);
                  if (iEdit == 'N') {
                      alert('You are not allowed to edit the data!')
                  }
                  else {


                      var row = ctl.parentNode.parentNode;
                      var rowIndex = row.rowIndex - 1;
                      var staffId = row.cells[0].innerHTML;


                      document.getElementById("<%=hf_staffID.ClientID%>").value = staffId;

                        //intime/out time from grid
                    document.getElementById("<%=txt_Intime2.ClientID%>").value = row.cells[4].getElementsByTagName("INPUT")[0].value;
                        document.getElementById("<%=txt_Outtime2.ClientID%>").value = row.cells[5].getElementsByTagName("INPUT")[0].value;

                        document.getElementById("<%=txt_editReason .ClientID%>").value = "";

                        //radio button value
                        //button value
                        var label = GetChildControl(row, "lnkBtnStatus");

                        //radio button values
                        var RB1 = document.getElementById("<%=rbtn_status.ClientID%>");
                    var radio = RB1.getElementsByTagName("input");
                    var rbtext = RB1.getElementsByTagName("label");
                    for (var i = 0; i < radio.length; i++) {
                        if (rbtext[i].innerHTML == label.innerHTML) {
                            radio[i].checked = true;
                        }
                    }

                    $('#newEditReason').modal('show');
                }

                    // $('#newEditReason').modal('show');

                return false;

            }



            function ChangeColor(ctl) {
                ctl.style.borderColor = ""
                //if (ctl.selectedValue
                var selectedvalue = ctl.options[ctl.selectedIndex].value;

                if (selectedvalue == 'A') {

                    ctl.style.borderColor = "red";
                    //$(ctl).css('Border-Color', 'red');
                    //ctl.style.ForeColor = 'Red';
                    //ctl.style.BorderColor = 'Red';
                }
                else if (selectedvalue == 'P') {
                    ctl.style.ForeColor = "Green";
                    ctl.style.BorderColor = "Green";
                }

                else if (selectedvalue == 'S') {
                    ctl.style.ForeColor = "blue";
                    ctl.style.BorderColor = "blue";
                }
                //alert(selectedvalue);
            }

            function shownewStaffAttendance() {

                $('#newStaffAttendance').modal('show');
            }

            function closenewStaffAttendance() {

                $('#newStaffAttendance').modal('hide');
            }

            function showenewEditReason() {
                alert('dsd');
                $('#newEditReason').modal('show');
            }

            function closenewEditReason() {

                $('#newEditReason').modal('hide');
            }




              <%-- function doAlert(ctl) {
                var grid = document.getElementById("<%=grdStaffAttendance.ClientID %>");

                 var in_time = document.getElementById("hf_intime").value;
                 var out_time = document.getElementById("hf_outtime").value;

                 var save_edit = document.getElementById("btn_save").value;


                 for (i = 1; i < grid.rows.length; i++) {
                     var chkbox = grid.rows[i].cells[0].getElementsByTagName("INPUT")[0];


                     var txt_in = grid.rows[i].cells[5].getElementsByTagName("INPUT")[0];
                     var txt_out = grid.rows[i].cells[6].getElementsByTagName("INPUT")[0];

                     if (grid.rows[i].cells[7].getElementsByTagName("select")[0] == ctl) {
                         if (save_edit != 'Save') {
                             chkbox.checked = true;
                         }


                         if (ctl.value != 'P') {

                             txt_in.value = '';
                             txt_out.value = '';


                         }
                         else {

                             txt_in.value = in_time;
                             txt_out.value = out_time;

                         }
                     }
                     else if (grid.rows[i].cells[5].getElementsByTagName("input")[0] == ctl) {
                         chkbox.checked = true;
                     }
                     else if (grid.rows[i].cells[6].getElementsByTagName("input")[0] == ctl) {
                         chkbox.checked = true;
                     }

                     //if (save_edit == 'Save')
                     //{

                     //    var txt_in = grid.rows[i].cells[5].getElementsByTagName("INPUT")[0];
                     //    var txt_out = grid.rows[i].cells[6].getElementsByTagName("INPUT")[0];

                     //    if (grid.rows[i].cells[7].getElementsByTagName("select")[0] == ctl) {


                     //        if (ctl.value != 'P') {

                     //            txt_in.value = '';
                     //            txt_out.value = '';
                     //        }
                     //        else {

                     //            txt_in.value = in_time;
                     //            txt_out.value = out_time;

                     //        }
                     //    }
                     //    else if (grid.rows[i].cells[5].getElementsByTagName("input")[0] == ctl)
                     //    {
                     //        chkbox.checked = true;
                     //    }
                     //    else if (grid.rows[i].cells[6].getElementsByTagName("input")[0] == ctl) {
                     //        chkbox.checked = true;
                     //    }
                     //}
                     //else
                     //{

                     //}

                 }
             }--%>

            </script>
        </div>
    </div>

</asp:Content>