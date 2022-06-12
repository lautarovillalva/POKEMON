using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DOMINIO;
using DAO;

namespace NEGOCIO
{
    public class Pokemon_neg
    {
        private Pokemon_dao pokemon_Dao = new Pokemon_dao();
        private Generation_neg generation_Neg = new Generation_neg();
        private Type_neg type_Neg = new Type_neg();
        public List<Pokemon> GetPokemons()
        {
            List<Pokemon> pokemons = new List<Pokemon>();
            pokemons = pokemon_Dao.GetPokemons();

            foreach (Pokemon pok in pokemons)
            {
                foreach (Generation gen in generation_Neg.getGenerations())
                {
                    if (pok.Generation.Id == gen.Id)
                    {
                        pok.Generation = gen;
                    }

                }

                foreach (TypeP typ in type_Neg.GetTypes())
                {
                    if (pok.Type1.Id == typ.Id)
                    {
                        pok.Type1 = typ;
                    }
                    if (pok.Type2.Id == typ.Id)
                    {
                        pok.Type2 = typ;
                    }

                }

            }
            return pokemons;


        }

    }
}
