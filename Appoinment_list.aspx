<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Appoinment_list.aspx.cs" Inherits="Online_Doctor_Appoinment_System.Appoinment.Appoinment_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">


      <asp:GridView ID="grdviewPatient" CssClass="table table-hover table-bordered table-responsive" AutoGenerateColumns="false" runat="server">
        <Columns>
            <asp:BoundField DataField="Serial_Num" HeaderText="Serail" />
            <asp:BoundField DataField="Date" HeaderText="Date" dataformatstring="{0:dd-MMMM-yyyy}"/>
            <asp:BoundField DataField="Session" HeaderText="Session" />
            <asp:BoundField DataField="Patient_Id" HeaderText="P_Id" />
            <asp:BoundField DataField="Patient_Name" HeaderText="P_Name" />
            <asp:BoundField DataField="PatientPhone" HeaderText="P_Phone" />
            <asp:BoundField DataField="Doctor_Id" HeaderText="D_Id" />
            <asp:BoundField DataField="Doctor_Name" HeaderText="D_Name" />
            <asp:BoundField DataField="Speciality" HeaderText="Specialist" />
            <asp:BoundField DataField="Designation" HeaderText="Designation" />
            <asp:BoundField DataField="DoctorPhone" HeaderText="D_Phone" />

               </Columns>
    </asp:GridView>

</asp:Content>
