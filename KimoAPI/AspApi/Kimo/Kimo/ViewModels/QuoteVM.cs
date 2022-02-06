using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kimo.ViewModels
{
    public class QuoteVM
    {
        public QuoteVM() 
        {
            this.quoteLineVMs = new HashSet<QuoteLineVM>();
        }

        public int Quote_ID { get; set; }
        public int CustomerID {get;set;}
        public string CustomerName { get; set; }
        public string CustomerEmail { get; set; }
        public string CustomerNumber { get; set; }
        public DateTime Date { get; set; }
        public decimal QuoteTotal { get; set; }
        public string QuoteStatus { get; set; }
        public int QuoteStatusID { get; set; }
        public decimal TotalVat { get; set; }
        //public List<QuoteLineVM> quoteLineVMs { get; set; }

        public virtual ICollection<QuoteLineVM> quoteLineVMs { get; set; }

    }
}