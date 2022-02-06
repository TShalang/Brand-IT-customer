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
    public class Web_LinkController : ApiController
    {
        private TshidiDatabaseEntities db = new TshidiDatabaseEntities();

        // GET: api/Web_Link
        public IQueryable<Web_Link> GetWeb_Link()
        {
            return db.Web_Link;
        }

        // GET: api/Web_Link/5
        [ResponseType(typeof(Web_Link))]
        public IHttpActionResult GetWeb_Link(int id)
        {
            Web_Link web_Link = db.Web_Link.Find(id);
            if (web_Link == null)
            {
                return NotFound();
            }

            return Ok(web_Link);
        }

        // PUT: api/Web_Link/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutWeb_Link(int id, Web_Link web_Link)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != web_Link.Web_Link_ID)
            {
                return BadRequest();
            }

            db.Entry(web_Link).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Web_LinkExists(id))
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

        // POST: api/Web_Link
        [ResponseType(typeof(Web_Link))]
        public IHttpActionResult PostWeb_Link(Web_Link web_Link)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Web_Link.Add(web_Link);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = web_Link.Web_Link_ID }, web_Link);
        }

        // DELETE: api/Web_Link/5
        [ResponseType(typeof(Web_Link))]
        public IHttpActionResult DeleteWeb_Link(int id)
        {
            Web_Link web_Link = db.Web_Link.Find(id);
            if (web_Link == null)
            {
                return NotFound();
            }

            db.Web_Link.Remove(web_Link);
            db.SaveChanges();

            return Ok(web_Link);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool Web_LinkExists(int id)
        {
            return db.Web_Link.Count(e => e.Web_Link_ID == id) > 0;
        }
    }
}