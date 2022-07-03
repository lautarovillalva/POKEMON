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
            dgv_pokemons.Columns["Hp"].Visible = false;
            dgv_pokemons.Columns["Attack"].Visible = false;
            dgv_pokemons.Columns["Defense"].Visible = false;
            dgv_pokemons.Columns["Speed"].Visible = false;
            dgv_pokemons.Columns["SpecialAttack"].Visible = false;
            dgv_pokemons.Columns["SpecialDefense"].Visible = false;
            dgv_pokemons.Columns["Generation"].Visible = false;

            LoadImage(pokemon_Neg.GetPokemons()[0].Images[tbr_images.Value]);
            lbl_generation.Text = pokemon_Neg.GetPokemons()[0].Generation.Name;
            pbx_generation.Load(pokemon_Neg.GetPokemons()[0].Generation.Image_URL);
            lbl_hp.Text         =pokemon_Neg.GetPokemons()[0].Hp.ToString();
            lbl_attack.Text     =pokemon_Neg.GetPokemons()[0].Attack.ToString();
            lbl_defense.Text    =pokemon_Neg.GetPokemons()[0].Defense.ToString();
            lbl_speed.Text      =pokemon_Neg.GetPokemons()[0].Speed.ToString();
            lbl_spAttack.Text   =pokemon_Neg.GetPokemons()[0].SpecialAttack.ToString();
            lbl_spDefense.Text =pokemon_Neg.GetPokemons()[0].SpecialDefense.ToString();

            lbl_type2.Visible = false;
            lbl_type1.Text = pokemon_Neg.GetPokemons()[0].Types[0].Name;
            
            if (pokemon_Neg.GetPokemons()[0].Types.Count == 2)
            {
                lbl_type2.Visible = true;
                lbl_type2.Text = pokemon_Neg.GetPokemons()[0].Types[1].Name;

            }
        }

        private void dgv_pokemons_MouseClick(object sender, MouseEventArgs e)
        {
            Pokemon selected = (Pokemon)dgv_pokemons.CurrentRow.DataBoundItem;
            LoadImage(selected.Images[tbr_images.Value]);
            lbl_hp.Text = selected.Hp.ToString();
            lbl_attack.Text = selected.Attack.ToString();
            lbl_defense.Text = selected.Defense.ToString();
            lbl_speed.Text = selected.Speed.ToString();
            lbl_spAttack.Text = selected.SpecialAttack.ToString();
            lbl_spDefense.Text = selected.SpecialDefense.ToString();

            lbl_generation.Text = selected.Generation.Name;
            pbx_generation.Load(selected.Generation.Image_URL);


            lbl_type2.Visible = false;
            lbl_type1.Text = selected.Types[0].Name;
            if (selected.Types.Count == 2)
            {
                lbl_type2.Visible = true;
                lbl_type2.Text = selected.Types[1].Name;

            }
        }

        private void tbr_images_Scroll(object sender, EventArgs e)
        {
            Pokemon selected = (Pokemon)dgv_pokemons.CurrentRow.DataBoundItem;
            LoadImage(selected.Images[tbr_images.Value]);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            frm_pokemon frm_Pokemon = new frm_pokemon();
            frm_Pokemon.ShowDialog();
        }
    }
}
