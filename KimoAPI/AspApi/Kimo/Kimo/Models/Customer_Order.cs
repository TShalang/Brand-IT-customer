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
    
    public partial class Customer_Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer_Order()
        {
            this.Capture_Collect = new HashSet<Capture_Collect>();
            this.Customer_Order_Line = new HashSet<Customer_Order_Line>();
            this.Deliveries = new HashSet<Delivery>();
        }
    
        public int Customer_Order_ID { get; set; }
        public Nullable<int> Customer_ID { get; set; }
        public Nullable<System.DateTime> Order_Date { get; set; }
        public Nullable<decimal> Order_Total { get; set; }
        public Nullable<int> OrderStatus_ID { get; set; }
        public Nullable<decimal> TotalVat { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Capture_Collect> Capture_Collect { get; set; }
        public virtual Customer Customer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Customer_Order_Line> Customer_Order_Line { get; set; }
        public virtual Order_Status Order_Status { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Delivery> Deliveries { get; set; }
    }
}
