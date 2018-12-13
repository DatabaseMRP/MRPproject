namespace MRPCustomer
{
    partial class NewCustomer
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.Label lblName;
            System.Windows.Forms.Label lblAddressShipping;
            System.Windows.Forms.Label lblAddressBillingStreet;
            System.Windows.Forms.Label lblAddressBillingCity;
            System.Windows.Forms.Label lblAddressBillingState;
            System.Windows.Forms.Label lblDefaultCreditCard;
            System.Windows.Forms.Label lblcreditReferecenceID;
            System.Windows.Forms.Label label2;
            System.Windows.Forms.Label label3;
            this.customerDataSet = new MRPCustomer.projectDBDataSet();
            this._bndCustomerList = new System.Windows.Forms.BindingSource(this.components);
            this._taCustomer = new MRPCustomer.projectDBDataSetTableAdapters.CustomerTableAdapter();
            this._taCustomerAdapterManager = new MRPCustomer.projectDBDataSetTableAdapters.TableAdapterManager();
            this._txtName = new System.Windows.Forms.TextBox();
            this._txtAddressShippingStreet = new System.Windows.Forms.TextBox();
            this._txtAddressBillingStreet = new System.Windows.Forms.TextBox();
            this._txtAddressBillingCity = new System.Windows.Forms.TextBox();
            this._txtAddressBillingState = new System.Windows.Forms.TextBox();
            this._txtDefaultCreditCard = new System.Windows.Forms.TextBox();
            this._txtCreditReferenceID = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this._bndInvoiceList = new System.Windows.Forms.BindingSource(this.components);
            this._taInvoice = new MRPCustomer.projectDBDataSetTableAdapters.InvoiceTableAdapter();
            this._txtAddressShippingCity = new System.Windows.Forms.TextBox();
            this._txtAddressShippingState = new System.Windows.Forms.TextBox();
            lblName = new System.Windows.Forms.Label();
            lblAddressShipping = new System.Windows.Forms.Label();
            lblAddressBillingStreet = new System.Windows.Forms.Label();
            lblAddressBillingCity = new System.Windows.Forms.Label();
            lblAddressBillingState = new System.Windows.Forms.Label();
            lblDefaultCreditCard = new System.Windows.Forms.Label();
            lblcreditReferecenceID = new System.Windows.Forms.Label();
            label2 = new System.Windows.Forms.Label();
            label3 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.customerDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this._bndCustomerList)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this._bndInvoiceList)).BeginInit();
            this.SuspendLayout();
            // 
            // lblName
            // 
            lblName.AutoSize = true;
            lblName.Location = new System.Drawing.Point(29, 69);
            lblName.Name = "lblName";
            lblName.Size = new System.Drawing.Size(38, 13);
            lblName.TabIndex = 3;
            lblName.Text = "Name:";
            // 
            // lblAddressShipping
            // 
            lblAddressShipping.AutoSize = true;
            lblAddressShipping.Location = new System.Drawing.Point(29, 101);
            lblAddressShipping.Name = "lblAddressShipping";
            lblAddressShipping.Size = new System.Drawing.Size(123, 13);
            lblAddressShipping.TabIndex = 5;
            lblAddressShipping.Text = "Address Shipping Street:";
            // 
            // lblAddressBillingStreet
            // 
            lblAddressBillingStreet.AutoSize = true;
            lblAddressBillingStreet.Location = new System.Drawing.Point(292, 104);
            lblAddressBillingStreet.Name = "lblAddressBillingStreet";
            lblAddressBillingStreet.Size = new System.Drawing.Size(109, 13);
            lblAddressBillingStreet.TabIndex = 7;
            lblAddressBillingStreet.Text = "Address Billing Street:";
            // 
            // lblAddressBillingCity
            // 
            lblAddressBillingCity.AutoSize = true;
            lblAddressBillingCity.Location = new System.Drawing.Point(292, 130);
            lblAddressBillingCity.Name = "lblAddressBillingCity";
            lblAddressBillingCity.Size = new System.Drawing.Size(98, 13);
            lblAddressBillingCity.TabIndex = 9;
            lblAddressBillingCity.Text = "Address Billing City:";
            // 
            // lblAddressBillingState
            // 
            lblAddressBillingState.AutoSize = true;
            lblAddressBillingState.Location = new System.Drawing.Point(292, 156);
            lblAddressBillingState.Name = "lblAddressBillingState";
            lblAddressBillingState.Size = new System.Drawing.Size(106, 13);
            lblAddressBillingState.TabIndex = 11;
            lblAddressBillingState.Text = "Address Billing State:";
            // 
            // lblDefaultCreditCard
            // 
            lblDefaultCreditCard.AutoSize = true;
            lblDefaultCreditCard.Location = new System.Drawing.Point(29, 199);
            lblDefaultCreditCard.Name = "lblDefaultCreditCard";
            lblDefaultCreditCard.Size = new System.Drawing.Size(99, 13);
            lblDefaultCreditCard.TabIndex = 13;
            lblDefaultCreditCard.Text = "Default Credit Card:";
            // 
            // lblcreditReferecenceID
            // 
            lblcreditReferecenceID.AutoSize = true;
            lblcreditReferecenceID.Location = new System.Drawing.Point(33, 225);
            lblcreditReferecenceID.Name = "lblcreditReferecenceID";
            lblcreditReferecenceID.Size = new System.Drawing.Size(116, 13);
            lblcreditReferecenceID.TabIndex = 15;
            lblcreditReferecenceID.Text = "Credit Referecence ID:";
            // 
            // customerDataSet
            // 
            this.customerDataSet.DataSetName = "projectDBDataSet";
            this.customerDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // _bndCustomerList
            // 
            this._bndCustomerList.DataMember = "Customer";
            this._bndCustomerList.DataSource = this.customerDataSet;
            // 
            // _taCustomer
            // 
            this._taCustomer.ClearBeforeFill = true;
            // 
            // _taCustomerAdapterManager
            // 
            this._taCustomerAdapterManager.BackupDataSetBeforeUpdate = false;
            this._taCustomerAdapterManager.BillOfMaterialTableAdapter = null;
            this._taCustomerAdapterManager.CreditReferenceTableAdapter = null;
            this._taCustomerAdapterManager.CustomerTableAdapter = this._taCustomer;
            this._taCustomerAdapterManager.HILODriverTableAdapter = null;
            this._taCustomerAdapterManager.InventoryTableAdapter = null;
            this._taCustomerAdapterManager.InvoiceLineItemsTableAdapter = null;
            this._taCustomerAdapterManager.InvoiceTableAdapter = null;
            this._taCustomerAdapterManager.JobOrdersTableAdapter = null;
            this._taCustomerAdapterManager.PurchaseOrderLineTableAdapter = null;
            this._taCustomerAdapterManager.PurchaseOrderTableAdapter = null;
            this._taCustomerAdapterManager.QuantityStatusTableAdapter = null;
            this._taCustomerAdapterManager.SafetyStockInfoTableAdapter = null;
            this._taCustomerAdapterManager.SalesTaxTableAdapter = null;
            this._taCustomerAdapterManager.SerialNumberTableAdapter = null;
            this._taCustomerAdapterManager.UpdateOrder = MRPCustomer.projectDBDataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete;
            this._taCustomerAdapterManager.VendorProductTableAdapter = null;
            this._taCustomerAdapterManager.VendorTableAdapter = null;
            // 
            // _txtName
            // 
            this._txtName.DataBindings.Add(new System.Windows.Forms.Binding("Text", this._bndCustomerList, "Name", true));
            this._txtName.Location = new System.Drawing.Point(151, 66);
            this._txtName.Name = "_txtName";
            this._txtName.Size = new System.Drawing.Size(100, 20);
            this._txtName.TabIndex = 4;
            this._txtName.TextChanged += new System.EventHandler(this._txtName_TextChanged);
            // 
            // _txtAddressShippingStreet
            // 
            this._txtAddressShippingStreet.DataBindings.Add(new System.Windows.Forms.Binding("Text", this._bndCustomerList, "AddressShipping", true));
            this._txtAddressShippingStreet.Location = new System.Drawing.Point(151, 98);
            this._txtAddressShippingStreet.Name = "_txtAddressShippingStreet";
            this._txtAddressShippingStreet.Size = new System.Drawing.Size(100, 20);
            this._txtAddressShippingStreet.TabIndex = 6;
            // 
            // _txtAddressBillingStreet
            // 
            this._txtAddressBillingStreet.DataBindings.Add(new System.Windows.Forms.Binding("Text", this._bndCustomerList, "AddressBillingStreet", true));
            this._txtAddressBillingStreet.Location = new System.Drawing.Point(414, 101);
            this._txtAddressBillingStreet.Name = "_txtAddressBillingStreet";
            this._txtAddressBillingStreet.Size = new System.Drawing.Size(100, 20);
            this._txtAddressBillingStreet.TabIndex = 8;
            // 
            // _txtAddressBillingCity
            // 
            this._txtAddressBillingCity.DataBindings.Add(new System.Windows.Forms.Binding("Text", this._bndCustomerList, "AddressBillingCity", true));
            this._txtAddressBillingCity.Location = new System.Drawing.Point(414, 127);
            this._txtAddressBillingCity.Name = "_txtAddressBillingCity";
            this._txtAddressBillingCity.Size = new System.Drawing.Size(100, 20);
            this._txtAddressBillingCity.TabIndex = 10;
            // 
            // _txtAddressBillingState
            // 
            this._txtAddressBillingState.DataBindings.Add(new System.Windows.Forms.Binding("Text", this._bndCustomerList, "AddressBillingState", true));
            this._txtAddressBillingState.Location = new System.Drawing.Point(414, 153);
            this._txtAddressBillingState.Name = "_txtAddressBillingState";
            this._txtAddressBillingState.Size = new System.Drawing.Size(100, 20);
            this._txtAddressBillingState.TabIndex = 12;
            // 
            // _txtDefaultCreditCard
            // 
            this._txtDefaultCreditCard.DataBindings.Add(new System.Windows.Forms.Binding("Text", this._bndCustomerList, "DefaultCreditCard", true));
            this._txtDefaultCreditCard.Location = new System.Drawing.Point(151, 196);
            this._txtDefaultCreditCard.Name = "_txtDefaultCreditCard";
            this._txtDefaultCreditCard.Size = new System.Drawing.Size(100, 20);
            this._txtDefaultCreditCard.TabIndex = 14;
            // 
            // _txtCreditReferenceID
            // 
            this._txtCreditReferenceID.DataBindings.Add(new System.Windows.Forms.Binding("Text", this._bndCustomerList, "CreditReferecenceID", true));
            this._txtCreditReferenceID.Location = new System.Drawing.Point(151, 222);
            this._txtCreditReferenceID.Name = "_txtCreditReferenceID";
            this._txtCreditReferenceID.Size = new System.Drawing.Size(100, 20);
            this._txtCreditReferenceID.TabIndex = 16;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(46, 271);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(363, 72);
            this.button1.TabIndex = 17;
            this.button1.Text = "Create New Customer";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // _bndInvoiceList
            // 
            this._bndInvoiceList.DataMember = "FK__Invoice__Custome__32E0915F";
            this._bndInvoiceList.DataSource = this._bndCustomerList;
            // 
            // _taInvoice
            // 
            this._taInvoice.ClearBeforeFill = true;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new System.Drawing.Point(29, 130);
            label2.Name = "label2";
            label2.Size = new System.Drawing.Size(112, 13);
            label2.TabIndex = 20;
            label2.Text = "Address Shipping City:";
            // 
            // _txtAddressShippingCity
            // 
            this._txtAddressShippingCity.DataBindings.Add(new System.Windows.Forms.Binding("Text", this._bndCustomerList, "AddressBillingCity", true));
            this._txtAddressShippingCity.Location = new System.Drawing.Point(151, 127);
            this._txtAddressShippingCity.Name = "_txtAddressShippingCity";
            this._txtAddressShippingCity.Size = new System.Drawing.Size(100, 20);
            this._txtAddressShippingCity.TabIndex = 21;
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new System.Drawing.Point(29, 156);
            label3.Name = "label3";
            label3.Size = new System.Drawing.Size(120, 13);
            label3.TabIndex = 22;
            label3.Text = "Address Shipping State:";
            // 
            // _txtAddressShippingState
            // 
            this._txtAddressShippingState.DataBindings.Add(new System.Windows.Forms.Binding("Text", this._bndCustomerList, "AddressBillingState", true));
            this._txtAddressShippingState.Location = new System.Drawing.Point(151, 153);
            this._txtAddressShippingState.Name = "_txtAddressShippingState";
            this._txtAddressShippingState.Size = new System.Drawing.Size(100, 20);
            this._txtAddressShippingState.TabIndex = 23;
            // 
            // NewCustomer
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1020, 450);
            this.Controls.Add(label2);
            this.Controls.Add(this._txtAddressShippingCity);
            this.Controls.Add(label3);
            this.Controls.Add(this._txtAddressShippingState);
            this.Controls.Add(this.button1);
            this.Controls.Add(lblName);
            this.Controls.Add(this._txtName);
            this.Controls.Add(lblAddressShipping);
            this.Controls.Add(this._txtAddressShippingStreet);
            this.Controls.Add(lblAddressBillingStreet);
            this.Controls.Add(this._txtAddressBillingStreet);
            this.Controls.Add(lblAddressBillingCity);
            this.Controls.Add(this._txtAddressBillingCity);
            this.Controls.Add(lblAddressBillingState);
            this.Controls.Add(this._txtAddressBillingState);
            this.Controls.Add(lblDefaultCreditCard);
            this.Controls.Add(this._txtDefaultCreditCard);
            this.Controls.Add(lblcreditReferecenceID);
            this.Controls.Add(this._txtCreditReferenceID);
            this.Name = "NewCustomer";
            this.Text = "Create Customer Order";
            this.Load += new System.EventHandler(this.Form3_Load);
            ((System.ComponentModel.ISupportInitialize)(this.customerDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this._bndCustomerList)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this._bndInvoiceList)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private projectDBDataSet customerDataSet;
        private System.Windows.Forms.BindingSource _bndCustomerList;
        private projectDBDataSetTableAdapters.CustomerTableAdapter _taCustomer;
        private projectDBDataSetTableAdapters.TableAdapterManager _taCustomerAdapterManager;
        private System.Windows.Forms.TextBox _txtName;
        private System.Windows.Forms.TextBox _txtAddressShippingStreet;
        private System.Windows.Forms.TextBox _txtAddressBillingStreet;
        private System.Windows.Forms.TextBox _txtAddressBillingCity;
        private System.Windows.Forms.TextBox _txtAddressBillingState;
        private System.Windows.Forms.TextBox _txtDefaultCreditCard;
        private System.Windows.Forms.TextBox _txtCreditReferenceID;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.BindingSource _bndInvoiceList;
        private projectDBDataSetTableAdapters.InvoiceTableAdapter _taInvoice;
        private System.Windows.Forms.TextBox _txtAddressShippingCity;
        private System.Windows.Forms.TextBox _txtAddressShippingState;
    }
}