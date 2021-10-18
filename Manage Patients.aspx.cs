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
    public partial class Manage_Patients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                getManagelist();
        }


        private void getManagelist()
        {

            string conString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection(conString);


                conn.Open();

                string Query = "SELECT a.[Serial_Num], cast( [Date] as Date) as Date,[Session],a.Patient_Id,c.[Patient_Name],c.Phone as PatientPhone,a.[Doctor_Id],b.Doctor_Name,b.Speciality,b.Designation ,b.Phone as DoctorPhone,a.[TreatDone] FROM [dbo].[Appoinment_Form] a join dbo.Doctor_Registration b on a.Doctor_Id=b.Doctor_Id join dbo.Patient_Registration c on a.Patient_Id=c.Patient_Id where a.Doctor_Id=@Doctor_Id";
                SqlCommand sqlcmd = new SqlCommand(Query, conn);
                sqlcmd.Parameters.AddWithValue("@Doctor_Id", Session["DID"].ToString());
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



        public string getbtntext(string isdone)
        {
            string strtext = "Done";
            if (isdone == "Done")
                strtext = "Pending";

            return strtext;
        }

        protected void btnTreatDone_Click(object sender, EventArgs e)
        {
                        Button btn = (Button)sender;

            GridViewRow row = (GridViewRow)btn.NamingContainer;
            string pid = grdviewPatient.Rows[row.RowIndex].Cells[3].Text;

            string drid = grdviewPatient.Rows[row.RowIndex].Cells[6].Text;

            string isdone = "Done";
            if (btn.Text == "Pending")
                isdone = "Pending";
            string conString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection(conString);
                SqlCommand sqlcmd = new SqlCommand();

                conn.Open();
                sqlcmd.Connection = conn;
                sqlcmd.CommandType = CommandType.Text;
                sqlcmd.CommandText = "Update [Appoinment_Form] set [TreatDone]=@TreatDone where Patient_Id=@Patient_Id and Doctor_Id=@Doctor_Id";

                sqlcmd.Parameters.AddWithValue("@Patient_Id", pid);
                sqlcmd.Parameters.AddWithValue("@Doctor_Id", drid);
                sqlcmd.Parameters.AddWithValue("@TreatDone", isdone);
                int flag = sqlcmd.ExecuteNonQuery();
                conn.Close();


                if (flag > 0)
                {
                    getManagelist ();
                }
                else
                {

                }

            }
            catch (Exception)
            {

            }
        }

        protected void lnkbtnCancel_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = (LinkButton)sender;

            GridViewRow row = (GridViewRow)lnkbtn.NamingContainer;

            string pid = grdviewPatient.Rows[row.RowIndex].Cells[3].Text;

            string drid = grdviewPatient.Rows[row.RowIndex].Cells[6].Text;


            string conString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection(conString);
                SqlCommand sqlcmd = new SqlCommand();

                conn.Open();
                sqlcmd.Connection = conn;
                sqlcmd.CommandType = CommandType.Text;
                sqlcmd.CommandText = "Delete from [Appoinment_Form] where Patient_Id=@Patient_Id and Doctor_Id=@Doctor_Id";

                sqlcmd.Parameters.AddWithValue("@Patient_Id", pid);

                sqlcmd.Parameters.AddWithValue("@Doctor_Id", drid);


                int flag = sqlcmd.ExecuteNonQuery();
                conn.Close();
                if (flag > 0)
                {
                    getManagelist();
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
