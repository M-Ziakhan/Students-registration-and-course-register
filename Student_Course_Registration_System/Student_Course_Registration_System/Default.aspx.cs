using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Course_Registration_System
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if(Session["Useremail"]==null)
                {
                    Response.Redirect("Login.aspx");
                }
                var name="";
                string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    var getrole = "select fullname from User_registration where userEmail='" + Session["Useremail"] + "' and userPassword='" + Session["pass"] + "'";
                    using (SqlCommand cmd = new SqlCommand(getrole, con))
                    {
                        cmd.Connection = con;
                        con.Open();
                        name = cmd.ExecuteScalar().ToString();
                        Session["adminname"] = name;
                        con.Close();
                    }

                    using (SqlCommand cmd = new SqlCommand("select * from User_registration where userEmail !='admin@gmail.com'"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                dt.TableName = "User_registration";
                                sda.Fill(dt);
                                GridView1.DataSource = dt;
                                GridView1.DataBind();
                            }
                        }
                    }
                }
               
            }
        }

        
       protected void btnstdDetails_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow gdv = btn.NamingContainer as GridViewRow;
            string userid = (gdv.FindControl("lblid") as Label).Text;
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select userId, course_name, Course.course_id,course_title from Students inner join Course on Students.course_id = Course.course_id where userid='" + userid + "'"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {

                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            dt.TableName = "Course";
                            sda.Fill(dt);
                            GridView2.DataSource = dt;
                            GridView2.DataBind();
                        }
                    }
                }
            }


        }

      
        protected void SeeMarks(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow gdv = btn.NamingContainer as GridViewRow;
            string cousrid = (gdv.FindControl("cours_id") as Label).Text;
            string userid = (gdv.FindControl("user_id") as Label).Text;
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select marks,total_marks,marks_type from Subjects_marks where userid='" + userid + "' and course_id='" + cousrid + "'"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {

                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            dt.TableName = "Course";
                            sda.Fill(dt);
                            GridView3.DataSource = dt;
                            GridView3.DataBind();
                        }
                    }
                }
            }



        }
    }
}