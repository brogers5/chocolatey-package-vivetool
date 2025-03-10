Import-Module PowerShellForGitHub

$archiveFileNameRegex = 'ViVeTool-v[\d\.]+-IntelAmd\.zip'
$owner = 'thebookisclosed'
$repository = 'ViVe'

function Get-GitHubReleaseObject([version] $Version) {
    if ($null -eq $Version) {
        # Default to latest stable version
        $release = (Get-GitHubRelease -OwnerName $owner -RepositoryName $repository -Latest)[0]
    }
    else {
        $release = Get-GitHubRelease -OwnerName $owner -RepositoryName $repository -Tag "v$($Version.ToString())"
    }

    return $release
}

function Get-SourceCode([version] $Version) {
    $release = Get-GitHubReleaseObject -Version $Version
    $userAgent = 'Update checker of Chocolatey Community Package ''vivetool'''
    Invoke-WebRequest -Uri $release.zipball_url -UserAgent $userAgent -OutFile ".\ViVe-v$Version.zip" -UseBasicParsing
}

function Get-LatestStableVersion {
    $latestRelease = (Get-GitHubRelease -OwnerName $owner -RepositoryName $repository -Latest)[0]

    return [version] $latestRelease.tag_name.Substring(1)
}

function Get-SoftwareUri([version] $Version) {
    $release = Get-GitHubReleaseObject -Version $Version
    $releaseAssets = Get-GitHubReleaseAsset -OwnerName $owner -RepositoryName $repository -Release $release.ID

    $windowsPortableArchiveAsset = $null
    foreach ($asset in $releaseAssets) {
        if ($asset.name -match $archiveFileNameRegegexx) {
            $windowsPortableArchiveAsset = $asset
            break
        }
        else {
            continue
        }
    }

    if ($null -eq $windowsPortableArchiveAsset) {
        throw 'Cannot find published Windows portable archive asset!'
    }

    return $windowsPortableArchiveAsset.browser_download_url
}
