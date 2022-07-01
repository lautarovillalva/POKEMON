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
    public partial class WebForm4 : System.Web.UI.Page
    {
        public int idPokemon;
        public Pokemon pokemon = new Pokemon();
        public Pokemon_neg pokemon_Neg = new Pokemon_neg();
        protected void Page_Load(object sender, EventArgs e)
        {
            idPokemon =Convert.ToInt32(Request.QueryString["ID"]);
            foreach (Pokemon item in pokemon_Neg.GetPokemons())
            {
                if (idPokemon == item.Id)
                {
                    pokemon = item;
                }
            }

        }
    }
}