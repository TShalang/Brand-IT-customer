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
using Kimo.Models;

namespace Kimo.Controllers
{
    public class Capture_CollectController : ApiController
    {
        private TshidiDatabaseEntities db = new TshidiDatabaseEntities();

        // GET: api/Capture_Collect
        public IQueryable<Capture_Collect> GetCapture_Collect()
        {
            return db.Capture_Collect;
        }

        // GET: api/Capture_Collect/5
        //[ResponseType(typeof(Capture_Collect))]
        //public IHttpActionResult GetCapture_Collect(int id)
        //{
        //    Capture_Collect capture_Collect = db.Capture_Collect.Where(q => q.Customer_Order_ID == id).FirstOrDefault();
        //    if (capture_Collect == null)
        //    {
        //        return NotFound();
        //    }

        //    return Ok(capture_Collect);
        //}


        [System.Web.Http.Route("api/Capture_Collect/getCaptureCollect/{id}")]
        [HttpGet]

        public System.Object getCaptureCollect(int id)
        {
            var collectionline = (from a in db.Capture_Collect
                                 where a.Customer_Order_ID == id
                                 select new
                                 {
                                     a.Name,
                                     a.Surname,
                                     a.ID_Number,
                                     a.Date_Collected,
                                     a.Contact_Number
                                    
                                 }).FirstOrDefault();
            return collectionline;
        }


        //[System.Web.Http.Route("api/Capture_Collect/GetCaptureCollect")]
        //[HttpGet]
        //public IHttpActionResult GetCaptureCollect()
        //{


        //    var CaptureC = db.Capture_Collect
        //            .Include(q => q.Customer_Order)
        //            //.Where(q => q.Customer_Order_ID == id)
        //            .ToList();
        //    //var QuoteLineList = db.Quotation_Line.Where( ql => ql. )

        //    return Ok(CaptureC);


        //}


        // PUT: api/Capture_Collect/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutCapture_Collect(int id, Capture_Collect capture_Collect)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != capture_Collect.Collected_ID)
            {
                return BadRequest();
            }

            db.Entry(capture_Collect).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Capture_CollectExists(id))
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

        // POST: api/Capture_Collect
        [ResponseType(typeof(Capture_Collect))]
        public IHttpActionResult PostCapture_Collect(Capture_Collect capture_Collect)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            
           
            db.Capture_Collect.Add(capture_Collect);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = capture_Collect.Collected_ID }, capture_Collect);
        }

        // DELETE: api/Capture_Collect/5
        [ResponseType(typeof(Capture_Collect))]
        public IHttpActionResult DeleteCapture_Collect(int id)
        {
            Capture_Collect capture_Collect = db.Capture_Collect.Find(id);
            if (capture_Collect == null)
            {
                return NotFound();
            }

            db.Capture_Collect.Remove(capture_Collect);
            db.SaveChanges();

            return Ok(capture_Collect);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool Capture_CollectExists(int id)
        {
            return db.Capture_Collect.Count(e => e.Collected_ID == id) > 0;
        }
    }
}