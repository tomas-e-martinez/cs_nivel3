using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using dominio;
using negocio;

namespace presentacion
{
    public partial class ArticuloForm : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulo { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            if (!IsPostBack)
            {
                CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
                List<Categoria> listaCategorias = categoriaNegocio.listar();
                MarcaNegocio marcaNegocio = new MarcaNegocio();
                List<Marca> listaMarcas = marcaNegocio.listar();

                ddlCategoria.DataSource = listaCategorias;
                ddlCategoria.DataTextField = "Descripcion";
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataBind();

                ddlMarca.DataSource = listaMarcas;
                ddlMarca.DataTextField = "Descripcion";
                ddlMarca.DataValueField = "Id";
                ddlMarca.DataBind();

                if (Request.QueryString["id"] != null)
                {
                    btnAceptar.Visible = false;
                    btnModificar.Visible = true;
                    btnEliminar.Visible = true;
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    txtId.Text = id.ToString();

                    ListaArticulo = (List<Articulo>)Session["listaArticulos"];

                    Articulo seleccionado = ListaArticulo.Find(x => x.Id == id);

                    txtCodigo.Text = seleccionado.Codigo;
                    txtDescripcion.Text = seleccionado.Descripcion;
                    txtNombre.Text = seleccionado.Nombre;
                    txtPrecio.Text = seleccionado.Precio.ToString();
                    txtUrlImagen.Text = seleccionado.ImagenUrl;
                    txtUrlImagen_TextChanged(sender, e);
                    ddlCategoria.SelectedValue = seleccionado.Categoria.Id.ToString();
                    ddlMarca.SelectedValue = seleccionado.Marca.Id.ToString();
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Articulo art = new Articulo();
                ArticuloNegocio articuloNegocio = new ArticuloNegocio();


                art.Descripcion = txtDescripcion.Text;
                art.Precio = decimal.Parse(txtPrecio.Text);
                art.Nombre = txtNombre.Text;
                art.Codigo = txtCodigo.Text;
                art.ImagenUrl = txtUrlImagen.Text;

                art.Categoria = new Categoria();
                art.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);
                art.Marca = new Marca();
                art.Marca.Id = int.Parse(ddlMarca.SelectedValue);

                articuloNegocio.agregar(art);
                Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void txtUrlImagen_TextChanged(object sender, EventArgs e)
        {
            imgArticulo.ImageUrl = txtUrlImagen.Text;
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                Articulo art = new Articulo();
                ArticuloNegocio articuloNegocio = new ArticuloNegocio();

                art.Id = int.Parse(Request.QueryString["id"]);

                art.Descripcion = txtDescripcion.Text;
                art.Precio = decimal.Parse(txtPrecio.Text);
                art.Nombre = txtNombre.Text;
                art.Codigo = txtCodigo.Text;
                art.ImagenUrl = txtUrlImagen.Text;

                art.Categoria = new Categoria();
                art.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);
                art.Marca = new Marca();
                art.Marca.Id = int.Parse(ddlMarca.SelectedValue);

                articuloNegocio.modificar(art);
                Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                ArticuloNegocio articuloNegocio = new ArticuloNegocio();

                articuloNegocio.eliminar(int.Parse(Request.QueryString["id"]));
                Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }
    }
}