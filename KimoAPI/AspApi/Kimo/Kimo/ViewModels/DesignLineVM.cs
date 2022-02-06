using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kimo.ViewModels
{
    public class DesignLineVM
    {

        public DesignLineVM() { }

        public int Design_Line_ID { get; set; }
        public int Design_ID { get; set; }
        public int Template_Position_ID { get; set; }
        public int Job_Type_ID { get; set; }
        public string Job_Type { get; set; }
        public int Width { get; set; }
        public int Height { get; set; }
        public string Image { get; set; }
        public string Text { get; set; }

    }
}