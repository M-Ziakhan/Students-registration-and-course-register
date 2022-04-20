<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Login_regis.Master" CodeBehind="Login.aspx.cs" Inherits="Student_Course_Registration_System.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div>
        <div style="text-align: -webkit-center; margin-top: 2cm">
            <div class="col-md-4">
                <div class="card m-b-20">

                    <div class="alert alert-danger" runat="server" id="ErrDiv" visible="false">
                        UserId & Password Is not correct Try again..!!
                    </div>
                    <div class="alert alert-danger" runat="server" id="Div1" visible="false">
                        <asp:Label ID="er1" runat="server"></asp:Label>
                    </div>
                    <div class="card-header" style="align-self: center">
                        <h2 class="text-center heading">Login</h2>

                    </div>
                    <div class="card-body">


                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <div class="form-group">
                                    <label class="form-label" for="exampleInputEmail1">Email</label>
                                    <asp:TextBox ID="EmailBox2" CssClass="form-control" runat="server" PlaceHolder="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"  ErrorMessage="Email Required" ControlToValidate="EmailBox2"></asp:RequiredFieldValidator>
                                   
                                     </div>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailBox2" ErrorMessage="Enter proper email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>


                            <div class="form-group col-md-12">
                                <div class="form-group">
                                    <label class="form-label" for="exampleInputEmail1">Passwords</label>
                                    <asp:TextBox ID="passBox1" type="password" CssClass="form-control" runat="server" PlaceHolder="Passwords"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="Password Required" ControlToValidate="passBox1"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                       
                        <a href="Registrtation.aspx" class="btn btn-primary">Create New Account</a>
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Login" />

                    </div>
                     <a href="ForgetPass.aspx" >Forget Password</a>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
