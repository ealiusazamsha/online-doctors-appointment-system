<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Doctor_Registration.aspx.cs" Inherits="Online_Doctor_Appoinment_System.Doctor_Registration" %>

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
                <legend>Doctor Registration Form</legend>



                <div class="panel-body">
                    <div id="divmsg" cssclass="form-control" visible="false" runat="server">
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
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

                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label">Doctor Name</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>

                            <asp:TextBox ID="txtbx_Name" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="txtbx_Name"
                                ErrorMessage="Name is a required field."
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label">Speciality</label>
                    <div class="col-md-4 selectContainer">
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="glyphicon glyphicon-list"></i></span>


                            <asp:DropDownList ID="dropdownlist1" CssClass="form-control" runat="server">

                                <asp:ListItem>Select The Speciality</asp:ListItem>
                                <asp:ListItem>Cardiology (Heart, Cardiac Surgery, Cardiovascular, Hypertension, Blood Pressure)</asp:ListItem>
                                <asp:ListItem>Dentistry (Dental, Orthodontics, Maxillofacial Surgery, Scaling)</asp:ListItem>
                                <asp:ListItem>Dermatology (Skin, Venereology, Sexual, Hair, Allergy)</asp:ListItem>
                                <asp:ListItem>Endocrinology (Diabetes, Hormones, Thyroid, etc.)</asp:ListItem>
                                <asp:ListItem>ENT (Ear, Nose & Throat, Otorhinolaryngology)</asp:ListItem>
                                <asp:ListItem>Gastroenterology (Stomach, Pancreas and Intestine)</asp:ListItem>
                                <asp:ListItem>Gynaecology and Obstetrics (Pregnancy, Menstrual, Uterus, Female)</asp:ListItem>
                                <asp:ListItem>Medicine (All Diseases of Adults)</asp:ListItem>
                                <asp:ListItem>Nephrology (Kidney, Ureter, Urinary Bladder)</asp:ListItem>
                                <asp:ListItem>Paediatrics (Child or Infant any disease)</asp:ListItem>
                                <asp:ListItem>Psychiatry (Mental Health, Drug Abuse, Depression, etc.)</asp:ListItem>
                                <asp:ListItem>Urology (Surgery for Kidney, Ureter or Urinary Bladder)</asp:ListItem>

                            </asp:DropDownList>


                        </div>
                    </div>
                </div>


                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label">Designation</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>

                            <asp:TextBox ID="txtbxDesignation" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="txtbxDesignation"
                                ErrorMessage="This field can not be Empty."
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label">Degree</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>

                            <asp:TextBox ID="txtbxDegree" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                ControlToValidate="txtbxDegree"
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
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

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
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

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label">Profile Picture</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>

                            <asp:FileUpload ID="FileUpProfileImage"  runat="server" />

                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-md-4 control-label">Phone #</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>

                            <asp:TextBox ID="txtbx_Phone" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                ControlToValidate="txtbx_Phone"
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

                        <asp:LinkButton ID="lnkbtnDoctor" CssClass="btn btn-warning" OnClick="lnkbtnSend_Click" runat="server"><span class="glyphicon glyphicon-send"></span> Submit</asp:LinkButton>
                    </div>

                </div>

            </fieldset>
        </div>
    </div>
</asp:Content>
