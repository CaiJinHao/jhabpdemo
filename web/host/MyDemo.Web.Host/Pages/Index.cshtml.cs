using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;

namespace MyDemo.Pages;

public class IndexModel : MyDemoPageModel
{
    public void OnGet()
    {

    }

    public async Task OnPostLoginAsync()
    {
        await HttpContext.ChallengeAsync("oidc");
    }
}
