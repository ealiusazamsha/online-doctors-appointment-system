<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor_appoinment.Master" AutoEventWireup="true" CodeBehind="Appointment .aspx.cs" Inherits="Online_Doctor_Appoinment_System.Appointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
    <style>
        input[type="date"], input[type="time"], input[type="datetime-local"], input[type="month"] {
            line-height: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">

      <div class="container">

        <div class="well form-horizontal">
            <fieldset>

                <!-- Form Name -->
                <legend>Appoinment Form</legend>



                <div class="panel-body">
                    <div id="divmsg" CssClass="form-control" visible="false" runat="server">
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </div>
                </div>


                <!-- Text input-->

                 <div class="form-group">
                    <label class="col-md-4 control-label">Date</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>

                            <asp:TextBox ID="txtbxDate" placeholder="Date" CssClass="form-control" Type="Date" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="txtbxDate"
                                    ErrorMessage="This field can not be Empty."
                                    ForeColor="Red"
                                    Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>



<!-- Text input-->

	<div class="form-group"> 
  <label class="col-md-4 control-label">Session</label>
    <div class="col-md-4 selectContainer">
    <div class="input-group">
        <span class="input-group-addon">
          <i class="glyphicon glyphicon-list"></i></span>


      <asp:DropDownList id="dropdownlist1" CssClass="form-control" runat="server">

   <asp:ListItem>Morning/Evening</asp:ListItem>
   <asp:ListItem>Morning (9:00AM to 2:00PM)</asp:ListItem>
   <asp:ListItem>Evening (4:00PM to 10:00PM)</asp:ListItem>
   

</asp:DropDownList>

  </div>
</div>
</div>


                    <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label">Patient ID</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>

                            <asp:TextBox ID="txtbx_Patent_ID" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                 <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label">Doctor ID</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>

                            <asp:TextBox ID="txtbx_Doctor_ID" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>


<!-- Text area -->
  
<div class="form-group">
  <label class="col-md-4 control-label"> Short Description</label>
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
        	
        <asp:TextBox ID="TxtbxDescription" TextMode="MultiLine"  CssClass="form-control" runat="server"></asp:TextBox>
  </div>
  </div>
</div>

         <!-- Button -->
                <div class="form-group">
                    <label class="col-md-4 control-label"></label>
                    <div class="col-md-4">
                        
                        <asp:LinkButton ID="lnkbtnAppoinment" CssClass="btn btn-warning" OnClick="lnkbtnSend_Click" runat="server"><span class="glyphicon glyphicon-send"></span>Submit</asp:LinkButton>
                    </div>
                    
                </div>

            </fieldset>
        </div>
    </div>


</asp:Content>
