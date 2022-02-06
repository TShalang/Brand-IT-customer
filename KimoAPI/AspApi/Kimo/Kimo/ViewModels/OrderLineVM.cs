using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kimo.ViewModels
{
    public class OrderLineVM
    {

        public OrderLineVM() { }

        public int OrderLineID { get; set; }
        public int OrderID { get; set; }
        public int QuotationLineID { get; set; }
        public int Quantity { get; set; }
        public string Description { get; set; }
        public int Product_Type_ID { get; set; }
        public string Product_Type { get; set; }
        public decimal Price { get; set; }
        public decimal Total { get; set; }
        public int SupplierID { get; set; }
        public string Supplier { get; set; }

        //public int Design_ID { get; set; }
        //public int Product_Size_ID { get; set; }
        //public string ProductSize { get; set; }
        //public string Colour { get; set; }
        //public int Web_Link_ID { get; set; }
        //public string WebLink { get; set; }
        //public string Product_Code { get; set; }

    }
}