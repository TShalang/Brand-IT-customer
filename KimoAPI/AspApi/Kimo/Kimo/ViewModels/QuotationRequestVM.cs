using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kimo.ViewModels
{
    public class QuotationRequestVM
    {

        public QuotationRequestVM() { }

        public int Request_ID { get; set; }
        public int Customer_ID { get; set; }
        public string CustomerName { get; set; }
        public System.DateTime Date { get; set; }

    }
}