Configuration EnsureResources
{
	Node localhost
	{
		WindowsFeature IIS 
		{ 
			Ensure = "Present" 
			Name = "Web-Server" 
		}
		
        File WebsiteFileExist
        {
            Ensure = "Present" 
            Type = "File"
			Recurse = $true
            SourcePath = "D:\source\website.zip"
            DestinationPath = "C:\website\website.zip"
        }

		Archive WebsiteExtracted 
		{
			Ensure = "Present"
			Path = "D:\source\website.zip"
			Destination = "C:\inetpub\wwwroot\website"
			Force = $true
		}		
	}
}

EnsureResources