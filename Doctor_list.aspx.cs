using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appoinment_System.Doctor
{
    public partial class Doctor_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                getDoctorlist();
        }
        private void getDoctorlist()
        {
            string conString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection(conString);


                conn.Open();

                string Query = "Select * from [Doctor_Registration]";
                SqlCommand sqlcmd = new SqlCommand(Query, conn);
                SqlDataReader sqldr = sqlcmd.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(sqldr);
                grdviewPatient.DataSource = dt;
                grdviewPatient.DataBind();


            }
            catch (Exception)
            {

                throw;
            }
        }


        public string getbtntext(string isapproved)
        {
            string strtext = "Approve";
            if (isapproved == "Yes")
                strtext = "Reject";

            return strtext;
        }

        protected void btnApproval_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            GridViewRow row = (GridViewRow)btn.NamingContainer;

            string drid = grdviewPatient.Rows[row.RowIndex].Cells[1].Text;

            string isapproved = "Yes";
            if (btn.Text == "Reject")
                isapproved = "No";
            string conString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection(conString);
                SqlCommand sqlcmd = new SqlCommand();

                conn.Open();
                sqlcmd.Connection = conn;
                sqlcmd.CommandType = CommandType.Text;
                sqlcmd.CommandText = "Update [Doctor_Registration] set [Approval]=@Approval where Doctor_Id=@Doctor_Id";

                sqlcmd.Parameters.AddWithValue("@Doctor_Id", drid);
                sqlcmd.Parameters.AddWithValue("@Approval", isapproved);
                int flag = sqlcmd.ExecuteNonQuery();
                conn.Close();


                if (flag > 0)
                {
                    getDoctorlist();
                }
                else
                {

                }

            }
            catch (Exception)
            {

            }
        }









        protected void lnkbtnDelete_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = (LinkButton)sender;

            GridViewRow row = (GridViewRow)lnkbtn.NamingContainer;

            string drid = grdviewPatient.Rows[row.RowIndex].Cells[1].Text;


            string conString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection(conString);
                SqlCommand sqlcmd = new SqlCommand();

                conn.Open();
                sqlcmd.Connection = conn;
                sqlcmd.CommandType = CommandType.Text;
                sqlcmd.CommandText = "Delete from [Doctor_Registration] where Doctor_Id=@Doctor_Id";

                sqlcmd.Parameters.AddWithValue("@Doctor_Id", drid);
                int flag = sqlcmd.ExecuteNonQuery();
                conn.Close();
                if (flag > 0)
                {
                    getDoctorlist();
                }
                else
                {

                }

            }
            catch (Exception)
            {

            }
        }
    }
}