using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MRPCustomer
{
    public partial class CustomerOrder : Form
    {
        public CustomerOrder()
        {
            InitializeComponent();
        }

        private void Form3_Load(object sender, EventArgs e)
        {

        }

        private void orderButton_Click(object sender, EventArgs e)
        {
            String connString = "Data Source=localhost;" +
           "Initial Catalog=projectDB;Integrated Security=true ";

            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            MessageBox.Show("Connection Open  !");


        }

        private void productButton_Click(object sender, EventArgs e)
        {
            String connString = "Data Source=localhost;" +
           "Initial Catalog=projectDB;Integrated Security=true ";

            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            MessageBox.Show("Connection Open  !");

            string query = "SELECT * FROM projectDB.Inventory WHERE Name = " + productNameBox.Text;

            SqlCommand insertCmd = new SqlCommand(query, conn);
            SqlDataReader reader;

            try
            {
                reader = insertCmd.ExecuteReader();
                MessageBox.Show("Saved");
            }
            catch (Exception exc)
            {
                MessageBox.Show(exc.Message);
            }

            //5
            insertCmd.Dispose();
            conn.Close();
        }

        private void priceButton_Click(object sender, EventArgs e)
        {
            string stringProducts = ProductIDsBox.Text;
            string[] stringArray = stringProducts.Split(',');
            string stringQuantity = quantityBox.Text;
            string[] quantityStrings = stringQuantity.Split(',');
            int[] intQuantities = new int[quantityStrings.Length];
            for (int i = 0; i < quantityStrings.Length; i++)
            {
                Int32.TryParse(quantityStrings[i], out intQuantities[i]);
            }

            String connString = "Data Source=localhost;" +
           "Initial Catalog=projectDB;Integrated Security=true ";

            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            MessageBox.Show("Connection Open  !");


        }

        private void customerButton_Click(object sender, EventArgs e)
        {
            String connString = "Data Source=localhost;" +
           "Initial Catalog=projectDB;Integrated Security=true ";

            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            MessageBox.Show("Connection Open  !");

            string query = "SELECT * FROM Customer WHERE Name = '" + Convert.ToString(customerNameBox.Text) + "'";

            SqlCommand insertCmd = new SqlCommand(query, conn);
            SqlDataReader reader = insertCmd.ExecuteReader();
            string resultString = "";
            try
            {
                if (reader.Read())
                {
                    resultString = Convert.ToString(reader["CustomerID"]);
                    resultString = resultString + ", " + Convert.ToString(reader["Name"]);
                    resultString = resultString + ", " + Convert.ToString(reader["AddressBillingStreet"]);
                    resultString = resultString + ", " + Convert.ToString(reader["AddressBillingCity"]);
                    resultString = resultString + ", " + Convert.ToString(reader["AddressBillingState"]);
                }
            }
            catch(Exception exc)
            {
                MessageBox.Show(exc.Message);
            }
            

            customerResult.Text = resultString;
            customerResult.Refresh();

            insertCmd.Dispose();
            conn.Close();
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}
