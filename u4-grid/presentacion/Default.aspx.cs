using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;

namespace presentacion
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["listaPersonas"] == null)
            {
                PersonaNegocio negocio = new PersonaNegocio();
                Session.Add("listaPersonas", negocio.listar());
            }

            dgvPersonas.DataSource = Session["listaPersonas"];
            dgvPersonas.DataBind();
        }

        protected void dgvPersonas_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = dgvPersonas.SelectedDataKey.Value.ToString();
            Response.Redirect("PersonaForm.aspx?id=" +  id);
        }
    }
}