using Kimo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using System.Linq.Expressions;
using System.Xml;
using System.Data.Entity;
using System.Web.Http.Cors;
using System.Dynamic;
using System.Data.Entity.Infrastructure;
using System.Threading.Tasks;

namespace Kimo.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class AuditTrailController : ApiController
    {
         
        private TshidiDatabaseEntities db = new TshidiDatabaseEntities();
        [System.Web.Http.Route("api/AuditTrails/GetAuditTrail")]
        [System.Web.Mvc.HttpGet]
        // GET: api/Clients
        public List<dynamic> GetAuditTrail()
        {
            //return db.Users;
            TshidiDatabaseEntities db = new TshidiDatabaseEntities();
            db.Configuration.ProxyCreationEnabled = false;
            return getGetAuditTrailReturnList(db.AuditTrails.ToList());
        }
        private List<dynamic> getGetAuditTrailReturnList(List<AuditTrail> forClient)
        {
            List<dynamic> dynamicAudits = new List<dynamic>();
            foreach (AuditTrail auditTrail in forClient)
            {
                dynamic dynamicauditTrail = new ExpandoObject();
                dynamicauditTrail.AuditTrailID = auditTrail.AuditTrailID;
                dynamicauditTrail.UserID = db.AuditTrails.Include(xx => xx.User).Where(xx => xx.User.UserID == auditTrail.UserID)
                                                .Select(xx => xx.User.UserName).FirstOrDefault();
                dynamicauditTrail.AuditType = auditTrail.AuditType;
                //dynamicauditTrail.AuditDate = auditTrail.AuditDate.Value.ToString("yyyy-MM-dd HH:mm");
                dynamicauditTrail.AuditDate = auditTrail.AuditDate.ToString();
                dynamicauditTrail.AuditDescription = auditTrail.AuditDescription;
                // dynamicauditTrail.OldValue = auditTrail.OldValue;
                //dynamicauditTrail.NewValue = auditTrail.NewValue;
                //dynamicauditTrail.ChangedColums = auditTrail.ChangedColums;


                dynamicAudits.Add(dynamicauditTrail);
            }

            return dynamicAudits;

        }

        [System.Web.Http.Route("api/AuditTrails/AuditTrails")]
        [System.Web.Mvc.HttpPost]
        // POST: api/AuditTrails
        //// [ResponseType(typeof(AuditTrail))]
        public dynamic PostAuditTrail([FromBody] AuditTrail auditTrail)
        {

            //var USER_ID = getUserID();

            auditTrail.User = db.Users.Where(x => x.UserID == auditTrail.UserID).FirstOrDefault();

            //if (!ModelState.IsValid)
            //{
            //    return BadRequest(ModelState);
            //}
            //auditTrail.DateTime = auditTrail.DateTime;
            //auditTrail.TransactionDescription = auditTrail.TransactionDescription;
            //auditTrail.TransactionType = auditTrail.TransactionType;
            //auditTrail.User_ID = auditTrail.User.User_ID;
            // db.AuditTrails.Add(auditTrail);
            // db.SaveChanges();

            //return CreatedAtRoute("DefaultApi", new { id = auditTrail.AuditTrailID }, auditTrail);
            //if (!ModelState.IsValid)
            //{
            //    return BadRequest(ModelState);
            //}

            db.AuditTrails.Add(auditTrail);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = auditTrail.AuditTrailID }, auditTrail);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AuditTrailExists(int id)
        {
            return db.AuditTrails.Count(e => e.AuditTrailID == id) > 0;
        }
    }
}
