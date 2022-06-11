using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DOMINIO;
using NEGOCIO;

namespace WEB
{
    public partial class test : System.Web.UI.Page
    {
        private Generation_neg generation_Neg = new Generation_neg();
        protected void Page_Load(object sender, EventArgs e)
        {
            rpGenerations.DataSource = generation_Neg.getGenerations();
            rpGenerations.DataBind();
        }
    }
}