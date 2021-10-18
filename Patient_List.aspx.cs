using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Online_Doctor_Appoinment_System.Admin
{
    public partial class Patient_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                getPatientlist();

        }

        private void getPatientlist()
        {

            string conString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection(conString);


                conn.Open();

                string Query = "Select * from [Patient_Registration]";
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

        }
    }
