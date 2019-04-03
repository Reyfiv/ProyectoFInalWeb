using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace BLL
{
    public class LoginRepositorio : RepositorioBase<Usuarios>
    {
        private List<Usuarios> Listar(Expression<Func<Usuarios, bool>> expression)
        {
            List<Usuarios> Lista = new List<Usuarios>();
            try
            {
                Lista = _contexto.Set<Usuarios>().Where(expression).ToList();
            }
            catch (Exception)
            {
                throw;
            }
            return Lista;
        }


        public bool Auntenticar(string usuario, string contraseña)
        {

            Expression<Func<Usuarios, bool>> filtrar = x => true;
            filtrar = t => t.NombreUsuario.Equals(usuario) && t.Contraseña.Equals(contraseña);
            bool paso = false;
            if (Listar(filtrar).Count() != 0)
            {
                
                paso = true;
            }
            return paso;
        }
    }
}
