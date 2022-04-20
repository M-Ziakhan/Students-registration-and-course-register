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
    public partial class StudentHome : System.Web.UI.Page
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
                                GridView1.DataSource = dt;
                                GridView1.DataBind();
                            }
                        }
                    }
                }
            }
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (Session["Useremail"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            var email = Session["Useremail"];
            //var courseid = lblid.Text;
            Button btn = sender as Button;
            GridViewRow gdv = btn.NamingContainer as GridViewRow;
            string ID = (gdv.FindControl("lblid") as Label).Text;
            //string query = "select fullname,userId from User_registration where userEmail ='" + email+"'";
           
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cm = new SqlCommand("select userId from User_registration where userEmail ='" + email + "'", con);

                con.Open();
                SqlDataReader sdr = cm.ExecuteReader();
                sdr.Read();
                var aa = sdr["userId"].ToString();
                Session["userid"] = aa;
                //var b= sdr["fullname"].ToString();
                con.Close();

                var exists = courseExist(aa, ID);
                if(Convert.ToInt32(exists) != 0)
                {
                    err.Visible = true;
                    return;
                }
                string insert = "INSERT INTO Students VALUES(@userId,@course_id)";
                using (SqlCommand cmd = new SqlCommand(insert))
                {
                    cmd.Parameters.AddWithValue("@userId", aa);
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


        protected string courseExist(string userid, string courseid)
        {
            int exist = 0;
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cm = new SqlCommand("select * from Students where userid='"+ userid + "' and course_id='"+ courseid + "'", con);

                con.Open();
                SqlDataReader sdr = cm.ExecuteReader();
                var read=sdr.Read();
                if(read !=false)
                {
                    exist =Convert.ToInt32(sdr["userId"]);
                }
                     
                
                    
                
                con.Close();
                return exist.ToString();
            }
           
            }
    }


    
}