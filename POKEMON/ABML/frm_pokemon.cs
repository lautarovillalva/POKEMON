using DOMINIO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using NEGOCIO;

namespace ABML
{
    public partial class frm_pokemon : Form
    {
        private readonly Pokemon pokemon = null;
        public frm_pokemon()
        {
            InitializeComponent();
        }

        public frm_pokemon(Pokemon selected)
        {
            InitializeComponent();
            this.pokemon = selected;
            Text = "MODIFY POKéMON";

        }
        private void LoadComponents()
        {
            Generation_neg generation_Neg = new Generation_neg();
            Type_neg type_Neg = new Type_neg();

            foreach (TypeP item in type_Neg.GetTypes())
            {
                clb_types.Items.Add(item.Name);
                clb_types.MultiColumn = true;
            }
            foreach (Generation item in generation_Neg.getGenerations())
            {
                lbx_generations.Items.Add(item.Name);
            }
        }
        public void LoadImage(string ImageURL)
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

        private void frm_pokemon_Load(object sender, EventArgs e)
        {
            try
            {
                LoadComponents();
                if (pokemon != null)
                {
                    lbl_id.Text = "#" + pokemon.Id;
                    tbx_name.Text = pokemon.Name;
                    tbx_hp.Text = pokemon.Hp.ToString();
                    tbx_attack.Text = pokemon.Attack.ToString();
                    tbx_defense.Text = pokemon.Defense.ToString();
                    tbx_spAttack.Text = pokemon.SpecialAttack.ToString();
                    tbx_spDefense.Text = pokemon.SpecialDefense.ToString();
                    tbx_speed.Text = pokemon.Speed.ToString();
                    tbx_image1.Text = pokemon.Images[0];
                    tbx_image2.Text = pokemon.Images[1];
                    tbx_image3.Text = pokemon.Images[2];


                    LoadImage(pokemon.Images[tbr_images.Value]);

                    for (int i = 0; i < lbx_generations.Items.Count; i++)
                    {
                        if (pokemon.Generation.Name == lbx_generations.Items[i].ToString())
                        {
                            lbx_generations.SelectedIndex = i;
                            pbx_generation.Load(pokemon.Generation.Image_URL);
                        }
                    }


                    if (pokemon.IsLegendary == true)
                    {
                        cbx_legendary.Checked = true;
                    }

                    foreach (TypeP item in pokemon.Types)
                    {
                        for (int i = 0; i < clb_types.Items.Count; i++)
                        {
                            if (clb_types.Items[i].ToString() == item.Name)
                            {
                                clb_types.SetItemChecked(i, true);
                            }


                        }

                    }


                }


            }
            catch (Exception)
            {

                throw;
            }
        }

        private void tbr_images_Scroll(object sender, EventArgs e)
        {
            if (pokemon != null)
            {
                LoadImage(pokemon.Images[tbr_images.Value]);
            }
        }

        private void btn_cancel_Click(object sender, EventArgs e)
        {
            error.Clear();
        }

        private bool Validation()
        {
            bool validation = true;
            if (tbx_name.Text == "")
            {
                validation = false;
                error.SetError(tbx_name, "Ingresar nombre.");
            }
            if (tbx_hp.Text == "" || tbx_attack.Text == "" || tbx_defense.Text == "" || tbx_speed.Text == "" || tbx_spAttack.Text == "" || tbx_spDefense.Text == "")
            {
                validation = false;
                error.SetError(gbx_stats, "Completar campos");
            }
            if (clb_types.CheckedIndices == null)
            {
                validation = false;
                error.SetError(gbx_types, "Seleccionar tipo/s.");
            }
            if (lbx_generations.SelectedItem == null)
            {
                validation = false;
                error.SetError(lbx_generations, "Seleccionar generación.");
            }
            if (tbx_image1.Text == "" || tbx_image2.Text == "" || tbx_image3.Text == "")
            {
                validation = false;
                error.SetError(gbx_images, "Completar al menos 3 imágenes");
            }



            return validation;
        }


        private void btn_save_Click(object sender, EventArgs e)
        {
            error.Clear();
            if (Validation())
            {
                if (pokemon == null)
                {
                    //AddPokemon();
                }
                else
                {
                    //ModifyPokmeon();
                }
            }
            else
            {
                MessageBox.Show("Completar campos requeridos.");
            }
        }
    }
}
