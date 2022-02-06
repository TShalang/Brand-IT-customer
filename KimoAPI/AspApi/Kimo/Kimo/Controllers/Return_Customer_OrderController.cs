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

namespace Kimo.Controllers
{
    public class Return_Customer_OrderController : ApiController
    {
        private TshidiDatabaseEntities db = new TshidiDatabaseEntities();

        // GET: api/Return_Customer_Order
        public IQueryable<Return_Customer_Order> GetReturn_Customer_Order()
        {
            return db.Return_Customer_Order;
        }

        // GET: api/Return_Customer_Order/5
        [ResponseType(typeof(Return_Customer_Order))]
        public IHttpActionResult GetReturn_Customer_Order(int id)
        {
            Return_Customer_Order return_Customer_Order = db.Return_Customer_Order.Find(id);
            if (return_Customer_Order == null)
            {
                return NotFound();
            }

            return Ok(return_Customer_Order);
        }

        // PUT: api/Return_Customer_Order/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutReturn_Customer_Order(int id, Return_Customer_Order return_Customer_Order)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != return_Customer_Order.Return_Customer_Order_ID)
            {
                return BadRequest();
            }

            db.Entry(return_Customer_Order).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Return_Customer_OrderExists(id))
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

        // POST: api/Return_Customer_Order
        [ResponseType(typeof(Return_Customer_Order))]
        public IHttpActionResult PostReturn_Customer_Order(Return_Customer_Order return_Customer_Order)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                db.Return_Customer_Order.Add(return_Customer_Order);
                db.SaveChanges();

                return CreatedAtRoute("DefaultApi", new { id = return_Customer_Order.Return_Customer_Order_ID }, return_Customer_Order);
            }
            catch (Exception)
            {
                MessageBox.Show("Oops! An error has occured.");
                throw;
            }
        }

        // DELETE: api/Return_Customer_Order/5
        [ResponseType(typeof(Return_Customer_Order))]
        public IHttpActionResult DeleteReturn_Customer_Order(int id)
        {
            try
            {
                Return_Customer_Order return_Customer_Order = db.Return_Customer_Order.Find(id);
                if (return_Customer_Order == null)
                {
                    return NotFound();
                }

                db.Return_Customer_Order.Remove(return_Customer_Order);
                db.SaveChanges();

                return Ok(return_Customer_Order);
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

        private bool Return_Customer_OrderExists(int id)
        {
            return db.Return_Customer_Order.Count(e => e.Return_Customer_Order_ID == id) > 0;
        }
    }
}