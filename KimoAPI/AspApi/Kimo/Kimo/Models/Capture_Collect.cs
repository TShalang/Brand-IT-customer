//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Kimo.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Capture_Collect
    {
        public int Collected_ID { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string ID_Number { get; set; }
        public string Contact_Number { get; set; }
        public Nullable<int> Customer_Order_ID { get; set; }
        public Nullable<System.DateTime> Date_Collected { get; set; }
    
        public virtual Customer_Order Customer_Order { get; set; }
    }
}
