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
            // TODO: This line of code loads data into the 'projectDBDataSet.Invoice' table. You can move, or remove it, as needed.
            //this._taInvoice.Fill(this.customerDataSet.Invoice);
            // TODO: This line of code loads data into the 'projectDBDataSet.Customer' table. You can move, or remove it, as needed.
           // this._taCustomer.Fill(this.customerDataSet.Customer);

        }
        /// <summary>
        /// Event handler for saving a new record being added to the table 
        /// 
        /// </summary>
        /// <param name="sender">the save button</param>
        /// <param name="e"></param>
        private void customerBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            //validate data
            this.Validate();

            //make any temporary changes into final
            this._bndCustomerList.EndEdit();

            //save all changes to database
            this._taCustomerAdapterManager.UpdateAll(this.customerDataSet);

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

            SqlCommand insertCmd = new SqlCommand("NewCustomer", conn);
            insertCmd.CommandType = CommandType.StoredProcedure;


            //pass values to @parameters in variable sql
            insertCmd.Parameters.Add(new SqlParameter("name", this._txtName.Text));
            insertCmd.Parameters.Add(new SqlParameter("addressShippingStreet", this._txtAddressShippingStreet.Text));
            insertCmd.Parameters.Add(new SqlParameter("addressShippingCity", this._txtAddressShippingCity.Text));
            insertCmd.Parameters.Add(new SqlParameter("addressShippingState", this._txtAddressShippingState.Text));

            insertCmd.Parameters.Add(new SqlParameter("addressBillingStreet", this._txtAddressBillingStreet.Text));
            insertCmd.Parameters.Add(new SqlParameter("addressBillingCity", this._txtAddressBillingCity.Text));
            insertCmd.Parameters.Add(new SqlParameter("addressBillingState", this._txtAddressBillingState.Text));
            insertCmd.Parameters.Add(new SqlParameter("addressDefaultCreditCard", this._txtDefaultCreditCard.Text));
            insertCmd.Parameters.Add(new SqlParameter("addressCreditReference", this._txtCreditReferenceID.Text));


            try
            {
                SqlDataReader reader = insertCmd.ExecuteReader();
                MessageBox.Show("Saved");
            } catch (Exception exc) {
                MessageBox.Show(exc.Message);
            }

            //5
            insertCmd.Dispose();
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

        private void _txtName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
