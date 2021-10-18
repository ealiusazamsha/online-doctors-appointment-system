using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Online_Doctor_Appoinment_System
{
    public partial class Doctor_Registration : System.Web.UI.Page
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
                string autoId = "D" + date.Year.ToString() + date.Month.ToString() + date.Day.ToString() + date.Hour.ToString() + date.Minute.ToString() + date.Second.ToString() + date.Millisecond.ToString();
                txtbx_Doctor_ID.Text = autoId;
                txtbx_Doctor_ID.ReadOnly = true;
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
                sqlcmd.CommandText = "INSERT INTO [dbo].[Doctor_Registration] ([Doctor_Id],[Doctor_Name],[Speciality],[Designation],[Degree],[E_Mail],[Password],[Confirm_Password],[Phone],[Address],[Profile_Photo],[Approval]) VALUES(@Doctor_Id,@Doctor_Name,@Speciality,@Designation,@Degree,@E_Mail,@Password,@Confirm_Password,@Phone,@Address,@profileImg, 'No')";
                
                sqlcmd.Parameters.AddWithValue("@Doctor_Id", txtbx_Doctor_ID.Text);
                sqlcmd.Parameters.AddWithValue("@Doctor_Name", txtbx_Name.Text);


                sqlcmd.Parameters.AddWithValue("@Speciality", dropdownlist1.SelectedValue);


                sqlcmd.Parameters.AddWithValue("@Designation", txtbxDesignation.Text);

                sqlcmd.Parameters.AddWithValue("@Degree", txtbxDegree.Text);
                sqlcmd.Parameters.AddWithValue("@User_Name", txtbx_email.Text);
                sqlcmd.Parameters.AddWithValue("@E_Mail", txtbx_email.Text);
                sqlcmd.Parameters.AddWithValue("@Password", txtbx_Password.Text);
                sqlcmd.Parameters.AddWithValue("@Confirm_Password", txtbx_RePassword.Text);
                sqlcmd.Parameters.AddWithValue("@Phone", txtbx_Phone.Text);
                sqlcmd.Parameters.AddWithValue("@Address", txtbx_Address.Text);
                string ImagePath = profileImageUpload(txtbx_Doctor_ID.Text);
                sqlcmd.Parameters.AddWithValue("@profileImg", ImagePath);

                int flag = sqlcmd.ExecuteNonQuery();

                sqlcmd.CommandText = "INSERT INTO [dbo].[Log_In] ([User_Type],[User_Name],[Password]) VALUES('D', @User_Name,@Password)";
                flag = sqlcmd.ExecuteNonQuery();
                conn.Close();
                if (flag > 0)
                {
                    divmsg.Visible = true;
                    lblMsg.Text = "Save Successfully";
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

        private string profileImageUpload(string fileName)
        {
            string fileurl = "";
            try
            {
                FileUpload file = new FileUpload();
                file = FileUpProfileImage;
                if(file.HasFile && file.PostedFile.ContentLength<33554000)
                {
                    string getExtension = Path.GetExtension(file.FileName);

                    if(getExtension==".jpg"|| getExtension==".png"|| getExtension==".jpeg")
                    {
                        string uploaction = "/content/img/profilepic/";
                        string serverpath = HttpContext.Current.Server.MapPath(uploaction);

                        if(!Directory.Exists(serverpath))
                        {
                            Directory.CreateDirectory(serverpath);
                        }

                        serverpath = serverpath + fileName + getExtension;

                        file.PostedFile.SaveAs(serverpath);

                        fileurl = uploaction + fileName + getExtension;


                    }
                }

            }
            catch (Exception)
            {
                
                throw;
            }
            return fileurl;
        }

        private void initilizeFields()
        {
            txtbx_Doctor_ID.Text = "";
            txtbx_Name.Text = "";
            txtbxDesignation.Text = "";
            txtbxDegree.Text = "";
            txtbx_email.Text = "";
            txtbx_Password.Text = "";
            txtbx_RePassword.Text = "";
            txtbx_Phone.Text = "";
            txtbx_Address.Text = "";
            Response.Redirect("/Log_In.aspx");

        }
    }
}








