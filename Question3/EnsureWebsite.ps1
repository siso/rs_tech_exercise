Configuration EnsureWebsite
{
	Import-DscResource -Module xWebAdministration 

	Node localhost
	{
		xWebAppPool WebsiteAppPool
		{
			Name = "Website"
			Ensure = "Present"
			State = "Started"
		}
		
		xWebsite DefaultWebSite
		{
			Name = "Default Web Site"
			State = "Stopped"
		}
		
		xWebsite Website
          {
               Ensure = "Present"
               Name = "Website"
               State = "Started"
               ApplicationPool = "Website"
               PhysicalPath = "c:\inetpub\wwwroot\website\site_root"
          }	
	}
}

EnsureWebsite