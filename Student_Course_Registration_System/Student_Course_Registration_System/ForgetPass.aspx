<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Login_regis.Master" CodeBehind="ForgetPass.aspx.cs" Inherits="Student_Course_Registration_System.ForgetPass" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    
	<div style="text-align: -webkit-center; margin-top:2cm">

	
	<div class="col-lg-5">
	<div class="card">
									<div class="card-body">
										<div class="text-center text-muted">
											Don't have account yet? <a href="Registrtation.aspx">Sign up</a>
										</div>
										<div class="alert alert-danger" runat="server" id="errdiv" visible="false">
										 User Not Found
										</div>
										<div class="alert alert-success" runat="server" id="Div1" visible="false">
										Password Send To your Email
										</div>
											<div class="mt-4">
												<div class="card-title">Forgot password</div>
												
												<div class="form-group">
													<label class="form-label" for="exampleInputEmail1">Email address</label>
													<asp:TextBox ID="emailid" CssClass="form-control" runat="server"></asp:TextBox>
													<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"  ErrorMessage="Email Required" ControlToValidate="emailid"></asp:RequiredFieldValidator>
                                   
                                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailid" ErrorMessage="Enter proper email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                          
												</div>
											
												<div class="form-footer">
													<asp:Button ID="Button1" CssClass="btn btn-primary btn-block" runat="server" Text="Reset" OnClick="Button1_Click" />
													
												</div>
											</div>
										
										<div class="text-center text-muted mt-3 ">
											Forget it, <a href="Login.aspx">send me back</a> to the sign in screen.
										</div>
										
										
									</div>
								</div>
		</div>
		</div>
    </asp:Content>