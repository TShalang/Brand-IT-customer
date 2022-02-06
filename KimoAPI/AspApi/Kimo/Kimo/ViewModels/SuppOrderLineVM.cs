using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kimo.ViewModels
{
    public class SuppOrderLineVM
    {
        public SuppOrderLineVM() { }

        public int Supplier_Order_Line_ID { get; set; }
        public Nullable<int> Supplier_Order_ID { get; set; }
        public int Customer_Order_Line_ID { get; set; }

        public Nullable<int> Product_Type_ID { get; set; }
        public string Product_Type { get; set; }
        public string Description { get; set; }
        public Nullable<int> Quantity { get; set; }
        public int Supplier_ID { get; set; }
        public string Supplier { get; set; }

        public string SuppEmail { get; set; }

    }
}