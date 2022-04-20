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
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["Useremail"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }


        protected void btnCourseSubmit_Click(object sender, EventArgs e)
        {
            var coursename=Coursename.Text;
            var title = titl.Text;
            var discription = discrip.Text;

            string query = "INSERT INTO Course VALUES(@course_name, @course_title,@description)";
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@course_name", coursename);
                    cmd.Parameters.AddWithValue("@course_title", title);
                    cmd.Parameters.AddWithValue("@description", discription);


                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                sucdiv.Visible = true;
                ClearForm();
            }

        }
        protected void ClearForm()
        {

            Coursename.Text = string.Empty;
            titl.Text = string.Empty;
            discrip.Text = string.Empty;
            
        }
      

        
    }
}