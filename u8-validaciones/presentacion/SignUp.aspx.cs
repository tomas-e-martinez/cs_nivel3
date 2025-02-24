using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace presentacion
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtUser.Text == "" || txtPass.Text == "")
                {
                    Session.Add("error", "usuario o pass vacio");
                    Response.Redirect("../Error.aspx", false);
                }

                Usuario usuario = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();
                usuario.User = txtUser.Text;
                usuario.Pass = txtPass.Text;
                int id = negocio.insertarNuevo(usuario);
                Session.Add("usuario", usuario);
                Response.Redirect("Default.aspx", false);

            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }



        }
    }
}