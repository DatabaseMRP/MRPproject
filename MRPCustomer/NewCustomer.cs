using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MRPCustomer
{
    /// <summary>
    /// Class that represents the ...
    /// </summary>
    public partial class NewCustomer : Form
    {
       // public int contactID { get; set; }
       // public SqlConnection conn { get; private set; }

        //public string .....
       
        
        /// <summary>
        /// Constructor of the form which will ...
        /// </summary>
        public NewCustomer()
        {
            InitializeComponent();
     /*   
            String connString = "Data Source=localhost;" +
            "Initial Catalog=projectDB;Integrated Security=true ";

            conn = new SqlConnection(connString);
            conn.Open();
            Console.WriteLine("connected?");*/
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'projectDBDataSet.Customer' table. You can move, or remove it, as needed.
            this.customerTableAdapter.Fill(this.projectDBDataSet.Customer);

        }
        /// <summary>
        /// Event handler for saving a new record being added to the table 
        /// 
        /// </summary>
        /// <param name="sender">the save button</param>
        /// <param name="e"></param>
        private void customerBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.customerBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.projectDBDataSet);

        }

        private void customerIDTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            String connString = "Data Source=localhost;" +
           "Initial Catalog=projectDB;Integrated Security=true ";

            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            Console.WriteLine("connected?");
            MessageBox.Show("Connection Open  !");


            string sql = "INSERT INTO CUSTOMER VALUES(@name, @addressShipping, @addressBillingStreet, @addressBillingCity," +
                "@addressBillingState, @addressDefaultCreditCard, @addressCreditReference";

                /*
                "" + _txtName.Text + ","
            + _txtAddressShipping.Text + "," + _txtAddressBillingStreet.Text + ","
            + _txtAddressBillingCity.Text + "," + _txtAddressBillingState.Text
            + _txtDefaultCreditCard.Text + "," + _txtCreditReferenceID.Text + ")";
            */

            SqlCommand cmd = new SqlCommand(sql, conn);

            SqlDataAdapter adapter = new SqlDataAdapter();

            adapter.InsertCommand = new SqlCommand(sql, conn);
            adapter.InsertCommand.ExecuteNonQuery();

            cmd.Dispose();
            conn.Close();

            /*
            if (rows > 0)
                {
                    Console.WriteLine("successfully inserted customer");
                }
            else
                {
                    Console.WriteLine("failed customer insert");
                }
           */
            }

        private void customerIDLabel_Click(object sender, EventArgs e)
        {

        }

        private void bindingNavigatorMoveNextItem_Click(object sender, EventArgs e)
        {

        }
    }
}
