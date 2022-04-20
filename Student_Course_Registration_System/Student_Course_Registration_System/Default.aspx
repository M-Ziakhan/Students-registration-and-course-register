<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Student_Course_Registration_System._Default" %>

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

                                                <asp:TemplateField HeaderText="userId" ItemStyle-Width="150" Visible="False">
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
                                                <asp:TemplateField HeaderText="Student Details">
                                                    <ItemTemplate>
                                                        <asp:Button ID="detailebtn" runat="server" Text="Student Details" CssClass="btn btn-info" OnClick="btnstdDetails_Click" />
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

                                                <asp:TemplateField HeaderText="Uploaded Marks">
                                                    <ItemTemplate>

                                                        <asp:Button ID="seemarks" CssClass="btn btn-info" runat="server" Text="Std Marks" OnClick="SeeMarks" />
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
                    <div style="width: 100%; overflow-x: auto; overflow-y: auto; margin-top: 1cm">
                        <table style="width: 100%;">
                            <tbody>
                                <tr>
                                    <td>

                                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" EmptyDataText="No records Found">
                                            <Columns>


                                                <asp:TemplateField HeaderText="Marks type" ItemStyle-Width="450">
                                                    <ItemTemplate>
                                                        <asp:Label ID="mrktp" runat="server" Text='<%# Eval("marks_type") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Total Marks" ItemStyle-Width="350">
                                                    <ItemTemplate>
                                                        <asp:Label ID="ttlmrks" runat="server" Text='<%# Eval("total_marks") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="obtain marks" ItemStyle-Width="350">
                                                    <ItemTemplate>
                                                        <asp:Label ID="obmrks" runat="server" Text='<%# Eval("marks") %>'></asp:Label>
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
