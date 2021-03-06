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
    
    public partial class Customer_Order_Line
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer_Order_Line()
        {
            this.Return_Customer_Order_Line = new HashSet<Return_Customer_Order_Line>();
            this.Supplier_Order_Line = new HashSet<Supplier_Order_Line>();
        }
    
        public int Customer_Order_Line_ID { get; set; }
        public Nullable<int> Customer_Order_ID { get; set; }
        public Nullable<int> Quotation_Line_ID { get; set; }
        public string Description { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<decimal> Price { get; set; }
        public Nullable<decimal> Total { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public Nullable<int> Design_ID { get; set; }
        public string Product_Code { get; set; }
        public Nullable<int> Web_Link_ID { get; set; }
        public Nullable<int> Product_Size_ID { get; set; }
        public Nullable<int> Product_Type_ID { get; set; }
        public Nullable<int> Supplier_ID { get; set; }
    
        public virtual Customer_Order Customer_Order { get; set; }
        public virtual Design Design { get; set; }
        public virtual Design Design1 { get; set; }
        public virtual Product_Size Product_Size { get; set; }
        public virtual Product_Type Product_Type { get; set; }
        public virtual Quotation_Line Quotation_Line { get; set; }
        public virtual Supplier Supplier { get; set; }
        public virtual Web_Link Web_Link { get; set; }
        public virtual Web_Link Web_Link1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Return_Customer_Order_Line> Return_Customer_Order_Line { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Supplier_Order_Line> Supplier_Order_Line { get; set; }
    }
}
