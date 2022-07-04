using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DOMINIO
{
    public class TypeP
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public TypeP(int id)
        {
            this.Id = id;
        }
        public TypeP(int id, string name)
        {
            this.Id = id;
            this.Name = name;
        }
        public TypeP() { }

        public override string ToString()
        {
            return Name;
        }
    }

}
