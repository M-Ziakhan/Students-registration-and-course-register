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
    public partial class StdDetails : System.Web.UI.Page
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

        protected void btnassign_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow gdv = btn.NamingContainer as GridViewRow;
            string userid = (gdv.FindControl("lblid") as Label).Text;

            Session["forgridrefresh"] = userid;

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
        protected void Button1_Delete(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow gdv = btn.NamingContainer as GridViewRow;
            string cours_idd = (gdv.FindControl("cours_id") as Label).Text;
            string users_idd = (gdv.FindControl("user_id") as Label).Text;
           
            string query = "delete from Students where userId='"+ users_idd + "' and course_id='"+ cours_idd + "'";
            string querymarks= "delete from Subjects_marks where userId='" + users_idd + "' and course_id='" + cours_idd + "'";
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            //delete record from students table course
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@userId", users_idd);
                    cmd.Parameters.AddWithValue("@course_id", cours_idd);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            // delete record from marks table against course
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(querymarks))
                {
                    cmd.Parameters.AddWithValue("@userId", users_idd);
                    cmd.Parameters.AddWithValue("@course_id", cours_idd);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            this.BindGrid();

        }
        
        protected void Button1_add(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow gdv = btn.NamingContainer as GridViewRow;
            
            Session["useridForAddCourse"]  =(gdv.FindControl("lblid") as Label).Text;
            var uisd = Session["useridForAddCourse"];
            Session.Add("useridCourse", uisd);
            var asd = Session["useridCourse"].ToString();

            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select course_id, course_name, course_title from Course"))
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
        protected void btnsubmitcourse_Click(object sender, EventArgs e)
        {
            var userid = string.Empty;
            Button btn = sender as Button;
            GridViewRow gdv = btn.NamingContainer as GridViewRow;
            string ID = (gdv.FindControl("courseidforregister") as Label).Text;
            //string cc= (gdv.FindControl("lblid") as Label).Text;
            //string query = "select fullname,userId from User_registration where userEmail ='" + email+"'";

            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
              if (Session["useridCourse"].ToString() != null)
                {
                    userid = Session["useridCourse"].ToString();
                }
             
                

                var exists = courseExist(userid, ID);
                if (Convert.ToInt32(exists) != 0)
                {
                    err.Visible = true;
                    return;
                }
                string insert = "INSERT INTO Students VALUES(@userId,@course_id)";
                using (SqlCommand cmd = new SqlCommand(insert))
                {
                    cmd.Parameters.AddWithValue("@userId", userid);
                    cmd.Parameters.AddWithValue("@course_id", ID);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                succ.Visible = true;
                err.Visible = false;

            }
        }
        protected int courseExist(string userid, string courseid)
        {
            int exist = 0;
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cm = new SqlCommand("select * from Students where userid='" + userid + "' and course_id='" + courseid + "'", con);

                con.Open();
                SqlDataReader sdr = cm.ExecuteReader();
                var datapres=sdr.Read();
                if (datapres != false)
                {
                    exist = Convert.ToInt32(sdr["userId"]);
                }
                    
                


                con.Close();
                return exist;
            }

        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select userId, course_name, Course.course_id,course_title from Students inner join Course on Students.course_id = Course.course_id where userid='" + Session["forgridrefresh"] + "'"))
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