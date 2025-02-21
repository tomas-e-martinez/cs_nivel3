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
                Usuario usuario = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();
                usuario.User = txtUser.Text;
                usuario.Pass = txtPass.Text;
                int id = negocio.insertarNuevo(usuario);

            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }



        }
    }
}