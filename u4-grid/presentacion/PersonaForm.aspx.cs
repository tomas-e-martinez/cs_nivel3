using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;

namespace presentacion
{
    public partial class PersonaForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    btnAceptar.Visible = false;
                    btnModificar.Visible = true;
                    btnEliminar.Visible = true;
                    int id = int.Parse(Request.QueryString["id"]);
                    txtId.Text = id.ToString();
                    txtId.ReadOnly = true;
                
                    Persona seleccionado = ((List<Persona>)Session["listaPersonas"]).Find(x => x.Id == id);

                    txtNombre.Text = seleccionado.Nombre;
                    txtEdad.Text = seleccionado.Edad.ToString();
                }
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Persona persona = new Persona();
            persona.Id = int.Parse(txtId.Text);
            persona.Nombre = txtNombre.Text;
            persona.Edad = int.Parse(txtEdad.Text);

            ((List<Persona>)Session["listaPersonas"]).Add(persona);

            Response.Redirect("Default");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(txtId.Text);
            Persona seleccionado = ((List<Persona>)Session["listaPersonas"]).Find(x => x.Id == id);

            ((List<Persona>)Session["listaPersonas"]).Remove(seleccionado);

            Response.Redirect("Default");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            List<Persona> listaPersonas = (List<Persona>)Session["listaPersonas"];

            if(listaPersonas != null)
            {
                int indice = listaPersonas.FindIndex(x => x.Id == int.Parse(Request.QueryString["id"]));
                Persona persona = listaPersonas[indice];
                persona.Nombre = txtNombre.Text;
                persona.Edad = int.Parse(txtEdad.Text);
            }

            Session["listaPersonas"] = listaPersonas;
            Response.Redirect("Default");
        }
    }
}