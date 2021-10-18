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
    public partial class Appointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["did"] != null)
                {
                    txtbx_Doctor_ID.Text = Session["did"].ToString();
                    txtbx_Doctor_ID.ReadOnly = true;
                    txtbx_Patent_ID.Text = Session["pid"].ToString();
                    txtbx_Patent_ID.ReadOnly = true;
                }
            }

            if (Session["name"] != null)
            {
                txtbx_Patent_ID.Text = Session["name"].ToString();
                txtbx_Patent_ID.ReadOnly = true;
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

                sqlcmd.CommandText = "INSERT INTO [dbo].[Appoinment_Form]([Date],[Session],[Patient_Id],[Doctor_Id],[Short_Description],[TreatDone]) VALUES (@Date,@Session,@Patient_Id,@Doctor_Id,@Short_Description, 'Pending')";

                sqlcmd.Parameters.AddWithValue("@Date", Convert.ToDateTime(txtbxDate.Text).ToString("yyyy-MM-dd"));
                sqlcmd.Parameters.AddWithValue("@Session", dropdownlist1.SelectedValue);
                sqlcmd.Parameters.AddWithValue("@Patient_Id", txtbx_Patent_ID.Text);
                sqlcmd.Parameters.AddWithValue("@Doctor_Id", txtbx_Doctor_ID.Text);
                sqlcmd.Parameters.AddWithValue("@Short_Description", TxtbxDescription.Text);

                int flag = sqlcmd.ExecuteNonQuery();
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
            txtbxDate.Text = "";
            txtbx_Patent_ID.Text = "";
            txtbx_Doctor_ID.Text = "";
            TxtbxDescription.Text = "";

            {

                Response.Redirect("/Manage_Appointment.aspx");
            
            }

        }
    }
}