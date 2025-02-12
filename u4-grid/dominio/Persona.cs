using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Persona
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int Edad { get; set; }
    }

    public class PersonaNegocio
    {
        public List<Persona> listar()
        {
            List<Persona> lista = new List<Persona>();

            lista.Add(new Persona());
            lista.Add(new Persona());

            lista[0].Id = 0;
            lista[0].Nombre = "Tomás";
            lista[0].Edad = 26;

            lista[1].Id = 1;
            lista[1].Nombre = "Candela";
            lista[1].Edad = 25;




            return lista;
        }
    }
}
