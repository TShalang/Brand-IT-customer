using Kimo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data.Entity;
using Kimo.ViewModels;
using System.Web.Http.Description;
using Kimo.Services;

namespace Kimo.Controllers
{
    public class SupplierOrderController : ApiController
    {
        private TshidiDatabaseEntities db = new TshidiDatabaseEntities();
        private EmailService em = new EmailService();
        // GET: api/Quotation_Request/5
        [System.Web.Http.Route("api/SupplierOrder/GetSuppOrderID/{id}")]
        [HttpGet]
        public IHttpActionResult GetSuppOrderID(int id)
        {

            db.Configuration.ProxyCreationEnabled = false;

            //List<dynamic> list = new List<dynamic>();
            List<Customer_Order_Line> order_Lines = db.Customer_Order_Line
                .Include(ql => ql.Product_Type)
                .Include(ql => ql.Product_Size)
                .Include(ql => ql.Supplier)
                .Where(x => x.Customer_Order_ID == id).ToList();

            var CurrentOrder = db.Customer_Order.Include(q => q.Order_Status).Where(q => q.Customer_Order_ID == id).FirstOrDefault();

            SuppOrderVM suppOrderVM = new SuppOrderVM();
            suppOrderVM.SuppOrderID = CurrentOrder.Customer_Order_ID;
            suppOrderVM.OrderStatus = CurrentOrder.Order_Status.Description;
            
            
            suppOrderVM.Date = DateTime.Now;

            foreach (var i in order_Lines)
            {
               

                SuppOrderLineVM orderLineVM = new SuppOrderLineVM();

                orderLineVM.Product_Type = i.Product_Type.Name;
                orderLineVM.Product_Type_ID = i.Product_Type_ID;
                orderLineVM.Description = i.Description;
                orderLineVM.Quantity = i.Quantity.Value;
                orderLineVM.Customer_Order_Line_ID = i.Customer_Order_Line_ID;
                orderLineVM.Supplier_ID = i.Supplier_ID.Value;
                orderLineVM.Supplier = i.Supplier.Supplier_Name;
                orderLineVM.SuppEmail = i.Supplier.Email;
                
                
                


                suppOrderVM.orderLineVMs.Add(orderLineVM);
                //list.Add(obj);

                var supplier = db.Suppliers.Where(s => s.Supplier_ID == i.Supplier_ID).FirstOrDefault();
                var ol = db.Supplier_Order_Line.Where(o => o.Supplier_ID == i.Supplier_ID).FirstOrDefault();
                em.SendSuppEmail(supplier, ol);
            }






            return Ok(suppOrderVM);


        }

        [System.Web.Http.Route("api/SupplierOrder/PostSuppOrderLines/{ID}")]
        [HttpPost]
        public IHttpActionResult PostSuppOrderLines(List<Supplier_Order_Line> suppOrders, int ID)
        //public IHttpActionResult PostQuotationLines(dynamic data)
        {

            db.Configuration.ProxyCreationEnabled = false;

            //List<Quotation_Line> quotations = data.quotelines;
            //int ID = data.ID;

            var CusOrderID = db.Customer_Order_Line
            .Where(qrl => qrl.Customer_Order_Line_ID == ID)
            .Select(qrl => qrl.Customer_Order_ID)
            .FirstOrDefault();

            db.Supplier_Order_Line.AddRange(suppOrders);
            db.SaveChanges();
                        

            return Ok();


        }

        // GET: api/Quotations/5
        [ResponseType(typeof(Supplier_Order))]
        [System.Web.Http.Route(Name = "GetSupplierOrder")]
        public IHttpActionResult GetQuotation(int id)
        {
            Supplier_Order suppOrder = db.Supplier_Order.Find(id);
            if (suppOrder == null)
            {
                return NotFound();
            }

            return Ok(suppOrder);
        }

        //// POST: api/Supplier_Order
        //[ResponseType(typeof(Supplier_Order))]

        //public IHttpActionResult PostSupplier_Order(Supplier_Order suppOrder)
        //{
        //    try
        //    {
        //        if (!ModelState.IsValid)
        //        {
        //            return BadRequest(ModelState);
        //        }

        //        suppOrder.Date = DateTime.Now.Date;
        //        suppOrder.Supplier_Order_Status_ID = 1;

        //        db.Supplier_Order.Add(suppOrder);
        //        db.SaveChanges();

        //        return CreatedAtRoute("GetSupplierOrder", new { id = suppOrder.Supplier_Order_ID}, suppOrder);
        //    }
        //    catch (Exception)
        //    {
              
        //        throw;
        //    }
        //}

    }
}
