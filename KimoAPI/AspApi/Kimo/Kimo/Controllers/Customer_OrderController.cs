using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Web.Http;
using System.Web.Http.Description;
using Kimo.Models;
using Kimo.Services;
using Kimo.ViewModels;

namespace Kimo.Controllers
{
    public class Customer_OrderController : ApiController
    {
        private TshidiDatabaseEntities db = new TshidiDatabaseEntities();
        private EmailService em = new EmailService();

        // GET: api/Customer_Order
        //public IQueryable<Customer_Order> GetCustomer_Order()
        //{
        //    return db.Customer_Order;
        //}





        //[System.Web.Http.Route("api/Customer_Order/getCusOrders")]
        //[HttpGet]

        //public System.Object GetCustomer_Order()
        //{
        //    var result = (from a in db.Customer_Order
        //                  join b in db.Customer_Order_Line on a.Customer_Order_ID equals b.Customer_Order_ID
        //                  select new
        //                  {
        //                      a.Customer_Order_ID,
        //                      a.Customer.First_Name,
        //                      a.OrderStatus_ID,
        //                      a.Order_Total,
        //                      b.Description,
        //                      b.Quantity,
        //                      b.Price,
        //                      b.Total
        //                  }).ToList();
        //    return result;
        //}


        [System.Web.Http.Route("api/Customer_Order/GetCustomerOrders/{ID}")]
        [HttpGet]
        public IHttpActionResult GetCustomer_Orders(int id)
        {


            var OrderList = db.Customer_Order
                    .Include(q => q.Customer)
                    .Include(q => q.Order_Status)
                    
                    //.Where(q => q.Customer_ID == id)
                    .ToList();
            //var QuoteLineList = db.Quotation_Line.Where( ql => ql. )


            List<OrderVM> OrderVMList = new List<OrderVM>();

            foreach (var order in OrderList)
            {
                OrderVM orderVM = new OrderVM();
                orderVM.OrderID = order.Customer_Order_ID;
                orderVM.CustomerID = order.Customer.Customer_ID;
                orderVM.CustomerEmail = order.Customer.Email_Address;
                orderVM.CustomerName = order.Customer.First_Name + " " + order.Customer.Last_Name;
                orderVM.CustomerNumber = order.Customer.Contact_Number;
                orderVM.Date = order.Order_Date.Value;
                orderVM.OrderTotal = order.Order_Total.Value;
                orderVM.OrderStatusID = order.OrderStatus_ID;
                orderVM.Orderstatus = order.Order_Status.Description;

                var CurrentOrderLines = db.Customer_Order_Line
                    .Include(col => col.Web_Link)
                    .Include(col => col.Product_Size)
                    .Include(col => col.Product_Type)
                    .Where(col => col.Customer_Order_ID == order.Customer_Order_ID)
                    .ToList();

                foreach (var orderLine in CurrentOrderLines)
                {
                    OrderLineVM orderLineVM = new OrderLineVM();
                    orderLineVM.OrderLineID = orderLine.Customer_Order_Line_ID;
                    orderLineVM.Description = orderLine.Description;
                    //quoteLineVM.Design_ID = quoteLine.Design_ID.Value;
                    orderLineVM.Price = orderLine.Price.Value;
                    orderLineVM.Quantity = orderLine.Quantity.Value;
                    //quoteLineVM.Quotation_ID = quoteLine.Quotation_ID.Value;
                    orderLineVM.Total = orderLine.Total.Value;
                    orderLineVM.SupplierID = orderLine.Supplier_ID.Value;
                    
                    //quoteLineVM.Web_Link_ID = quoteLine.Web_Link_ID.Value;
                    //quoteLineVM.WebLink = quoteLine.Web_Link.Web_Name;
                    //quoteLineVM.Product_Size_ID = quoteLine.Product_Size_ID.Value;
                    //quoteLineVM.ProductSize = quoteLine.Product_Size.Description;
                    //quoteLineVM.Product_Type_ID = quoteLine.Product_Type_ID.Value;
                    //quoteLineVM.Product_Type = quoteLine.Product_Type.Name;
                    //quoteLineVM.Colour = quoteLine.Colour;

                    //quoteLineVM.Product_Type = db.Product_Type.Where( pt => pt.Product_Type_ID  )

                    orderVM.orderLineVMs.Add(orderLineVM);
                }

                OrderVMList.Add(orderVM);
            }

            return Ok(OrderVMList);

        }












        //View order
        [System.Web.Http.Route("api/Customer_Order/getCustomerOrders")]
        [HttpGet]
        public List<Customer_Order> GetCustomerOrders()
        {
            //var result = (from a in db.Customer_Order
            //              join b in db.Customer_Order_Line on a.Customer_Order_ID equals b.Customer_Order_ID
            //              join c in db.Order_Status on a.OrderStatus_ID equals c.OrderStatus_ID
            //              select new
            //              {
            //                  a.Customer_Order_ID,
            //                  Customer_ID = a.Customer.First_Name,
            //                  b.Description,
            //                  //a.Order_Status.OrderStatus_ID,
            //                  OrderStatus_ID = c.Description,
            //                  a.Order_Date,
            //                  a.Order_Total,

            //              }).ToList();
            var result = db.Customer_Order
                .Include(co => co.Customer)
                .Include(co => co.Order_Status)
                .ToList();


            return result;
        }

        [System.Web.Http.Route("api/Customer_Order/getCusOrders/{ID}")]
        [HttpGet]
        public List<Customer_Order> GetCusOrders(int id)
        {
            //var result = (from a in db.Customer_Order
            //              join b in db.Customer_Order_Line on a.Customer_Order_ID equals b.Customer_Order_ID
            //              join c in db.Order_Status on a.OrderStatus_ID equals c.OrderStatus_ID
            //              select new
            //              {
            //                  a.Customer_Order_ID,
            //                  Customer_ID = a.Customer.First_Name,
            //                  b.Description,
            //                  //a.Order_Status.OrderStatus_ID,
            //                  OrderStatus_ID = c.Description,
            //                  a.Order_Date,
            //                  a.Order_Total,

            //              }).ToList();
            var result = db.Customer_Order
                .Include(co => co.Customer)
                .Include(co => co.Order_Status)
                .Where(co => co.Customer_ID == id)
                .ToList();


            return result;
        }

        [System.Web.Http.Route("api/Customer_Order/GetCusOrderDetails/{id}")]
        [HttpGet]
        public Customer_Order getCusOrderDetails(int id)
        {
        

            var orders = db.Customer_Order
                .Include(co => co.Customer)
                .Include(co => co.Customer_Order_Line)
                .Include(co => co.Order_Status)
                .Where(co => co.Customer_Order_ID == id)
                .FirstOrDefault();



            return orders;

        }

        [System.Web.Http.Route("api/Customer_Order/GetOrderDetails/{id}")]
        [HttpGet]
        public Customer_Order getOrderDetails(int id)
        {
            //var orderdetails = (from a in db.Customer_Order
            //                    join b in db.Customer_Order_Line on a.Customer_Order_ID equals b.Customer_Order_ID
            //                    where a.Customer_Order_ID == id
            //                    select new
            //                    {
            //                        a.Customer_Order_ID,
            //                        b.Description,
            //                        b.Quantity,
            //                        b.Price,
            //                        a.Order_Date

            //                    }).ToList();
            //return orderdetails;

            var orders = db.Customer_Order
                .Include( co => co.Customer )
                .Include( co => co.Customer_Order_Line )
                .Include( co => co.Order_Status )
                .Where(co => co.Customer_Order_ID == id)
                .FirstOrDefault();

          

            return orders;

        }
        [System.Web.Http.Route("api/Customer_Order/PlaceSuppOrder/{id}")]
        [HttpGet]
        public IHttpActionResult PlaceSuppOrder(int id)
        {

            var CurrentOrder = db.Customer_Order.Where(co => co.Customer_Order_ID == id).FirstOrDefault();


            CurrentOrder.OrderStatus_ID = 5;

            db.Entry(CurrentOrder).State = EntityState.Modified;
            db.SaveChanges();

            return Ok();
        }

        [System.Web.Http.Route("api/Customer_Order/SuppOrderRecieved/{id}")]
        [HttpGet]
        public IHttpActionResult SuppOrderRecieved(int id)
        {

            var CurrentOrder = db.Customer_Order.Where(co => co.Customer_Order_ID == id).FirstOrDefault();


            CurrentOrder.OrderStatus_ID = 3;

            db.Entry(CurrentOrder).State = EntityState.Modified;
            db.SaveChanges();

            return Ok();
        }

        [System.Web.Http.Route("api/Customer_Order/ReceiveOrder/{id}")]
        [HttpGet]
        public IHttpActionResult ReceiveOrder(int id)
        {

            var CurrentOrder = db.Customer_Order.Where(co => co.Customer_Order_ID == id).FirstOrDefault();


            CurrentOrder.OrderStatus_ID = 2;

            db.Entry(CurrentOrder).State = EntityState.Modified;
            db.SaveChanges();

            return Ok();
        }

        [System.Web.Http.Route("api/Customer_Order/FinaliseOrder/{id}")]
        [HttpGet]
        public IHttpActionResult FinaliseOrder(int id)
        {

            var CurrentOrder = db.Customer_Order.Where(co => co.Customer_Order_ID == id).FirstOrDefault();



            CurrentOrder.OrderStatus_ID = 4;

            db.Entry(CurrentOrder).State = EntityState.Modified;
            db.SaveChanges();

            var customer = db.Customers.Where(c => c.Customer_ID == CurrentOrder.Customer_ID).FirstOrDefault();

            em.SendEmail(customer);

            return Ok();
        }

        [System.Web.Http.Route("api/Customer_Order/AcceptQuotation/{QuoteID}/{CustomerOrderID}")]
        [HttpGet]
        public IHttpActionResult GetCustomerQuotations(int QuoteID, int CustomerOrderID)
        {
            var CurrentQuote = db.Quotations
                .Include(q => q.Quotation_Line)
                .Where(q => q.Quotation_ID == QuoteID)
                .FirstOrDefault();
            CurrentQuote.Quotation_Status_ID = 1;
         
            db.SaveChanges();

            foreach (var quoteLine in CurrentQuote.Quotation_Line)
            {
                Customer_Order_Line customer_Order_Line = new Customer_Order_Line();
                customer_Order_Line.Customer_Order_ID = CustomerOrderID;
                customer_Order_Line.Design_ID = quoteLine.Design_ID;
                customer_Order_Line.Price = quoteLine.Price;
                customer_Order_Line.Product_Size_ID = quoteLine.Product_Size_ID;
                customer_Order_Line.Product_Type_ID = quoteLine.Product_Type_ID;
                customer_Order_Line.Product_Code = quoteLine.Product_Code;
                customer_Order_Line.Quantity = quoteLine.Quantity;
                customer_Order_Line.Web_Link_ID = quoteLine.Web_Link_ID;
                customer_Order_Line.Description = quoteLine.Description;
                customer_Order_Line.Total = quoteLine.Total;
                customer_Order_Line.Product_Code = quoteLine.Product_Code;
                customer_Order_Line.Date = DateTime.Now.Date;
                customer_Order_Line.Quotation_Line_ID = quoteLine.Quotation_Line_ID;
                customer_Order_Line.Supplier_ID = quoteLine.Supplier_ID;

                db.Customer_Order_Line.Add(customer_Order_Line);

            }

            db.SaveChanges();

            return Ok();

        }



        [System.Web.Http.Route("api/Customer_Order/GetCustOrders/{ID}")]
        [HttpGet]
        public IHttpActionResult GetCustomerOrders(int id)
        {


            var OrderList = db.Customer_Order
                    .Include(q => q.Customer)
                    .Include(q => q.Order_Status)
                    .Where(q => q.Customer_ID == id)
                    .ToList();
            //var QuoteLineList = db.Quotation_Line.Where( ql => ql. )


            List<OrderVM> orderVMList = new List<OrderVM>();

            foreach (var order in OrderList)
            {
                OrderVM orderVM = new OrderVM();
                orderVM.OrderID = order.Customer_Order_ID;
                orderVM.CustomerName = order.Customer.First_Name + " " + order.Customer.Last_Name;               
                orderVM.Date = order.Order_Date.Value;
                orderVM.OrderTotal = order.Order_Total.Value;
                orderVM.Orderstatus = order.Order_Status.Description;
                //quoteVM.TotalVat = quote.TotalVat.Value;


                var CurrentOrderLines = db.Customer_Order_Line
                        .Include(ql => ql.Web_Link)
                        .Include(ql => ql.Product_Size)
                        .Include(ql => ql.Product_Type)
                        .Where(ql => ql.Customer_Order_ID == order.Customer_Order_ID)
                        .ToList();

                foreach (var orderLine in CurrentOrderLines)
                {
                    OrderLineVM orderLineVM = new OrderLineVM();
                    orderLineVM.OrderLineID = orderLine.Customer_Order_Line_ID;
                    orderLineVM.Description = orderLine.Description;
                    orderLineVM.Price = orderLine.Price.Value;
                    orderLineVM.Quantity = orderLine.Quantity.Value;
                    //orderLineVM.Quotation_ID = orderLine.Quotation_ID.Value;
                    orderLineVM.Total = orderLine.Total.Value;
                    orderLineVM.Product_Type_ID = orderLine.Product_Type_ID.Value;
                    orderLineVM.Product_Type = orderLine.Product_Type.Name;

                    //orderLineVM.Product_Type = db.Product_Type.Where( pt => pt.Product_Type_ID  )

                    orderVM.orderLineVMs.Add(orderLineVM);
                }

                orderVMList.Add(orderVM);
            }

            return Ok(orderVMList);

        }











        // GET: api/Customer_Order/5
        [ResponseType(typeof(Customer_Order))]
        [System.Web.Http.Route(Name = "GetCustomer_Order")]
        public IHttpActionResult GetCustomer_Order(int id)
        {
            Customer_Order customer_Order = db.Customer_Order.Find(id);
            if (customer_Order == null)
            {
                return NotFound();
            }

            return Ok(customer_Order);
        }

        // PUT: api/Customer_Order/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutCustomer_Order(int id, Customer_Order customer_Order)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != customer_Order.Customer_Order_ID)
            {
                return BadRequest();
            }

            db.Entry(customer_Order).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Customer_OrderExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Customer_Order
        [ResponseType(typeof(Customer_Order))]
        public IHttpActionResult PostCustomer_Order(Customer_Order customer_Order , int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var CurrentQuote = db.Quotations.Where(q => q.Quotation_ID == id).FirstOrDefault();

            customer_Order.Order_Date = DateTime.Now.Date;
            customer_Order.OrderStatus_ID = 1;
            customer_Order.Order_Total = CurrentQuote.Amount;

            db.Customer_Order.Add(customer_Order);
            db.SaveChanges();

            return CreatedAtRoute("GetCustomer_Order", new { id = customer_Order.Customer_Order_ID }, customer_Order);
        }



        // DELETE: api/Customer_Order/5
        [ResponseType(typeof(Customer_Order))]
        public IHttpActionResult DeleteCustomer_Order(int id)
        {
            Customer_Order customer_Order = db.Customer_Order.Find(id);
            if (customer_Order == null)
            {
                return NotFound();
            }

            db.Customer_Order.Remove(customer_Order);
            db.SaveChanges();

            return Ok(customer_Order);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool Customer_OrderExists(int id)
        {
            return db.Customer_Order.Count(e => e.Customer_Order_ID == id) > 0;
        }
    }
}