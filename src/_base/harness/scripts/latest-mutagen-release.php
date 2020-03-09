<?php
$fetchOptions = stream_context_create([
    'http' => [
        'header' => "User-Agent: inviqa/harness-base-php\r\n",
    ],
]);
$releases = file_get_contents('https://api.github.com/repos/mutagen-io/mutagen/releases', false, $fetchOptions);
if (!$releases) {
    throw new Exception('Could not fetch releases. Response from GitHub: ' . $releases);
}

$jsonReleases = json_decode($releases, true);
if (!$jsonReleases) {
    throw new Exception('Could not decode releases. Response from GitHub: ' . $releases);
}

$stableReleases = array_filter($jsonReleases, function ($release) {
    return !$release['prerelease'] && !$release['draft'];
});
$latestStableRelease = reset($stableReleases);
if (!$latestStableRelease) {
    throw new Exception('Could not find latest stable release.');
}

$osFamily = strtolower(PHP_OS_FAMILY);
$releaseAssets = array_filter($latestStableRelease['assets'], function ($asset) use ($osFamily) {
    return preg_match("/^mutagen_.*${osFamily}.*amd64.*/", $asset['name']) > 0;
});
$releaseAsset = reset($releaseAssets);
if (!$releaseAsset) {
    throw new Exception('Could not find latest stable release asset for your OS Platform: ' . $osFamily);
}
echo $releaseAsset['browser_download_url'];
