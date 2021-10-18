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
    public partial class Doctors_veiw : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getAlldoctorList();
            }
        }





        private void getAlldoctorList()
        {

            string conString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection(conString);


                conn.Open();

                string Query = "Select * from [Doctor_Registration] where Approval='Yes'";
                SqlCommand sqlcmd = new SqlCommand(Query, conn);
                SqlDataReader sqldr = sqlcmd.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(sqldr);
                RepeaterDoctorList.DataSource = dt;
                RepeaterDoctorList.DataBind();



            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void lnkbtnAppoinment_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lnkbtn = (LinkButton)sender;
                string doctorId = lnkbtn.CommandArgument.ToString();
                Session.Add("dId", doctorId);


                Response.Redirect("/Appointment .aspx");

            }

            catch (Exception)
            {

                throw;
            }
        }




        protected void lnkbtnSearch_Click(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection(conString);


                conn.Open();

                string Query = "Select * from [Doctor_Registration] where Approval='Yes' and Speciality=@DoctorSkill";

                SqlCommand sqlcmd = new SqlCommand(Query, conn);
                sqlcmd.Parameters.AddWithValue("@DoctorSkill", drSkills.SelectedItem.Text);
                SqlDataReader sqldr = sqlcmd.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(sqldr);
                RepeaterDoctorList.DataSource = dt;
                RepeaterDoctorList.DataBind();



            }
            catch (Exception)
            {

                throw;
            }
        }

    }
}