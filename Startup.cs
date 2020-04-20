using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(proyectofinal_prueba_.Startup))]
namespace proyectofinal_prueba_
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
