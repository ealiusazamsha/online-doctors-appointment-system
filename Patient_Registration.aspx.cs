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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                genarateAutiId();
        }

        private void genarateAutiId()
        {
            try
            {
                DateTime date = DateTime.Now;
                string autoId = "P" + date.Year.ToString() + date.Month.ToString() + date.Day.ToString() + date.Hour.ToString() + date.Minute.ToString() + date.Second.ToString() + date.Millisecond.ToString();
                txtbx_Patent_ID.Text = autoId;
                txtbx_Patent_ID.ReadOnly=true;
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        protected void lnkbtnSend_Click(object sender, EventArgs e)
        {
            divmsg.Visible = true;
            string conString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection(conString);
                SqlCommand sqlcmd = new SqlCommand();

                conn.Open();
                sqlcmd.Connection = conn;
                sqlcmd.CommandType = CommandType.Text;
               
                sqlcmd.CommandText = "INSERT INTO [dbo].[Patient_Registration]([Patient_Id],[Patient_Name],[Gender],[Date_of_Birth],[E_Mail],[Password],[Confirm_Password],[Phone],[Address])VALUES(@Patient_Id, @Patient_Name,@gender, @Date_of_Birth,@E_Mail,@Password, @Confirm_Password, @Phone, @Address)";
             

                sqlcmd.Parameters.AddWithValue("@Patient_Id", txtbx_Patent_ID.Text);
                sqlcmd.Parameters.AddWithValue("@Patient_Name", txtbx_Name.Text);
                sqlcmd.Parameters.AddWithValue("@Date_of_Birth", Convert.ToDateTime(txtbxBirth.Text).ToString("yyyy-MM-dd"));
                if(rdoMale.Checked)
                    sqlcmd.Parameters.AddWithValue("@gender", "Male");
                else if (rdoFemale.Checked)
                    sqlcmd.Parameters.AddWithValue("@gender", "Female");
                else
                    sqlcmd.Parameters.AddWithValue("@gender", "");
                sqlcmd.Parameters.AddWithValue("@User_Name", txtbx_email.Text);
                sqlcmd.Parameters.AddWithValue("@E_Mail", txtbx_email.Text );
                sqlcmd.Parameters.AddWithValue("@Password", txtbx_Password.Text );
                sqlcmd.Parameters.AddWithValue("@Confirm_Password", txtbx_RePassword.Text);
                sqlcmd.Parameters.AddWithValue("@Phone", txtbx_Phone.Text);
                sqlcmd.Parameters.AddWithValue("@Address", txtbx_Address.Text );


                int flag = sqlcmd.ExecuteNonQuery();

                sqlcmd.CommandText = "INSERT INTO [dbo].[Log_In] ([User_Type],[User_Name],[Password]) VALUES('P', @User_Name,@Password)";
                 flag = sqlcmd.ExecuteNonQuery();

                conn.Close();
                if (flag > 0)
                {
                    divmsg.Visible = true;
                    lblMsg.Text = "Send Successfully";
                    initilizeFields();
                }
                else
                {
                    divmsg.Visible = true;
                    lblMsg.Text = "Sorry somthing worng.";
                }

            }
            catch (Exception)
            {

                throw;
            }


        }

        private void initilizeFields()
        {
            txtbx_Patent_ID.Text = "";
            txtbx_Name.Text = "";
            txtbxBirth.Text = "";
            txtbx_email.Text = "";
            txtbx_Password.Text = "";
            txtbx_RePassword.Text = "";
            txtbx_Phone.Text = "";
            txtbx_Address.Text = "";
            Response.Redirect("/Log_In.aspx");
        }
    }
}