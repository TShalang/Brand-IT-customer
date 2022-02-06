using Kimo.Models;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using static Kimo.Models.myReport;

namespace Kimo.Controllers
{

    [RoutePrefix("api/SalesReport")]
    public class SalesReportController : ApiController
    {

        [HttpPost]
        [Route("getData1")]

        public dynamic getData1(SearchData sd)
        {
            TshidiDatabaseEntities db = new TshidiDatabaseEntities();
            db.Configuration.ProxyCreationEnabled = false;
            DataResult res = new DataResult();

            var lists = db.Customer_Order_Line.Where(zz => zz.Date >= sd.startdate && zz.Date <= sd.enddate).ToList();



            return getExpandoReport(lists);

        }
        TshidiDatabaseEntities db = new TshidiDatabaseEntities();
        public dynamic getExpandoReport(List<Customer_Order_Line> lists)

        {



            try
            {

                List<dynamic> dynamicjobs = new List<dynamic>();
                dynamic total = new ExpandoObject();
                TshidiDatabaseEntities db = new TshidiDatabaseEntities();
                foreach (Customer_Order_Line Jb in lists)
                {
                    dynamic dynamicjob = new ExpandoObject();
                    dynamicjob.customerOrderID = Jb.Customer_Order_ID;
                    dynamicjob.producttype = Jb.Product_Type_ID;
                    dynamicjob.Date = Jb.Date;
                    dynamicjob.Description = Jb.Description;
                    dynamicjob.Quantity = Jb.Quantity;
                    dynamicjob.Price = Jb.Price;


                    dynamicjobs.Add(dynamicjob);
                }
                total.Sum = lists.Sum(vv => vv.Price);
                total.Payment = dynamicjobs;
                total.Payment = dynamicjobs;
                return total;


            }
            catch (Exception)
            {

                dynamic User = new ExpandoObject();
                User.Message = "Something went wrong !";
                return User;
            }
        }
    }
}