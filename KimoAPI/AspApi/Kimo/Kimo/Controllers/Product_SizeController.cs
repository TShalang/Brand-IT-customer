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
    public class Product_SizeController : ApiController
    {
        private TshidiDatabaseEntities db = new TshidiDatabaseEntities();

        // GET: api/Product_Size
        public IQueryable<Product_Size> GetProduct_Size()
        {
            return db.Product_Size;
        }

        // GET: api/Product_Size/5
        [ResponseType(typeof(Product_Size))]
        public IHttpActionResult GetProduct_Size(int id)
        {
            Product_Size product_Size = db.Product_Size.Find(id);
            if (product_Size == null)
            {
                return NotFound();
            }

            return Ok(product_Size);
        }

        // PUT: api/Product_Size/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutProduct_Size(int id, Product_Size product_Size)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != product_Size.Product_Size_ID)
            {
                return BadRequest();
            }

            db.Entry(product_Size).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Product_SizeExists(id))
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

        // POST: api/Product_Size
        [ResponseType(typeof(Product_Size))]
        public IHttpActionResult PostProduct_Size(Product_Size product_Size)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Product_Size.Add(product_Size);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = product_Size.Product_Size_ID }, product_Size);
        }

        // DELETE: api/Product_Size/5
        [ResponseType(typeof(Product_Size))]
        public IHttpActionResult DeleteProduct_Size(int id)
        {
            Product_Size product_Size = db.Product_Size.Find(id);
            if (product_Size == null)
            {
                return NotFound();
            }

            db.Product_Size.Remove(product_Size);
            db.SaveChanges();

            return Ok(product_Size);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool Product_SizeExists(int id)
        {
            return db.Product_Size.Count(e => e.Product_Size_ID == id) > 0;
        }
    }
}