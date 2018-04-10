using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CRUDPractiseWithSampleDatabase.Startup))]
namespace CRUDPractiseWithSampleDatabase
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
