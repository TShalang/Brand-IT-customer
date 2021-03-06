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
    
    public partial class Supplier
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Supplier()
        {
            this.Customer_Order_Line = new HashSet<Customer_Order_Line>();
            this.Quotation_Line = new HashSet<Quotation_Line>();
            this.Quotation_Request_Line = new HashSet<Quotation_Request_Line>();
            this.Supplier_Order_Line = new HashSet<Supplier_Order_Line>();
        }
    
        public int Supplier_ID { get; set; }
        public string Supplier_Name { get; set; }
        public string Contact_Number { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public Nullable<int> Web_Link_ID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Customer_Order_Line> Customer_Order_Line { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Quotation_Line> Quotation_Line { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Quotation_Request_Line> Quotation_Request_Line { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Supplier_Order_Line> Supplier_Order_Line { get; set; }
        public virtual Web_Link Web_Link { get; set; }
    }
}
