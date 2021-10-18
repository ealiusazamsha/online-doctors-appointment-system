using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appoinment_System
{
    public partial class Log_In : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Session.RemoveAll();

        }

        protected void lnkbtnSend_Click(object sender, EventArgs e)
        {



            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            con.Open();




            SqlCommand cmd = new SqlCommand("select * from [Log_In] where User_Name=@User_Name and Password=@Password", con);
            cmd.Parameters.AddWithValue("@User_Name", txtbx_email.Text);
            cmd.Parameters.AddWithValue("@Password", txtbx_Password.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                Session.Add("utype", dt.Rows[0][0].ToString());
                Session.Add("activeUser", dt.Rows[0]["User_Name"].ToString());



                if (dt.Rows[0][0].ToString() == "D")
                {

                    SqlCommand cmd2 = new SqlCommand("select [Doctor_Id] from [Doctor_Registration] where E_Mail=@User_Name", con);
                    cmd2.Parameters.AddWithValue("@User_Name", txtbx_email.Text);
                    // cmd1.Parameters.AddWithValue("@Password", txtbx_Password.Text);
                    SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                    DataTable dt2 = new DataTable();
                    da2.Fill(dt2);
                    if (dt2.Rows.Count > 0)
                    {

                        Session.Add("DID", dt2.Rows[0]["Doctor_Id"].ToString());

                    }


                    { 
                    Response.Redirect("/Appoinment_list.aspx");
                    }
                }


                else if (dt.Rows[0][0].ToString() == "S")
                {

                    SqlCommand cmd3 = new SqlCommand("select [User_Name] from [Log_In] where User_Name=@User_Name", con);
                    cmd3.Parameters.AddWithValue("@User_Name", txtbx_email.Text);
                    // cmd1.Parameters.AddWithValue("@Password", txtbx_Password.Text);
                    SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                    if (dt3.Rows.Count > 0)
                    {

                        Session.Add("SID", dt3.Rows[0]["User_Name"].ToString());

                    }

                    {

                        Response.Redirect("/Doctor_list.aspx");
                    }


                }

                else
                {
                    SqlCommand cmd1 = new SqlCommand("select [Patient_Id] from [Patient_Registration] where E_Mail=@User_Name", con);
                    cmd1.Parameters.AddWithValue("@User_Name", txtbx_email.Text);
                    // cmd1.Parameters.AddWithValue("@Password", txtbx_Password.Text);
                    SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    if (dt1.Rows.Count > 0)
                    {

                        Session.Add("pid", dt1.Rows[0]["Patient_Id"].ToString());

                    }
                    Response.Redirect("/Doctors_veiw.aspx");
                }

               



            }
            else
            {
                divmsg.Visible = true;
                lblMsg.Text = "Invalid User Name or Password.";
            }



        }
    }
}





// SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
// conn.Open();

//string query = "SELECT Count(*) FROM Log_In WHERE User_Type='" + 'P' + "' and User_Name='" + txtbx_email.Text + "' and Password='" + txtbx_Password.Text + "'";

// SqlCommand cmd = new SqlCommand(query, conn);
// String output = cmd.ExecuteScalar().ToString();

//  if (output == "1")
//   {
// Login True
// Session["name"] = txtbx_email.Text;
//Session["password"] = txtbx_Password.Text;
// Session["type"] = User_Type.Text;
//Response.Write("Login Successfully");
//   Response.Redirect("Appointment.aspx");
//}
//else
//{
//Response.Write("Login Failed");
//}












        //string conString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            
          //SqlConnection conn = null;


        // try
          // {
             //  conn = new SqlConnection(conString);


             //conn.Open();

             //string Query = "Select * from [Log_In] where User_Name=@User_Name and Password=@Password";

                
           //SqlCommand sqlcmd = new SqlCommand(Query, conn);
          // SqlDataReader sqldr = sqlcmd.ExecuteReader();

           // sqlcmd.Parameters.AddWithValue("@User_Name", txtbx_email.Text);
            //sqlcmd.Parameters.AddWithValue("@Password", txtbx_Password.Text);
               



         //}
           // catch (Exception)
            //{
              // throw;
           // }
                   
        //}
   // }
    //}
