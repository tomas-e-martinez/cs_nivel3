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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["usuario"] != null)
            {
                Session.Add("error", "ya estas logueado");
                Response.Redirect("../Error.aspx", false);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                usuario.User = txtUsuario.Text;
                usuario.Pass = txtPass.Text;

                if (negocio.Loguear(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("MenuLogin.aspx", false);
                }
                else
                {
                    Session.Add("error", "usuario o pass incorrecto");
                    Response.Redirect("../Error.aspx", false);
                }
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("../Error.aspx");
            }
        }
    }
}