<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Online_Doctor_Appoinment_System._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">

    <!--  Body Content -->


    <div class="container-fluid">

        <div class="container" id="HeaderImageDiv" style="overflow: hidden;">
            <div class="content">
                <div class="content-body">
                    <div class="home-wrapper" style="background-image: url(content/img/main-img.png)">
                        <div class="home-search-section">
                            <div id="HomePageSearch" class="HomeSearchSection">

                                <div class="HomePageCarouselText">

                                    <span style="font-size: 42px; font-weight: bold; color: #fc9e7e">Visit Dr.</span>
                                    <span style="font-size: 14px; color: #fff">Appoinment made Easy !</span>

                                    <div class="" style="font-size: 12px; color: #fff; margin-bottom: 10px; word-break: break-all">
                                        <b>Visit Dr.</b>  is facilitates cloud based search of healthcare professionals, 
                   connecting with them and engaging their services upon availability.  A toll free number is also
                   available to patron who need traditional avenue for booking appointments. 
                                    </div>



                                </div>

                                <div class="subHeadingHome text-normal" style="color: #187fdd">
                                    <h2>Find and book appointments with doctors . .</h2>
                                </div>



                                <div id="Search" class="">

                                    
                                    <asp:LinkButton ID="lnkbtnAppoinment" CssClass="btn btn-success btn-sm" href="/Doctors_veiw.aspx" runat="server"><span class="glyphicons glyphicons-search"></span>Search Doctor</asp:LinkButton>
                                   
                                </div>












                            </div>
                            <div class="clear"></div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>






    <!--  Body Content -->

</asp:Content>

