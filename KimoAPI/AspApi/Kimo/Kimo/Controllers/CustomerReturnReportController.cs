using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Kimo.Models;
using static Kimo.Models.myReport;

namespace Kimo.Controllers
{
    [RoutePrefix("Api/CustomerReturnReport")]
    public class CustomerReturnReportController : ApiController
    {

        [HttpPost]
        [Route("getData")]

        public dynamic getData(SearchData sd)
        {
            KIMODBEntities db = new KIMODBEntities();
            db.Configuration.ProxyCreationEnabled = false;
            DataResult res = new DataResult();

            var lists = db.Return_Customer_Order.Where(zz => zz.Date >= sd.startdate && zz.Date <= sd.enddate).ToList();
            return getExpandoReport(lists);
        }

        KIMODBEntities db = new KIMODBEntities();

        public dynamic getExpandoReport(List<Return_Customer_Order> lists)
        {
            try
            {
                List<dynamic> dynamicjobs = new List<dynamic>();
                dynamic total = new ExpandoObject();
                KIMODBEntities db = new KIMODBEntities();
                foreach(Return_Customer_Order Jb in lists)
                {
                    dynamic dynamicjob = new ExpandoObject();
                    dynamicjob.customerReturnID = Jb.Return_Customer_Order_ID;
                    dynamicjob.Date = Jb.Date;
                    dynamicjob.Reason = Jb.Reason;
                    dynamicjob.ProductName = Jb.Product;

                    dynamicjobs.Add(dynamicjob);
                }
                total.Payment = dynamicjobs;
                return total;
            }
            catch (Exception)
            {
                dynamic User = new ExpandoObject();
                User.Message = "Something went wrong!";
                return User;
            }
        }

    }
}
