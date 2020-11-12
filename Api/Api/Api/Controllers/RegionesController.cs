using ConectaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Api.Controllers
{
    public class RegionesController : ApiController
    {
        //Visualiza todos los registros (api/regiones)
        [HttpGet]
        public IEnumerable<Region> Get()
        {
            using (RegionesEntities regionesentities = new RegionesEntities())
            {
                return regionesentities.Region.ToList();
            }
        }

        //Visualiza todos los registros (api/regiones)
        [HttpGet]
        public Region Get(int id)
        {
            using (RegionesEntities regionesentities = new RegionesEntities())
            {
                return regionesentities.Region.FirstOrDefault(e => e.codRegion == id);
            }
        }
    }
}
