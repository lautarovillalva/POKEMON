using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DOMINIO
{
    public class pokemon
    {
        public int id { get; set; }
        public string name { get; set; }
        public Type type1 { get; set; }
        public Type type2 { get; set; }
        public int hp { get; set; }
        public int attack { get; set; }
        public int defense { get; set; }
        public int speed { get; set; }
        public int specialDefense { get; set; }
        public bool isLegendary { get; set; }
        public generation generation { get; set; }
    }
}
