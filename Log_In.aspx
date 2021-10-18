<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Log_In.aspx.cs" Inherits="Online_Doctor_Appoinment_System.Log_In" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">

    
      <div class="container">

        <div class="well form-horizontal">
            <fieldset>

                <!-- Form Name -->
                <legend>LOG IN Form</legend>



                <div class="panel-body">
                    <div id="divmsg" CssClass="form-control" style="color:red" visible="false" runat="server">
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </div>
                </div>


<!-- 

	<div class="form-group"> 
  <label class="col-md-4 control-label">User Type</label>
    <div class="col-md-4 selectContainer">
    <div class="input-group">
        <span class="input-group-addon">
          <i class="glyphicon glyphicon-list"></i></span>


      <asp:DropDownList id="User_Type" CssClass="form-control" runat="server">

   <asp:ListItem>Select User Type</asp:ListItem>
   <asp:ListItem>Patient LogIn</asp:ListItem>
   <asp:ListItem>Doctor LogIn</asp:ListItem>
   

</asp:DropDownList>

  </div>
</div>
</div>


-->
                <div class="form-group">
                    <label class="col-md-4 control-label">E-Mail</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>

                            <asp:TextBox ID="txtbx_email" CssClass="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="txtbx_email"
                                    ErrorMessage="This field can not be Empty."
                                    ForeColor="Red"
                                    Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>


                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label">Password</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>

                            <asp:TextBox ID="txtbx_Password" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                             
                               <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="txtbx_Password"
                                    ErrorMessage="This field can not be Empty."
                                    ForeColor="Red"
                                    Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>


                <!-- Button -->
                <div class="form-group">
                    <label class="col-md-4 control-label"></label>
                    <div class="col-md-4">
                        <asp:LinkButton ID="lnkbtnSend" CssClass="btn btn-warning" OnClick="lnkbtnSend_Click" runat="server"><span class="glyphicon glyphicon-send"></span> LOG IN</asp:LinkButton>

                    </div>
                </div>



                </fieldset>

               
</div>
          </div>


</asp:Content>
