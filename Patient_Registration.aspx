<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Patient_Registration.aspx.cs" Inherits="Online_Doctor_Appoinment_System.WebForm1" %>

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
                <legend>Patient Registration Form</legend>



                <div class="panel-body">
                    <div id="divmsg" CssClass="form-control" visible="false" runat="server">
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
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
                    <label class="col-md-4 control-label">Name</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>

                            <asp:TextBox ID="txtbx_Name"   CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="txtbx_Name"
                                    ErrorMessage="Name is a required field."
                                    ForeColor="Red"
                                    Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>


                <!-- radio checks -->
                <div class="form-group">
                    <label class="col-md-4 control-label">Gender</label>
                    <div class="col-md-4">
                        <div class="radio">
                            <label>

                                <asp:RadioButton ID="rdoMale" GroupName="1" Text="Male" runat="server" />
                            </label>
                            <label>
                                <asp:RadioButton ID="rdoFemale" GroupName="1" Text="Female" runat="server" />
                            </label>
                        </div>
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label">Date of Birth</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>

                            <asp:TextBox ID="txtbxBirth" placeholder="Date of Birth" CssClass="form-control" Type="Date" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="txtbxBirth"
                                    ErrorMessage="This field can not be Empty."
                                    ForeColor="Red"
                                    Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <!-- Text input-->
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

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label">Cofirm Password</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>

                            <asp:TextBox ID="txtbx_RePassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" ForeColor="Red" Display="Dynamic" ControlToValidate="txtbx_RePassword" runat="server" ControlToCompare="txtbx_Password" ErrorMessage="Password not matching"></asp:CompareValidator>
                        </div>
                    </div>
                </div>

                <!-- Text input-->


                <div class="form-group">
                    <label class="col-md-4 control-label">Phone #</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>

                            <asp:TextBox ID="txtbx_Phone" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
                                    ControlToValidate="txtbx_Password"
                                    ErrorMessage="This field can not be Empty."
                                    ForeColor="Red"
                                    Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label">Address</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>

                            <asp:TextBox ID="txtbx_Address" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>



                <

                <!-- Button -->
                <div class="form-group">
                    <label class="col-md-4 control-label"></label>
                    <div class="col-md-4">
                        <asp:LinkButton ID="lnkbtnSend" CssClass="btn btn-warning" OnClick="lnkbtnSend_Click" runat="server"><span class="glyphicon glyphicon-send"></span> Send</asp:LinkButton>

                    </div>
                </div>

            </fieldset>
        </div>
    </div>

</asp:Content>
