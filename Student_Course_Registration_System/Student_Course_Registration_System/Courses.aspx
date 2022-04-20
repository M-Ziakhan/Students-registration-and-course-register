<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Student_Course_Registration_System.Courses" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">





    <div class="row">
        <div class="col-md-12">
            <div class="card m-b-20">
                <div class="card-header">
                    <h3 class="card-title">Add New Course</h3>

                </div>
                <div class="alert alert-success col-md-6" style="align-self: center; text-align: center;" runat="server" id="sucdiv" visible="false">
                    Course Add Sucessfully
                </div>
              
                <div class="card-body">

                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="inputCity" class="col-form-label">Course Name</label>
                            <asp:TextBox class="form-control" ID="Coursename" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="Coursename" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="inputState" class="col-form-label">Course Title</label>

                            <asp:TextBox class="form-control" ID="titl" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="titl" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="inputZip" class="col-form-label">Discription</label>

                            <asp:TextBox class="form-control" ID="discrip" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ControlToValidate="discrip" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        
                            </div>
                    </div>

                    <div class="col-md-11">
                        <asp:Button ID="btnCourseSubmit" runat="server" Text="Add Course" CssClass="btn btn-primary" OnClick="btnCourseSubmit_Click" />

                    </div>


                </div>




               
            </div>
        </div>
    </div>

</asp:Content>
