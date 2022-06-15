using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DOMINIO
{
    public class Pokemon
    {
        public int Id { get; set; }
        public string Name { get; set; }
        //public TypeP Type1 { get; set; }
        //public TypeP Type2 { get; set; }
        public List<TypeP> Types { get; set; }
        public int Hp { get; set; }
        public int Attack { get; set; }
        public int Defense { get; set; }
        public int Speed { get; set; }
        public int SpecialAttack { get; set; }
        public int SpecialDefense { get; set; }
        public bool IsLegendary { get; set; }
        public Generation Generation { get; set; }
        public List<string> Images { get; set; }
    }
}
