<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Login_regis.Master" CodeBehind="Registrtation.aspx.cs" Inherits="Student_Course_Registration_System.Registrtation" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        	<div style="text-align: -webkit-center; margin-top:2cm">
							<div class="col-md-5">
								<div class="card m-b-20">
									<div class="card-header"style="align-self: center">
										<h2 class="text-center heading">Sign Up</h2>

									</div>
									<div class="card-body">

										<div class="alert alert-success"  runat="server" id="successDiv" visible="false">
										  Successfully Registered
										</div>
										<div class="alert alert-danger" runat="server" id="errdiv" visible="false">
										 User Already Exists
										</div>
											<div class="form-row">
												<div class="form-group col-md-6">
													<div class="form-group">

														
														<asp:TextBox ID="NameBox" runat="server" CssClass="form-control" PlaceHolder="Full Name"></asp:TextBox>
														
													</div>
													<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Full Name Required" ForeColor="Red" ControlToValidate="NameBox"></asp:RequiredFieldValidator>
												</div>
				                             <div class="form-group col-md-6">
													<div class="form-group">
														
														<asp:TextBox ID="emailtBox" CssClass="form-control" runat="server" PlaceHolder="Email"></asp:TextBox>
													</div>
												 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email Required" ForeColor="Red" ControlToValidate="emailtBox"></asp:RequiredFieldValidator>
												<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailtBox" ErrorMessage="Enter proper email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>  
											 </div>
												<div class="form-group col-md-6">
													<div class="form-group">
													
													<asp:TextBox ID="Mobilenum" CssClass="form-control" runat="server" PlaceHolder="Mobile Number"></asp:TextBox>
													</div>
													<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Mobile No Required" ForeColor="Red" ControlToValidate="Mobilenum"></asp:RequiredFieldValidator>
													 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Mobilenum" ErrorMessage="Mobile number must be 11 digit" ForeColor="Red" ValidationExpression="\d{11}"></asp:RegularExpressionValidator> 
												</div>
												<div class="form-group col-md-6">
													<div class="form-group">
											
													<asp:TextBox ID="countryBox" CssClass="form-control" runat="server" PlaceHolder="country"></asp:TextBox>
													</div>
													<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Country Required" ForeColor="Red" ControlToValidate="countryBox"></asp:RequiredFieldValidator>
												
												</div>
												
												<div class="form-group col-md-6">
													
                                        <div class="input-icon-wrap">
                                            
                                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AppendDataBoundItems="True" TabIndex="4">
                                                <asp:ListItem Text="Male" Value="Male" />
                                                <asp:ListItem Text="Female" Value="Female" />
                                                <asp:ListItem Text="Transgender" Value="Transgender" />
                                            </asp:DropDownList>
                                        </div>
													
												
													</div>
											 <div class="form-group col-md-6">
													<div class="form-group">
													
														<asp:TextBox ID="password" type="password" CssClass="form-control" runat="server" PlaceHolder="Passwords"></asp:TextBox>
													</div>
												 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password Required" ForeColor="Red" ControlToValidate="password"></asp:RequiredFieldValidator>
												
												</div>
												
											</div>
										<a href="Login.aspx" class="btn btn-primary">Login</a>
										<%--<asp:Button ID="Loginbutton" runat="server" Text="Login"  CssClass="btn btn-primary" OnClick="btn_Click"/>--%>
										<asp:Button ID="btnSubmit" runat="server" Text="Sign in"  CssClass="btn btn-primary" OnClick="btnSubmit_Click"/>
											
										
									</div>
								</div>
							</div>
						</div>
    </div>
</asp:Content>
