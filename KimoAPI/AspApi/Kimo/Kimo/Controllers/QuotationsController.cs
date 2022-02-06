using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using System.Windows;
using Kimo.Models;
using Kimo.ViewModels;

namespace Kimo.Controllers
{
    public class QuotationsController : ApiController
    {
        private TshidiDatabaseEntities db = new TshidiDatabaseEntities();

        // GET: api/Quotations
        public IQueryable<Quotation> GetQuotations()
        {
            return db.Quotations;
        }

        // GET: api/Quotations/5
        [ResponseType(typeof(Quotation))]
        [System.Web.Http.Route(Name = "GetQuotation")]
        public IHttpActionResult GetQuotation(int id)
        {
            Quotation quotation = db.Quotations.Find(id);
            if (quotation == null)
            {
                return NotFound();
            }

            return Ok(quotation);
        }

        [System.Web.Http.Route("api/Quotations/GetCustomerQuotations/{ID}")]
        [HttpGet]
        public IHttpActionResult GetCustomerQuotations(int id)
        {

            
                var QuoteList = db.Quotations
                        .Include(q => q.Customer)
                        .Include(q => q.Quotation_Status)
                        .Where(q => q.Customer_ID == id)
                        .ToList();
                //var QuoteLineList = db.Quotation_Line.Where( ql => ql. )


                List<QuoteVM> QuouteVMList = new List<QuoteVM>();

                foreach (var quote in QuoteList)
                {
                    QuoteVM quoteVM = new QuoteVM();
                    quoteVM.Quote_ID = quote.Quotation_ID;
                    quoteVM.CustomerEmail = quote.Customer.Email_Address;
                    quoteVM.CustomerName = quote.Customer.First_Name + " " + quote.Customer.Last_Name;
                    quoteVM.CustomerNumber = quote.Customer.Contact_Number;
                    quoteVM.Date = quote.Date.Value;
                    quoteVM.QuoteStatusID = quote.Quotation_Status_ID.Value;
                quoteVM.QuoteStatus = quote.Quotation_Status.Description;
                    quoteVM.QuoteTotal = quote.Amount.Value;
                    quoteVM.TotalVat = quote.TotalVat.Value;


                var CurrentQuoteLines = db.Quotation_Line
                        .Include(ql => ql.Web_Link)
                        .Include(ql => ql.Product_Size)
                        .Include(ql => ql.Product_Type)
                        .Include(ql => ql.Supplier)
                        .Where(ql => ql.Quotation_ID == quote.Quotation_ID)
                        .ToList();

                    foreach (var quoteLine in CurrentQuoteLines)
                    {
                        QuoteLineVM quoteLineVM = new QuoteLineVM();
                        quoteLineVM.QuoteLineID = quoteLine.Quotation_Line_ID;
                        quoteLineVM.Description = quoteLine.Description;
                        quoteLineVM.Design_ID = quoteLine.Design_ID.Value;
                        quoteLineVM.Price = quoteLine.Price.Value;
                        quoteLineVM.Quantity = quoteLine.Quantity.Value;
                        //quoteLineVM.Quotation_ID = quoteLine.Quotation_ID.Value;
                        quoteLineVM.Total = quoteLine.Total.Value;
                        quoteLineVM.Web_Link_ID = quoteLine.Web_Link_ID.Value;
                        quoteLineVM.WebLink = quoteLine.Web_Link.Web_Name;
                        quoteLineVM.Product_Size_ID = quoteLine.Product_Size_ID.Value;
                        quoteLineVM.ProductSize = quoteLine.Product_Size.Description;
                        quoteLineVM.Product_Type_ID = quoteLine.Product_Type_ID.Value;
                        quoteLineVM.Product_Type = quoteLine.Product_Type.Name;
                        quoteLineVM.Colour = quoteLine.Colour;
                        quoteLineVM.SupplierID = quoteLine.Supplier_ID.Value;

                        //quoteLineVM.Product_Type = db.Product_Type.Where( pt => pt.Product_Type_ID  )

                        quoteVM.quoteLineVMs.Add(quoteLineVM);
                    }

                    QuouteVMList.Add(quoteVM);
                }

                return Ok(QuouteVMList);
         
        }



        // PUT: api/Quotations/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutQuotation(int id, Quotation quotation)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != quotation.Quotation_ID)
            {
                return BadRequest();
            }

            db.Entry(quotation).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!QuotationExists(id))
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

        // POST: api/Quotations
        [ResponseType(typeof(Quotation))]
        
        public IHttpActionResult PostQuotation(Quotation quotation)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                quotation.Date = DateTime.Now.Date;
                quotation.Quotation_Status_ID = 3;

                db.Quotations.Add(quotation);
                db.SaveChanges();

                return CreatedAtRoute("GetQuotation", new { id = quotation.Quotation_ID }, quotation);
            }
            catch (Exception)
            {
                MessageBox.Show("Oops! An error has occured.");
                throw;
            }
        }

        [System.Web.Http.Route("api/Quotations/PostQuotationLines/{ID}")]
        [HttpPost]
        public IHttpActionResult PostQuotationLines(List<Quotation_Line> quotations , int ID)
        //public IHttpActionResult PostQuotationLines(dynamic data)
        {
            
                db.Configuration.ProxyCreationEnabled = false;

                //List<Quotation_Line> quotations = data.quotelines;
                //int ID = data.ID;

                var QuoteRequestID = db.Quotation_Request_Line
                .Where(qrl => qrl.Request_Line_ID == ID)
                .Include(qrl => qrl.Supplier)
                .Select(qrl => qrl.Request_ID)
                
                .FirstOrDefault();

                db.Quotation_Line.AddRange(quotations);
                db.SaveChanges();

                var ToBeDeleted = db.Quotation_Request_Line.Where(qrl => qrl.Request_ID == QuoteRequestID).ToList();
                db.Quotation_Request_Line.RemoveRange(ToBeDeleted);

                db.SaveChanges();


                db.Quotation_Request.Remove(db.Quotation_Request.Find(QuoteRequestID));
                db.SaveChanges();

                return Ok();
        

        }

        // DELETE: api/Quotations/5
        [ResponseType(typeof(Quotation))]
        public IHttpActionResult DeleteQuotation(int id)
        {
            try
            {
                Quotation quotation = db.Quotations.Find(id);
                if (quotation == null)
                {
                    return NotFound();
                }

                db.Quotations.Remove(quotation);
                db.SaveChanges();

                return Ok(quotation);
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

        private bool QuotationExists(int id)
        {
            return db.Quotations.Count(e => e.Quotation_ID == id) > 0;
        }
    }
}