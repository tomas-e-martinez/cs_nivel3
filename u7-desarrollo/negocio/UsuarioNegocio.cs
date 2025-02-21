using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;
using negocio;

namespace negocio
{
    public class UsuarioNegocio
    {
        public bool  Loguear(Usuario usuario)
        {
			AccesoDatos datos = new AccesoDatos();
            try
			{
                datos.setearQuery("Select id, tipouser from USUARIOS where usuario = @usuario and pass = @pass");
                datos.setearParametro("@usuario", usuario.User);
                datos.setearParametro("@pass", usuario.Pass);

                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["id"];
                    usuario.TipoUsuario = (int)datos.Lector["tipouser"] == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
                    return true;
                }
                return false;
            }
			catch (Exception ex)
			{

				throw ex;
			}
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
