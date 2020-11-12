using ConectaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Api.Controllers
{
    public class PaisesController : ApiController
    {
        private PaisesEntities dbContext = new PaisesEntities();

        //Visualiza todos los registros (api/paises)
        [HttpGet]
        public IEnumerable<Pais> Get()
        {
            using (PaisesEntities paisesentities = new PaisesEntities())
            {
                return paisesentities.Pais.ToList();
            }
        }

        //Visualiza todos los registros (api/paises)
        [HttpGet]
        public Pais Get(int idPais)
        {
            using (PaisesEntities paisesentities = new PaisesEntities())
            {
                return paisesentities.Pais.FirstOrDefault(e => e.codPais == idPais);
            }
        }

    }
}
