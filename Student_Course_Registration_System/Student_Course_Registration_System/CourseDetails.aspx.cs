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
    public partial class CourseDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["Useremail"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("select userId, course_name, Course.course_id,course_title from Students inner join Course on Students.course_id = Course.course_id where userid='" + Session["user_id"] + "'"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                           
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                dt.TableName = "Course";
                                sda.Fill(dt);
                                GridView1.DataSource = dt;
                                GridView1.DataBind();
                            }
                        }
                    }
                }




            }
            }

        protected void seemarks(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow gdv = btn.NamingContainer as GridViewRow;
            string cousrid = (gdv.FindControl("lblid") as Label).Text;
            string userid= (gdv.FindControl("userid") as Label).Text;
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select marks,total_marks,marks_type from Subjects_marks where userid='"+ userid + "' and course_id='"+ cousrid + "'"))
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
    }
}