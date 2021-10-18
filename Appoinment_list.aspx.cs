using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appoinment_System.Appoinment
{
    public partial class Appoinment_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                getAppoinmentlist();
        }
        private void getAppoinmentlist()
        {
            string conString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection(conString);


                conn.Open();

                string Query = "SELECT a.[Serial_Num], cast( [Date] as Date) as Date,[Session],a.Patient_Id,c.[Patient_Name],c.Phone as PatientPhone,a.[Doctor_Id],b.Doctor_Name,b.Speciality,b.Designation ,b.Phone as DoctorPhone FROM [dbo].[Appoinment_Form] a join dbo.Doctor_Registration b on a.Doctor_Id=b.Doctor_Id join dbo.Patient_Registration c on a.Patient_Id=c.Patient_Id where a.Doctor_Id=@Doctor_Id and TreatDone='Pending'";
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
    }
}