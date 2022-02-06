using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kimo.ViewModels
{
    public class SuppOrderVM
    {
        public SuppOrderVM()
        {
            this.orderLineVMs = new HashSet<SuppOrderLineVM>();
        }


        public int SuppOrderID { get; set; }
        public int SupplierID { get; set; }
        public string Supplier { get; set; }
        public int OrderStatusID { get; set; }
        public string OrderStatus { get; set; }
        public int Quotation_Line_ID { get; set; }
        public Nullable<System.DateTime> Date { get; set; }

        public virtual ICollection<SuppOrderLineVM> orderLineVMs { get; set; }

    }
}