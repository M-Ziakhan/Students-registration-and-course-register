<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="StdDetails.aspx.cs" Inherits="Student_Course_Registration_System.StdDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card m-b-20">
                <div class="card-body">




                    <div style="width: 100%; overflow-x: auto; overflow-y: auto">
                        <table style="width: 100%;">
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="No records Found">

                                            <Columns>

                                                <asp:TemplateField HeaderText="userId" ItemStyle-Width="150" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("userId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Student Name" ItemStyle-Width="300">
                                                    <ItemTemplate>
                                                        <asp:Label ID="stdname" runat="server" Text='<%# Eval("fullname") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Student Email" ItemStyle-Width="300">
                                                    <ItemTemplate>
                                                        <asp:Label ID="stdemail" runat="server" Text='<%# Eval("userEmail") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Student Mobile" ItemStyle-Width="300">
                                                    <ItemTemplate>
                                                        <asp:Label ID="stdem" runat="server" Text='<%# Eval("mobile") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Update">
                                                    <ItemTemplate>

                                                        <asp:Button ID="marksbtn" CssClass="btn btn-success" runat="server" Text="+ Add New Course" OnClick="Button1_add" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Assign">
                                                    <ItemTemplate>
                                                        <asp:Button ID="detailebtn" runat="server" Text="Assign Courses" CssClass="btn btn-info" OnClick="btnassign_Click" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>




                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
        </div>
    </div>



    <div class="row">
        <div class="col-md-12">
            <div class="card m-b-20">
                <div class="card-body">




                    <div style="width: 100%; overflow-x: auto; overflow-y: auto">
                        <table style="width: 100%;">
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" EmptyDataText="No records Found">

                                            <Columns>
                                                <asp:TemplateField HeaderText="Courseid" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="cours_id" runat="server" Text='<%# Eval("course_id") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="userid" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="user_id" runat="server" Text='<%# Eval("userId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Course Name" ItemStyle-Width="550px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("course_name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Course Title" ItemStyle-Width="420px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("course_title") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Delete">
                                                    <ItemTemplate>

                                                        <asp:Button ID="cancel" CssClass="btn btn-danger" runat="server" Text="Delete Course" OnClick="Button1_Delete" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                            </Columns>



                                        </asp:GridView>




                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <div class="alert alert-danger" id="err" runat="server" visible="false">
        Course Already Exists.
    </div>
    <div class="alert alert-success" id="succ" runat="server" visible="false">
        Course Add Succesfully.
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card m-b-20">
                <div class="card-body">




                    <div style="width: 100%; overflow-x: auto; overflow-y: auto">
                        <table style="width: 100%;">
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" EmptyDataText="No records Found">

                                            <Columns>
                                                <asp:TemplateField HeaderText="ID #" ItemStyle-Width="150px" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="courseidforregister" runat="server" Text='<%# Eval("course_id") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Course Name" ItemStyle-Width="541px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("course_name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Course Title" ItemStyle-Width="366px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="coursetitle" runat="server" Text='<%# Eval("course_title") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Update">
                                                    <ItemTemplate>

                                                        <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Register" OnClick="btnsubmitcourse_Click" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>



                                        </asp:GridView>




                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
        </div>
    </div>
</asp:Content>
