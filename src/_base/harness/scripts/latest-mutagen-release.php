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

$goArchMap = [
    'i386' => '386',
    'x86_64' => 'amd64',
    'aarch64' => 'arm64',
    'armv7l' => 'arm',
    'armv6l' => 'arm',
];

$osFamily = strtolower(PHP_OS_FAMILY);
$hostArch = php_uname('m');
$goArch = $goArchMap[php_uname('m')] ?? $hostArch;
$releaseAssets = array_filter($latestStableRelease['assets'], function ($asset) use ($osFamily, $goArch) {
    return preg_match("/^mutagen_.*${osFamily}.*${goArch}.*/", $asset['name']) > 0;
});
$releaseAsset = reset($releaseAssets);
if (!$releaseAsset) {
    throw new Exception('Could not find latest stable release asset for your OS Platform: ' . $osFamily);
}
echo $releaseAsset['browser_download_url'];
