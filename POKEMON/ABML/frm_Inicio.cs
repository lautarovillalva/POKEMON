using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DOMINIO;
using NEGOCIO;

namespace ABML
{
    public partial class frm_Inicio : Form
    {
        public frm_Inicio()
        {
            InitializeComponent();
            LoadPokemons();
        }
        private void LoadImage(string ImageURL)
        {
            try
            {
                pbx_image.Load(ImageURL);
            }
            catch (Exception)
            {

                MessageBox.Show("no se puede cargar la imagen");
            }
        }
        private void LoadPokemons()
        {
            Pokemon_neg pokemon_Neg = new Pokemon_neg();
            dgv_pokemons.DataSource = pokemon_Neg.GetPokemons();
            LoadImage(pokemon_Neg.GetPokemons()[0].Images[0]);
        }

        private void dgv_pokemons_MouseClick(object sender, MouseEventArgs e)
        {
            Pokemon selected = (Pokemon)dgv_pokemons.CurrentRow.DataBoundItem;
            LoadImage(selected.Images[0]);
        }
    }
}
