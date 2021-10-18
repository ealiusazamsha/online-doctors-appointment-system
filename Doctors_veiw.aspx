<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor_appoinment.Master" AutoEventWireup="true" CodeBehind="Doctors_veiw.aspx.cs" Inherits="Online_Doctor_Appoinment_System.Doctor.Doctors_veiw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">

    <div class="container-fluid">

        <div class="container" id="HeaderImageDiv" style="overflow: hidden;">
            <div class="content">
                <div class="content-body">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <div id="HomePageSearch" class="HomeSearchSection">

                            <div class="subHeadingHome text-normal" style="color: #187fdd">
                                
                            </div>

                            <div id="divSearchByDoctor" class="">

                                <span class="searchSelectRound">

                                    <asp:DropDownList class="txtFieldSearch text-bold greenText-dark" Style="font-size: 20px" ID="drSkills" name="Speciality" runat="server">

                                        <asp:ListItem>Search Doctor by Speciality</asp:ListItem>
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

                                </span>

                                 </div>
                            


                        </div>
                    </div>
                    <div class="col-md-4"></div>

                            <div>
                  
                                <asp:LinkButton ID="lnkbtnSearch" CssClass="btn btn-success btn-sm" Style="display: inline-block; margin-top:5px; margin-bottom: 5px; padding: 5px 5px;font-size:17px; line-height:25px;font-weight:normal;" OnClick="lnkbtnSearch_Click" runat="server"><span class="glyphicons glyphicons-search"></span>Search</asp:LinkButton>
                          
                            </div>
                    <div class="clear"></div>
                </div>



            </div>


        </div>

    </div>
    <div class="col-lg-12 col-sm-12 doctor_result_div">
        <asp:Repeater ID="RepeaterDoctorList" runat="server">
            <HeaderTemplate></HeaderTemplate>
            <ItemTemplate>
                <div class="row">
                    <div class="col-lg-2 col-sm-2 doctor_search_left_block">
                        <!-----doc pic block-------->
                        <img class="img-circle search_page_doctor_image pull-right" src="<%# Eval("Profile_Photo") %>" alt="profile pic">
                    </div>
                    <div class="col-lg-4 col-sm-4 doctor_search_mid_block">
                        <!-----doc mid block-------->
                        <p class="search_page_doctor_name grey_font_color" style="font-size: 22px;"><%# Eval("Doctor_Name") %></p>
                        <p class="search_page_doctor_des grey_font_color small_font"><%# Eval("Degree") %></p>
                        <p class="search_page_doctor_sp grey_font_color small_font"><%# Eval("Designation") %></p>
                        <p class="search_page_doctor_sp grey_font_color small_font"><%# Eval("Speciality") %></p>
                    </div>
                    <div class="col-lg-6 col-sm-6 doctor_search_right_block">
                        <!-----doc right block-------->
                        <div class="row right_block_row">
                            <div class="col-lg-9 col-sm-9">
                                <p class="grey_font_color small_font"><i class="fa fa-map-marker" aria-hidden="true"></i>Chamber</p>
                                <p class="small_font grey_font_color"><span><%# Eval("Address") %> </span></p>
                            </div>
                            <div class="col-lg-3 col-sm-3 profile_btn_div">
                                <!----------Search btn------->

                                <asp:LinkButton CommandArgument='<%# Eval("Doctor_Id") %>' ID="lnkbtnAppoinment" CssClass="btn btn-success btn-sm" OnClick="lnkbtnAppoinment_Click" runat="server"><span class="glyphicons glyphicons-search"></span>Get Appoinment</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>

        </asp:Repeater>
    </div>




</asp:Content>
