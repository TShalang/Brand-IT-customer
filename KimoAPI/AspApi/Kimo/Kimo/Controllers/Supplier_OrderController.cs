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
    public class Supplier_OrderController : ApiController
    {
        private TshidiDatabaseEntities db = new TshidiDatabaseEntities();

        // GET: api/Supplier_Order
        public IQueryable<Supplier_Order> GetSupplier_Order()
        {
            return db.Supplier_Order;
        }

        // GET: api/Supplier_Order/5
        [ResponseType(typeof(Supplier_Order))]
        [System.Web.Http.Route(Name = "GetSupplier_Order")]
        public IHttpActionResult GetSupplier_Order(int id)
        {
            Supplier_Order supplier_Order = db.Supplier_Order.Find(id);
            if (supplier_Order == null)
            {
                return NotFound();
            }

            return Ok(supplier_Order);
        }

        // PUT: api/Supplier_Order/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutSupplier_Order(int id, Supplier_Order supplier_Order)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != supplier_Order.Supplier_Order_ID)
            {
                return BadRequest();
            }

            db.Entry(supplier_Order).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Supplier_OrderExists(id))
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

        // POST: api/Supplier_Order
        [ResponseType(typeof(Supplier_Order))]
        public IHttpActionResult PostSupplier_Order(Supplier_Order supplier_Order)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            supplier_Order.Date = DateTime.Now.Date;
            supplier_Order.OrderStatus_ID = 5;
            
            db.Supplier_Order.Add(supplier_Order);
            db.SaveChanges();

            return CreatedAtRoute("GetSupplier_Order", new { id = supplier_Order.Supplier_Order_ID }, supplier_Order);
        }

        // DELETE: api/Supplier_Order/5
        [ResponseType(typeof(Supplier_Order))]
        public IHttpActionResult DeleteSupplier_Order(int id)
        {
            Supplier_Order supplier_Order = db.Supplier_Order.Find(id);
            if (supplier_Order == null)
            {
                return NotFound();
            }

            db.Supplier_Order.Remove(supplier_Order);
            db.SaveChanges();

            return Ok(supplier_Order);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool Supplier_OrderExists(int id)
        {
            return db.Supplier_Order.Count(e => e.Supplier_Order_ID == id) > 0;
        }
    }
}