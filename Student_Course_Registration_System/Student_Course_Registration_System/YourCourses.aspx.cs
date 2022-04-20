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
    public partial class YourCourses : System.Web.UI.Page
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
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM Course"))
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

        protected void btnCourseDelete_Click(object sender, EventArgs e)
        {

            Button btn = sender as Button;
            GridViewRow gdv = btn.NamingContainer as GridViewRow;
            string course_id = (gdv.FindControl("lblnum") as Label).Text;
            var Coursed = getcoursedetails(course_id);
            if (Convert.ToInt32(Coursed) != 0)
            {
                errdiv.Visible = true;
                return;

            }
            string query = "DELETE FROM Course WHERE course_id=@course_id";
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@course_id", course_id);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            this.BindGrid();
        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            string query = "SELECT * FROM Course";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
        private int getcoursedetails(string course_id)
        {
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {

                SqlCommand cm = new SqlCommand("select * from Students  inner join Course on Students.course_id = Course.course_id where Course.course_id='" + course_id + "'", con);
                int aa = 0;
                
                con.Open();
                SqlDataReader sdr = cm.ExecuteReader();
                var datapres=sdr.Read();
                if (datapres != false)
                {
                    aa = Convert.ToInt32(sdr["userId"]);
                }


                con.Close();
                return aa;
            }

        }
    }
}