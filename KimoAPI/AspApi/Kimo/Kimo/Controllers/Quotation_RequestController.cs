using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using System.Windows;
using Kimo.Models;
using Kimo.ViewModels;

namespace Kimo.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class Quotation_RequestController : ApiController
    {
        private TshidiDatabaseEntities db = new TshidiDatabaseEntities();

        // GET: api/Quotation_Request
        public object GetQuotation_Request()
        {
            var result = (from a in db.Quotation_Request
                          join b in db.Customers on a.Customer_ID equals b.Customer_ID
                         
                          select new
                          {
                              a.Request_ID,
                              Customer_ID = b.First_Name,
                              a.Date,                             
                          }).ToList();
            return result;
        }

        // GET: api/Quotation_Request/5
        [ResponseType(typeof(Quotation_Request))]
        public IHttpActionResult GetQuotation_Request(int id)
        {

            //var quotationrequest = (from a in db.Quotation_Request
            //              join b in db.Quotation_Request_Line on a.Request_ID equals b.Request_ID
            //              where a.Request_ID == id

            //              select new
            //              {
            //                  a.Request_ID,
            //                  a.Customer_ID,
            //                  a.Date,
            //                  b.Design_ID,
            //                  b.Product_Size.Description,
            //                  b.Colour,
            //                  b.Web_Link.Web_Name,
            //                  b.Product_Code,
            //                  b.Quantity

            //              }).ToList();
            //return Ok(new { quotationrequest });

            var quotationrequest = (from a in db.Quotation_Request
                                    join b in db.Quotation_Request_Line on a.Request_ID equals b.Request_ID
                                    where a.Request_ID == id

                                    select new
                                    {
                                        a.Request_ID,
                                        a.Customer_ID,
                                        a.Date,
                                        b.Design.Product_Type.Name,
                                        b.Product_Size.Description,
                                        b.Colour,
                                        b.Web_Link.Web_Name,
                                        b.Product_Code,
                                        b.Quantity

                                    }).ToList();
            return Ok(new { quotationrequest });
        }

        [ResponseType(typeof(Quotation_Request))]
        [System.Web.Http.Route(Name = "GetSpecificRequest")]
        public IHttpActionResult GetSpecificRequest(int id)
        {
            Quotation_Request CurrentRequest = db.Quotation_Request.Find(id);
            if (CurrentRequest == null)
            {
                return NotFound();
            }

            return Ok(CurrentRequest);
        }

        // GET: api/Quotation_Request/5
        [System.Web.Http.Route("api/Quotation_Request/GetRequestID/{id}")]
        [HttpGet]
        public IHttpActionResult GetRequestID(int id)
        {
            
                db.Configuration.ProxyCreationEnabled = false;

                //List<dynamic> list = new List<dynamic>();
                List<Quotation_Request_Line> quotation_Request_Lines = db.Quotation_Request_Line
                    .Include(qrl => qrl.Product_Type)
                    .Include(qrl => qrl.Product_Size)
                    .Include(qrl => qrl.Supplier)
                    .Where(x => x.Request_ID == id).ToList();

                var CurrentQuoteRequest = db.Quotation_Request.Include(qr => qr.Customer).Where(qr => qr.Request_ID == id).FirstOrDefault();

                QuoteVM quoteVM = new QuoteVM();
            quoteVM.Quote_ID = CurrentQuoteRequest.Request_ID;
            quoteVM.CustomerID = CurrentQuoteRequest.Customer.Customer_ID;
                quoteVM.CustomerEmail = CurrentQuoteRequest.Customer.Email_Address;
                quoteVM.CustomerName = CurrentQuoteRequest.Customer.First_Name + " " + CurrentQuoteRequest.Customer.Last_Name;
                quoteVM.CustomerNumber = CurrentQuoteRequest.Customer.Contact_Number;
                quoteVM.Date = DateTime.Now;
                quoteVM.QuoteTotal = 0;

                foreach (var i in quotation_Request_Lines)
                {
                    //Design design = db.Designs.Where(x => x.Design_ID == i.Design_ID).FirstOrDefault();
                    //Customer customer = db.Customers.Where(x => x.Customer_ID == design.Customer_ID).FirstOrDefault();
                    //Product_Type product_Type = db.Product_Type.Where(x => x.Product_Type_ID == design.Product_Type_ID).FirstOrDefault();
                    //Product_Size product_Size = db.Product_Size.Where(x => x.Product_Size_ID == i.Product_Size_ID).FirstOrDefault();
                    //dynamic obj = new ExpandoObject();
                    //obj.Date = DateTime.Now;
                    //obj.Name = customer.First_Name + " " + customer.Last_Name;
                    //obj.Contact_Number = customer.Contact_Number;
                    //obj.Email = customer.Email_Address;
                    //obj.Product_Type = product_Type.Name;
                    //obj.Description = i.Product_Code + " "+ product_Size.Description + " " + i.Colour;
                    //obj.Quantity = i.Quantity;
                    //obj.Request_Line_ID = i.Request_Line_ID;

                    QuoteLineVM quoteLineVM = new QuoteLineVM();

                    quoteLineVM.Product_Type = i.Product_Type.Name ;
                    quoteLineVM.Description = i.Product_Size.Description + " -- " + i.Colour + " (" + i.Supplier.Supplier_Name + i.Product_Code + ")";
                    //quoteLineVM.Description = i.Product_Code + " " + product_Size.Description + " " + i.Colour;
                    quoteLineVM.Quantity = i.Quantity.Value;
                    quoteLineVM.Request_Line_ID = i.Request_Line_ID;
                    quoteLineVM.Price = 0;
                    quoteLineVM.Total = 0;
                    quoteLineVM.Design_ID = i.Design_ID.Value;
                    quoteLineVM.Product_Type_ID = i.Product_Type_ID.Value;
                quoteLineVM.Web_Link_ID = i.Supplier.Web_Link_ID.Value;
                    //quoteLineVM.Web_Link_ID = i.Web_Link_ID.Value;
                    quoteLineVM.Product_Size_ID = i.Product_Size_ID.Value;
                    quoteLineVM.Colour = i.Colour;
                quoteLineVM.SupplierID = i.Supplier_ID.Value;
                
                    //quoteLineVM.Supplier = i.Supplier.Email;



                    quoteVM.quoteLineVMs.Add(quoteLineVM);
                    //list.Add(obj);
                }

                return Ok(quoteVM);
            
          
        }


        // PUT: api/Quotation_Request/5      
        [System.Web.Http.Route("api/Quotation_Request/PutQuotation_Request")]
        [HttpPost]
        public IHttpActionResult PutQuotation_Request(Quotation_Request quotation_Request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Entry(quotation_Request).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Quotation_Request
        [System.Web.Http.Route("api/Quotation_Request/PostQuotation_Request")]
        [HttpPost]
        public IHttpActionResult PostQuotation_Request(Quotation_Request quotation_Request)
        {
            quotation_Request.Date = DateTime.Now;
            try
            {
                //Request table            
                db.Quotation_Request.Add(quotation_Request);

                //RequestLine table
                //foreach (var item in quotation_Request.Quotation_Request_Line)
                //{

                //    db.Quotation_Request_Line.Add(item);
                //}
                db.SaveChanges();


                return CreatedAtRoute("GetSpecificRequest", new { id = quotation_Request.Request_ID }, quotation_Request);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [System.Web.Http.Route("api/Quotation_Request/PostQuotation_Request_Line")]
        [HttpPost]
        public IHttpActionResult PostQuotation_RequestLines(List<Quotation_Request_Line> quotation_Request_Line)
        {
            
            try
            {
                //Request table            
                db.Quotation_Request_Line.AddRange(quotation_Request_Line);

                //RequestLine table
                //foreach (var item in quotation_Request.Quotation_Request_Line)
                //{

                //    db.Quotation_Request_Line.Add(item);
                //}
                db.SaveChanges();


                return Ok();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        // DELETE: api/Quotation_Request/5
        [ResponseType(typeof(Quotation_Request))]
        public IHttpActionResult DeleteQuotation_Request(int id)
        {
            try
            {
                Quotation_Request quotation_Request = db.Quotation_Request.Find(id);
                if (quotation_Request == null)
                {
                    return NotFound();
                }

                db.Quotation_Request.Remove(quotation_Request);
                db.SaveChanges();

                return Ok(quotation_Request);
            }
            catch (Exception)
            {
                MessageBox.Show("Oops! An error has occured.");
                throw;
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool Quotation_RequestExists(int id)
        {
            return db.Quotation_Request.Count(e => e.Request_ID == id) > 0;
        }
    }
}