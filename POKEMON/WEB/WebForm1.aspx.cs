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
    public partial class WebForm1 : System.Web.UI.Page
    {
        public Pokemon_neg pokemon_Neg = new Pokemon_neg();

        protected void Page_Load(object sender, EventArgs e)
        {
            rpPokemons.DataSource = pokemon_Neg.GetPokemons();
            rpPokemons.DataBind();

        }
    }
}