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
    public partial class Registrtation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var username = NameBox.Text;
            var useremail = emailtBox.Text;
            var usermobilenum = Mobilenum.Text;
            var usercountry = countryBox.Text;
            var usergender = DropDownList1.Text;
            var userPassword = Crypto.Base64Encode(password.Text);
            var date = DateTime.Today;
            var emailexist = userexist(useremail);
            if(emailexist==true)
            {
                errdiv.Visible = true;
                successDiv.Visible = false;
                return;
            }
            string query = "INSERT INTO User_registration VALUES(@fullname, @userEmail,@userPassword,@country,@gender,@mobile,@Enroll_date,@role_id)";
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@fullname", username);
                    cmd.Parameters.AddWithValue("@userEmail", useremail);
                    cmd.Parameters.AddWithValue("@userPassword", userPassword);
                   
                    cmd.Parameters.AddWithValue("@country", usercountry);
                    cmd.Parameters.AddWithValue("@gender", usergender);
                    cmd.Parameters.AddWithValue("@mobile", usermobilenum);
                    cmd.Parameters.AddWithValue("@Enroll_date", date);
                    cmd.Parameters.AddWithValue("@role_id", 2);

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

            }
            successDiv.Visible = true;
            errdiv.Visible = false;
            ClearForm();



        }
        public static bool userexist(string useremail)
        {
            bool exists = false;
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cm = new SqlCommand("select userEmail from User_registration where userEmail = '"+ useremail + "'", con);

                con.Open();
                SqlDataReader sdr = cm.ExecuteReader();
                var datapres = sdr.Read();
                if (datapres != false)
                {
                    exists =true;
                }
                else
                {
                    exists = false;
                }
                con.Close();
                return exists;
            }

        }
        protected void btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }


        protected void ClearForm()
        {

            NameBox.Text = string.Empty;
            emailtBox.Text = string.Empty;
            Mobilenum.Text = string.Empty;
            countryBox.Text = string.Empty;
            DropDownList1.Text = string.Empty;
            password.Text = string.Empty;
        }

       
           
    }
}