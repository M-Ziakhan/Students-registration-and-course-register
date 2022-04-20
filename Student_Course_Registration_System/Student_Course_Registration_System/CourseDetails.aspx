<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/students.master" CodeBehind="CourseDetails.aspx.cs" Inherits="Student_Course_Registration_System.CourseDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 100%; overflow-x: auto; overflow-y: auto">
        <table style="width: 100%;">
            <tbody>
                <tr style="background-color: lavender">
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">

                            <Columns>
                                <asp:TemplateField HeaderText="Courseid" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("course_id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="userid" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="userid" runat="server" Text='<%# Eval("userId") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Update">
                                    <ItemTemplate>

                                        <asp:Button ID="marksbtn" CssClass="btn btn-success" runat="server" Text=" See Marks" OnClick="seemarks" />
                                    </ItemTemplate>
                                </asp:TemplateField>


                            </Columns>



                        </asp:GridView>

                    </td>
                </tr>
            </tbody>
        </table>
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

                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
                                            <Columns>


                                                <asp:TemplateField HeaderText="Marks type" ItemStyle-Width="300">
                                                    <ItemTemplate>
                                                        <asp:Label ID="mrktp" runat="server" Text='<%# Eval("marks_type") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Total Marks" ItemStyle-Width="300">
                                                    <ItemTemplate>
                                                        <asp:Label ID="ttlmrks" runat="server" Text='<%# Eval("total_marks") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="obtain marks" ItemStyle-Width="300">
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


