using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MRPCustomer
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void createCustomer_Click(object sender, EventArgs e)
        {
            new Form2().Show();
        }

        private void createOrder_Click(object sender, EventArgs e)
        {
            new Form3().Show();
        }

    }
}
