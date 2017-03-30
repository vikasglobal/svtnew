using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(eDiaryWebForms.Startup))]
namespace eDiaryWebForms
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
