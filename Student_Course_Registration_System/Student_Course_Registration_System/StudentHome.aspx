<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/students.master" CodeBehind="StudentHome.aspx.cs" Inherits="Student_Course_Registration_System.StudentHome" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    </div>
    <div class="alert alert-danger" id="err" runat="server" visible="false">
        Course Already Exists.
    </div>
    <div class="alert alert-success" id="succ" runat="server" visible="false">
       Register Successfulyy
    </div>
    <div style="width: 100%; overflow-x: auto; overflow-y: auto">
        <table style="width: 100%;">
            <tbody>
                <tr style="background-color: lavender">
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">

                            <Columns>
                                <asp:TemplateField HeaderText="ID #" ItemStyle-Width="150px" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("course_id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Course Name" ItemStyle-Width="600px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("course_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Course Title" ItemStyle-Width="400px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("course_title") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Update" >
                                    <ItemTemplate>
                                        <%--<asp:ImageButton ID="btnUpdate" runat="server" ImageUrl="~/Images/icon_edit.png" OnClick="btnEdit_Click" OnClientClick ="document.forms[0].target = '_blank';" />--%>
                                        <%--<asp:Label ID="lblID" runat="server" Text='<%#Eval("userId") %>' Visible="false"></asp:Label>--%>
                                        <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Register" OnClick="btnEdit_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>



                        </asp:GridView>

                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
