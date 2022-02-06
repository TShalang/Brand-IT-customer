using Kimo.Models;
using Kimo.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace Kimo.Services
{
    public class EmailService
    {


        public void SendEmail(Customer customer)
        {
            SmtpClient emp = new SmtpClient();
            emp.DeliveryMethod = SmtpDeliveryMethod.Network;
            emp.EnableSsl = true;
            emp.Host = "smtp.gmail.com";
            emp.Port = 587;

            System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("kimosystem1@gmail.com", "Kimo1234");
            emp.UseDefaultCredentials = false;
            emp.Credentials = credentials;

            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("kimosystem1@gmail.co");
            msg.To.Add(new MailAddress(customer.Email_Address));

            msg.Subject = "Kimosource Order";
            msg.IsBodyHtml = true;
            msg.Body = "Hi " + customer.First_Name + " " + customer.Last_Name + ". Your package is ready for collection";

            try
            {
                emp.Send(msg);
                //return "OK";
            }
            catch (Exception)
            {

            }
            //return "OK";
        }



        public void SendSuppEmail(Supplier supplier, Supplier_Order_Line ol)
        {
            SmtpClient emp = new SmtpClient();
            emp.DeliveryMethod = SmtpDeliveryMethod.Network;
            emp.EnableSsl = true;
            emp.Host = "smtp.gmail.com";
            emp.Port = 587;

            System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("kimosystem1@gmail.com", "Kimo1234");
            emp.UseDefaultCredentials = false;
            emp.Credentials = credentials;

            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("kimosystem1@gmail.co");
            msg.To.Add(new MailAddress(supplier.Email));

            msg.Subject = "Kimosource: New Order";
            msg.IsBodyHtml = true;
            msg.Body = "Hey I would like to order the following:" + "<br/>" + "<br/>" + "<br/>" + "Product:" + " " + ol.Description  +"<br/>" + " Quantity: " + ol.Quantity + "<br/>" + "<br/>" + "<br/>" + "Thank You.";

            try
            {
                emp.Send(msg);
                //return "OK";
            }
            catch (Exception)
            {

            }
            //return "OK";
        }

    }
}