using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace presentacion
{
    public partial class _Default : Page
    {
        public List<Articulo> ListaArticulo { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            ListaArticulo = negocio.listarSP();
            Session.Add("listaArticulos", ListaArticulo);

            repRepetidor.DataSource = ListaArticulo;
            repRepetidor.DataBind();
        }

        protected void filtro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> listaFiltrada = ListaArticulo.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            repRepetidor.DataSource= listaFiltrada;
            repRepetidor.DataBind();
        }
    }
}