<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Manage Patients.aspx.cs" Inherits="Online_Doctor_Appoinment_System.Manage_Patients" %>
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
            <asp:BoundField DataField="TreatDone" HeaderText="Treatment" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnTreatDone" runat="server" CssClass="btn btn-info" Onclick="btnTreatDone_Click" Text='<%# getbtntext((Eval("TreatDone").ToString()))%>' />
                </ItemTemplate>
            </asp:TemplateField>

                <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkbtnCancel" CssClass="btn btn-danger" Onclick="lnkbtnCancel_Click" runat="server">Cancel</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>



               </Columns>
    </asp:GridView>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyPlaceHolder1" runat="server">
</asp:Content>
