using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kimo.ViewModels
{
    public class QuoteLineVM
    {

        public QuoteLineVM() { }

        public int QuoteLineID { get; set; }
        public int QuoteID { get; set; }
        public int Request_Line_ID { get; set; }
        public int Quantity { get; set; }
        public string Description { get; set; }
        public int Product_Type_ID { get; set; }
        public string Product_Type { get; set; }
        public decimal Price { get; set; }
        public decimal Total { get; set; }
        public int Design_ID { get; set; }
        public int Product_Size_ID { get; set; }
        public string ProductSize { get; set; }
        public string Colour { get; set; }
        public int Web_Link_ID { get; set; }
        public string WebLink { get; set; }
        public string Product_Code { get; set; }
        public string Supplier { get; set; }
        public int SupplierID { get; set; }

    }
}