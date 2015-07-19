$source = "https://gist.githubusercontent.com/nick-o/fb83168225b53421c353/raw/53bedf835024ee6761f519d5d0b7381d3fd07601/PoSh.txt"
$destination = "Powershell.txt"

Invoke-WebRequest $source -OutFile $destination

$allDownloadContent = Get-Content $destination

Write-Host "Basic Stats"
Write-Host "==========="
$allDownloadContent | measure -Line -Word -Character 

$nonWordWithSpace = new-object System.Text.RegularExpressions.Regex ('[^a-zA-Z0-9-\s]+')

$allWords = $nonWordWithSpace.Replace($allDownloadContent, "").Split(" ")

Write-Host ""

Write-Host "Word Counts top 10"
Write-Host "=================="
$allWords | Group-Object | Sort-Object -property Count -descending | Select-Object -first 10 | Foreach-Object { Write-Host $_.Name $_.Count }

$nonWord = new-object System.Text.RegularExpressions.Regex ('[^a-zA-Z0-9-]+')

$allChars = $nonWord.Replace($allDownloadContent, "").ToCharArray()

Write-Host ""

Write-Host "Character Counts top 10"
Write-Host "======================="
$allChars | Group-Object | Sort-Object -property Count -descending | Select-Object -first 10 | Foreach-Object { Write-Host $_.Name $_.Count }


