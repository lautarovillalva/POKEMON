using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using DOMINIO;

namespace DAO
{
    public class Pokemon_dao
    {
        readonly DataAccess DataAccess = new DataAccess();
        
        private List<string> GetImageByIdPokemon(int idPokemon)
        {
            string query = "SELECT ID_POKEMON, IMAGE_URL FROM IMAGESBYPOKEMON";
            DataTable dataTable = DataAccess.GetDataTable("Images", query);

            List<string> images = new List<string>();
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                if (idPokemon == Convert.ToInt32(dataTable.Rows[i][0]))
                {
                    images.Add(Convert.ToString(dataTable.Rows[i][1]));
                    
                }

            }

            return images;
        }

        public List<Pokemon> GetPokemons()
        {
            List<Pokemon> pokemons = new List<Pokemon>();
            string query = "SELECT ID, NAME_, HP, ATTACK, DEFENSE, SPECIAL_ATTACK,SPECIAL_DEFENSE, SPEED, LENGENDARY, ID_GENERATION FROM POKEMONS";
            DataTable dataTable = DataAccess.GetDataTable("Pokemons", query);
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                Pokemon pokemon = new Pokemon();
                pokemon.Id = Convert.ToInt32(dataTable.Rows[i][0]);
                pokemon.Name = dataTable.Rows[i][1].ToString();
                pokemon.Hp = Convert.ToInt32(dataTable.Rows[i][2]);
                pokemon.Attack = Convert.ToInt32(dataTable.Rows[i][3]);
                pokemon.Defense = Convert.ToInt32(dataTable.Rows[i][4]);
                pokemon.SpecialAttack = Convert.ToInt32(dataTable.Rows[i][5]);
                pokemon.SpecialDefense = Convert.ToInt32(dataTable.Rows[i][6]);
                pokemon.Speed = Convert.ToInt32(dataTable.Rows[i][7]);
                pokemon.IsLegendary = Convert.ToBoolean(dataTable.Rows[i][8]);
                //pokemon.Type1 = new TypeP(Convert.ToInt32(dataTable.Rows[i][9]));
                //pokemon.Type2 = new TypeP(Convert.ToInt32(dataTable.Rows[i][10]));

                pokemon.Types = GetTypesByPokemon(pokemon.Id);

                pokemon.Generation =new Generation(Convert.ToInt32(dataTable.Rows[i][9]));

                pokemon.Images = GetImageByIdPokemon(pokemon.Id);
                pokemons.Add(pokemon);
            }
            return pokemons;
        }

        private List<TypeP> GetTypesByPokemon(int idPokemon)
        {
            List<TypeP> typePs = new List<TypeP>();
            string query = "SELECT ID_POKEMON, ID_TYPE FROM TYPESBYPOKEMON";
            DataTable dataTable = DataAccess.GetDataTable("TypesByPokemon", query);
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                if (idPokemon == Convert.ToInt32(dataTable.Rows[i][0]))
                {
                    typePs.Add(new TypeP(Convert.ToInt32(dataTable.Rows[i][1])));
                    
                }

            }
            return typePs;
        }
    }
}
