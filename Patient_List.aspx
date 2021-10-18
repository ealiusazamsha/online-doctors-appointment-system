<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Patient_List.aspx.cs" Inherits="Online_Doctor_Appoinment_System.Admin.Patient_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">

    <asp:GridView ID="grdviewPatient" CssClass="table table-hover table-bordered table-responsive" AutoGenerateColumns="false" runat="server">
        <Columns>
            <%-- <asp:BoundField DataField="Serial_Num" HeaderText="Serail" />--%>
            <asp:TemplateField>
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Patient_Id" HeaderText="Id" />
            <%-- <asp:ImageField DataImageUrlField="Profile_Photo" ItemStyle-Height="100px"></asp:ImageField>--%>
            <asp:BoundField DataField="Patient_Name" HeaderText="Name" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" />
            <asp:BoundField DataField="Date_of_Birth" HeaderText="Birth Date" />
            <asp:BoundField DataField="E_Mail" HeaderText="E_Mail" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" />
            <asp:BoundField DataField="Address" HeaderText="Address" />
            

         


        </Columns>
    </asp:GridView>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyPlaceHolder1" runat="server">
</asp:Content>
