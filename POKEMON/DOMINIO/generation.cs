using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DOMINIO
{
    public class Generation
    {

        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime Date { get; set; }
        public string Information { get; set; }
        public string Image_URL { get; set; }
        public Generation() { }

        public Generation(int id)
        {
            this.Id = id;
        }
        public override string ToString()
        {
            return Name; 
        }
    }

}
