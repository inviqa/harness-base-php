<?php

/**
 * This is a modified version of the default app/etc/NonComposerComponentRegistration.php
 * It adds caching in production mode to avoid using filesystem scanning (glob) on each request
 * Also it add the "src" folder to the magento module location lists (registration globlist)
 */

/**
 * Copyright © Magento, Inc. All rights reserved.
 * See COPYING.txt for license details.
 */

//Register components (via a list of glob patterns)
namespace Magento\NonComposerComponentRegistration;

use Magento\Framework\App\State;
use RuntimeException;

require_once dirname(__DIR__) . '/autoload.php';

/**
 * Include files from a list of glob patterns
 *
 * @throws RuntimeException
 *
 * @return void
 */
$find = function () {
    $manifest = [];
    $globPatterns = require __DIR__ . '/registration_globlist.php';
    $globPatterns = array_merge($globPatterns, ['src/*/*/cli_commands.php', 'src/*/*/registration.php']);
    $baseDir = BP . '/';

    foreach ($globPatterns as $globPattern) {
        // Sorting is disabled intentionally for performance improvement
        $files = glob($baseDir . $globPattern, GLOB_NOSORT);
        if ($files === false) {
            throw new RuntimeException("glob(): error with '$baseDir$globPattern'");
        }
        $manifest = array_merge($manifest, $files);
    }

    // Remove the base path from the manifest entries, so we return `src/...` instead of `/app/src/...`
    $baseDirRegex = preg_quote($baseDir);
    $manifest = preg_replace("#^$baseDirRegex#", '', $manifest);

    return $manifest;
};

$cache = function ($find) {
    if (getenv(State::PARAM_MODE) !== State::MODE_PRODUCTION) {
        return $find();
    }

    $moduleManifestPath = BP . '/generated/module_manifest.php';

    if (!file_exists($moduleManifestPath)) {
        file_put_contents($moduleManifestPath, "<?php\nreturn " . var_export($find(), true) . ";");
    }

    return require_once $moduleManifestPath;
};

$load = function ($files) {
    array_map(function ($file) {
        require_once BP . '/' . $file;
    }, $files);
};

$load($cache($find));
