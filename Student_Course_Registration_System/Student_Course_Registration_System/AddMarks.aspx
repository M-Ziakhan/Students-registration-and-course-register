<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="AddMarks.aspx.cs" Inherits="Student_Course_Registration_System.AddMarks" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-12">
            <div class="card m-b-20">
                <div class="card-header">
                    <h3 class="card-title">Add Marks Here </h3>

                </div>
                <div class="card-body">

                    <b>
                        <h4>Select Course</h4>
                    </b>

                    <div class="col-md-12">
                        <asp:DropDownList ID="DropDownList1" CssClass="form-control mySelecBox" runat="server" Width="280px" AutoPostBack="True" OnSelectedIndexChanged="OnSelectedIndexChanged">
                        </asp:DropDownList>
                    </div>


                    <div class="col-md-12">
                        <div class="card m-b-20">
                            <div class="card-body">


                                <div class="alert alert-danger" runat="server" id="errorDiv" visible="false">
                                        <asp:Label ID="errorLbl" runat="server"></asp:Label>
                                    </div>
                                <div class="row">
                                    <div class="alert alert-success" runat="server" id="successDiv" visible="false">
                                        Successfully Add Marks
                                    </div>
                                    <div style="width: 100%; overflow-x: auto; overflow-y: auto">
                                        <table style="width: 100%;">
                                            <tbody>
                                                <tr style="background-color: lavender">
                                                    <td>




                                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="No records Found">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="userId" ItemStyle-Width="300" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="userId" runat="server" Text='<%# Eval("userId") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="cid" ItemStyle-Width="300" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="ciid" runat="server" Text='<%# Eval("course_id") %>'></asp:Label>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Student Name" ItemStyle-Width="300">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="stdname" runat="server" Text='<%# Eval("fullname") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="course name" ItemStyle-Width="300">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="crsname" runat="server" Text='<%# Eval("course_name") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Marks Type">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="markstyp" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="test" ControlToValidate="markstyp" Display="Dynamic" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Total Marks">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="totalmrks" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="test" ControlToValidate="totalmrks" Display="Dynamic" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Obt Marks">
                                                                    <%--<ItemTemplate>
                                                                        <asp:TextBox ID="obtmarks" runat="server"></asp:TextBox>

                                                                    </ItemTemplate>--%>
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="test" ControlToValidate="TextBox1" Display="Dynamic" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                            </Columns>

                                                        </asp:GridView>



                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row" style="margin-top: 3cm"></div>
                                    <div class="col-md-11 right">
                                        <asp:Button ID="btnMaerksSubmit" runat="server" Text=" +Upload" CssClass="btn btn-primary" OnClick="btnMaerksSubmit_Click" />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




</asp:Content>
