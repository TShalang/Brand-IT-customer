using Kimo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kimo.ViewModels
{
    public class DesignVM
    {

        public DesignVM() 
        {
            //this.Design_Lines = new HashSet<DesignLineVM>();
            this.DesignLineVMs = new HashSet<DesignLineVM>();
        }

        public int Design_ID { get; set; }
        public int Product_Type_ID { get; set; }
        public string Product_Type { get; set; }
        public string Design_Name { get; set; }
        public string Additional_Instructions { get; set; }
        public int Customer_ID { get; set; }
        public DateTime Date_Created { get; set; }

        public virtual ICollection<DesignLineVM> DesignLineVMs { get; set; }

    }
}