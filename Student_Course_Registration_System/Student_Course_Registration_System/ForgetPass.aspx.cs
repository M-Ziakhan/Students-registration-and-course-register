using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Course_Registration_System
{
    public partial class ForgetPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string useremail = string.Empty;
            var email=  emailid.Text;
           // var userpass = passwordid.Text;
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
          

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select userEmail ,userPassword from User_registration where userEmail='" + email + "'",con))
                {

                    con.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    var datapres = sdr.Read();
                    if (datapres != false)
                    {
                        useremail = sdr["userEmail"].ToString();
                        var pass= sdr["userPassword"].ToString();
                        var body = "Your Password is:'" + Crypto.Base64Decode(pass)+ "'";
                        SendEmail(useremail,body);

                    }
                    else
                    {
                        errdiv.Visible = true;
                        Div1.Visible = false;
                        return;
                    }
                    con.Close();
                }
            }


        }


        int SendEmail(string email, string body)
        {
            try
            {

                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
               
                mail.From = new MailAddress("", "Student Portal");
                mail.To.Add(email);
                mail.Subject = "Forget Password Request";
                mail.Body = body;
                mail.IsBodyHtml = true;
                SmtpServer.EnableSsl = true;
                SmtpServer.Port = 587;
                SmtpServer.DeliveryMethod = SmtpDeliveryMethod.Network;

                SmtpServer.UseDefaultCredentials = false;
                SmtpServer.Credentials = new System.Net.NetworkCredential(mail.From.Address, "");

                SmtpServer.Send(mail);
                errdiv.Visible = false;
                Div1.Visible = true;
                return 1;

            }
            catch (Exception)
            {

               
                return 0;

            }
        }
    }
}