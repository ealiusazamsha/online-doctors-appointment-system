<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Doctor_list.aspx.cs" Inherits="Online_Doctor_Appoinment_System.Doctor.Doctor_list" %>

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
            <asp:BoundField DataField="Doctor_Id" HeaderText="Id" />
            <%-- <asp:ImageField DataImageUrlField="Profile_Photo" ItemStyle-Height="100px"></asp:ImageField>--%>
            <asp:BoundField DataField="Doctor_Name" HeaderText="Name" />
            <asp:BoundField DataField="Speciality" HeaderText="Specialist" />
            <asp:BoundField DataField="Designation" HeaderText="Designation" />
            <asp:BoundField DataField="Degree" HeaderText="Degree" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" />
            <asp:BoundField DataField="Address" HeaderText="Address" />
            <asp:BoundField DataField="Approval" HeaderText="Approval Status" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnApproval" runat="server" CssClass="btn btn-info" OnClick="btnApproval_Click" Text='<%# getbtntext((Eval("Approval").ToString()))%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkbtnDelete" CssClass="btn btn-danger" OnClick="lnkbtnDelete_Click" runat="server">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>


        </Columns>
    </asp:GridView>
</asp:Content>
