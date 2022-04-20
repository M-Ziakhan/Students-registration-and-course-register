using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Course_Registration_System
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {

                 
                    string email = EmailBox2.Text;
                    string pass = Crypto.Base64Encode(passBox1.Text);
                    Session["Useremail"] = email;
                    Session["pass"] = pass;
                    SqlCommand cm = new SqlCommand("select userId from User_registration where userEmail ='" + email + "'", con);

                    con.Open();
                    SqlDataReader sdr = cm.ExecuteReader();
                    sdr.Read();
                    var aa = sdr["userId"].ToString();
                    Session["user_id"] = aa;
                    //var b= sdr["fullname"].ToString();
                    con.Close();
                    string returnid= GetRoleId(email, pass).ToString();
                     

                    con.Open();
                    string qry = "select * from User_registration where userEmail='" + email + "' and userPassword='" + pass + "'";
                    SqlCommand cmd = new SqlCommand(qry, con);
                    SqlDataReader sdr1 = cmd.ExecuteReader();
                    
                    if (sdr1.Read())
                    {
                        if (returnid == "1")
                        {
                            Response.Redirect("Default.aspx");
                            return;
                        }
                        else
                        {
                            Response.Redirect("StudentHome.aspx");
                            return;
                        }
                        
                    }
                    else
                    {
                        ErrDiv.Visible = true;
                        //Label4.Text = "UserId & Password Is not correct Try again..!!";

                    }
                    con.Close();
                }

               
            }
            catch (Exception)
            {
                Div1.Visible = true;
                er1.Text = "No Credential Present Like This";
                return;
                

            }
        }
        public int GetRoleId(string email, string pass)
        {
            int rolid;
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                var getrole = "select role_id from User_registration where userEmail='" + email + "' and userPassword='" + pass + "'";
                using (SqlCommand cmd = new SqlCommand(getrole,con))
                {
                    cmd.Connection = con;
                    con.Open();
                    rolid =Convert.ToInt32(cmd.ExecuteScalar());
                    //cmd.ExecuteScalar();
                    con.Close();
                }

                  return rolid;
            }
               
            

        }
        
        
    }
    //protected void btn_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("Registrtation.aspx");
    //}
    
}