using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kimo.ViewModels
{


    public class OrderVM
    {
        public OrderVM()
        {
            this.orderLineVMs = new HashSet<OrderLineVM>();
        }

        public int OrderID { get; set; }
        public int CustomerID { get; set; }
        public string CustomerName { get; set; }
        public string CustomerEmail { get; set; }
        public string CustomerNumber { get; set; }
        public DateTime Date { get; set; }
        public decimal OrderTotal { get; set; }
        public Nullable<int> OrderStatusID { get; set; }
        public string Orderstatus { get; set; }


        //public List<QuoteLineVM> quoteLineVMs { get; set; }

        public virtual ICollection<OrderLineVM> orderLineVMs { get; set; }

    }
 
}