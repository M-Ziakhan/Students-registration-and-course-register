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
    public partial class AddMarks : System.Web.UI.Page
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
                    //using (SqlCommand cmd = new SqlCommand("select * from User_registration where userEmail !='admin@gmail.com'"))
                    //{
                        
                        //con.Open();

                        //SqlCommand com = new SqlCommand("select course_id, course_name from Course", con);
                        // table name   
                        //SqlDataAdapter da = new SqlDataAdapter(com);
                        //DataSet ds = new DataSet();
                        //da.Fill(ds);  // fill dataset  
                        //              //assigning datasource to the dropdownlist           
                        //DropDownList1.DataSource = ds.Tables[0];
                        ////var aw=DropDownList1.DataTextField = ds.Tables[0].Columns["course_id"].ToString();
                        //DropDownList1.DataTextField = ds.Tables[0].Columns["course_name"].ToString(); // text field name of table dispalyed in dropdown, "Name" column from Students table       
                        
                        //DropDownList1.DataBind();  //binding dropdownlist 
                        //DropDownList1.Items.Insert(0, new ListItem("--Select Course --", "0"));



                       
                        SqlCommand cmd = new SqlCommand("select course_id, course_name from Course", con);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        DropDownList1.DataSource = ds;
                        DropDownList1.DataTextField = "course_name";
                        DropDownList1.DataValueField = "course_id";
                        DropDownList1.DataBind();

                        ds.Dispose();
                    //}
                    //
                    DropDownList1.Items.Insert(0, new ListItem("--Select Course --", "0"));


                }
                
            }

            btnMaerksSubmit.Visible = false;

        }


       
        protected void btnAddmarks_Click(object sender, EventArgs e)
        {
            //string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    Button btn = sender as Button;
            //    GridViewRow gdv = btn.NamingContainer as GridViewRow;
            //    string ID = (gdv.FindControl("lblid") as Label).Text;

            //    using (SqlCommand cmd = new SqlCommand("select userId, course_name, course_title from Students inner join Course on Students.course_id = Course.course_id where userid='" + ID + "'"))
            //    {
            //        using (SqlDataAdapter sda = new SqlDataAdapter())
            //        {

            //            cmd.Connection = con;
            //            sda.SelectCommand = cmd;
            //            using (DataTable dt = new DataTable())
            //            {
            //                dt.TableName = "Course";
            //                sda.Fill(dt);
            //                GridView1.DataSource = dt;
            //                GridView1.DataBind();
            //            }
            //        }
            //    }
            //}
        }
        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            string message = DropDownList1.SelectedItem.Text;
            var courseid = DropDownList1.SelectedItem.Value;
           
            
            string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
               using (SqlCommand cmd = new SqlCommand("select u.userId,c.course_id,c.course_name,u.fullname from  Students s inner join Course c on s.course_id = c.course_id inner join User_registration u on u.userId = s.userId where c.course_id ='"+courseid+ "'"))
               {
                   using (SqlDataAdapter sda = new SqlDataAdapter())
                    {

                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            dt.TableName = "Course";
                            sda.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                btnMaerksSubmit.Visible = true;
                            }
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }

        }



        //public void bindUsingDataSet()
        //{
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnection"].ConnectionString);
        //    SqlCommand cmd = new SqlCommand("Select * from Country", con);
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);

        //    DropDownList1.DataSource = ds;
        //    DropDownList1.DataTextField = "CountryName";
        //    DropDownList1.DataValueField = "Id";
        //    DropDownList1.DataBind();

        //    ds.Dispose();
        //}

        protected void btnMaerksSubmit_Click(object sender, EventArgs e)
        {

            foreach (GridViewRow row in GridView1.Rows)
            {
                
                TextBox txtAddress = (TextBox)row.FindControl("markstyp");
                TextBox totalmrks = (TextBox)row.FindControl("totalmrks");
                TextBox obtmrks = (TextBox)row.FindControl("TextBox1");

                if (String.IsNullOrEmpty(txtAddress.Text) || txtAddress.Text == null)
                {
                    errorDiv.Visible = true;
                    errorLbl.Text = "Marks Type Can't Be Empty";
                    btnMaerksSubmit.Visible = true;
                    return;
                }
                if (String.IsNullOrEmpty(totalmrks.Text) || totalmrks.Text == null)
                {
                    errorDiv.Visible = true;
                    errorLbl.Text = "Total Marks Can't Be Empty";
                    btnMaerksSubmit.Visible = true;
                    return;
                }
                if (String.IsNullOrEmpty(obtmrks.Text) || obtmrks.Text == null)
                {
                    errorDiv.Visible = true;
                    errorLbl.Text = "Obtain Marks Can't Be Empty";
                    btnMaerksSubmit.Visible = true;
                    return;
                }
                if(Convert.ToInt32(obtmrks.Text) >Convert.ToInt32(totalmrks.Text))
                {
                    errorDiv.Visible = true;
                    errorLbl.Text = "Err Obtain Marks Is graether Then Total Marks";
                    btnMaerksSubmit.Visible = true;
                    return;
                }

            }


            foreach (GridViewRow row in GridView1.Rows)
            {
                //var aaaa = (Label)row.FindControl("stdname");
                Label courseid = (Label)row.FindControl("ciid");
                Label userId = (Label)row.FindControl("userId");
                
                string marks_typ = ((TextBox)row.FindControl("markstyp")).Text;
                string total_mrks = ((TextBox)row.FindControl("totalmrks")).Text;
                string obt  = ((TextBox)row.FindControl("TextBox1")).Text;

                string query = "INSERT INTO Subjects_marks VALUES(@marks, @course_id,@total_marks,@marks_type,@userid)";
                string constr = ConfigurationManager.ConnectionStrings["Students_registrationConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@marks", obt); 
                        cmd.Parameters.AddWithValue("@userid", userId.Text);
                        cmd.Parameters.AddWithValue("@course_id", courseid.Text);
                        cmd.Parameters.AddWithValue("@total_marks", total_mrks);
                        cmd.Parameters.AddWithValue("@marks_type", marks_typ);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }

                }






            }
            errorDiv.Visible = false;
            errorLbl.Visible = false;
            successDiv.Visible = true;
            GridView1.Visible = false;
            
        }

    }
}