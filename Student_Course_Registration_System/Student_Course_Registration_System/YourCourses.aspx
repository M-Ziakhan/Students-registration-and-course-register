<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="YourCourses.aspx.cs" Inherits="Student_Course_Registration_System.YourCourses" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-12">
            <div class="card m-b-20">
                <div class="card-header">
                    <h3 class="card-title">Add New Course</h3>

                </div>
                 <div class="alert alert-danger col-md-6" style="align-self: center; text-align: center;" runat="server" id="errdiv" visible="false">
                    Opps , Student Already Register this course
                </div>
                 <div class="card-body">


                    <div style="width: 100%; overflow-x: auto; overflow-y: auto">
                        <table style="width: 100%;">
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">

                                            <Columns>
                                                <asp:TemplateField HeaderText="Customer Name" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblnum" runat="server" Text='<%# Eval("course_id") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Course Name" ItemStyle-Width="300px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("course_name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Course Title" ItemStyle-Width="300px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("course_title") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Description of Course" ItemStyle-Width="550px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltitl" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Details">
                                                    <ItemTemplate>
                                                        <asp:Button ID="deletebtn" runat="server" Text="Delete Course" CssClass="btn btn-danger" OnClick="btnCourseDelete_Click" />


                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--<asp:CommandField ButtonType="Link" ShowDeleteButton="true"
                    ItemStyle-Width="150" />--%>
                                            </Columns>


                                        </asp:GridView>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>





                </div></div></div>





    </asp:Content>