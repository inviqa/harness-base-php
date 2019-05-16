<?php

$stores = [];

$stores['DE'] = [
    // different contexts
    'contexts' => [
        // shared settings for all contexts
        '*' => [
            'timezone' => 'Europe/Berlin',
            'dateFormat' => [
                // short date (01.02.12)
                'short' => 'd/m/Y',
                // medium Date (01. Feb 2012)
                'medium' => 'd. M Y',
                // date formatted as described in RFC 2822
                'rfc' => 'r',
                'datetime' => 'Y-m-d H:i:s',
            ],
        ],
        // settings for contexts (overwrite shared)
        'yves' => [],
        'zed' => [
            'dateFormat' => [
                // short date (2012-12-28)
                'short' => 'Y-m-d',
            ],
        ],
    ],
    'locales' => [
        // first entry is default
        'en' => 'en_US',
        'de' => 'de_DE',
    ],
    // first entry is default
    'countries' => ['DE', 'AT'],
    // internal and shop
    'currencyIsoCode' => 'EUR',
    'currencyIsoCodes' => ['EUR', 'CHF'],
    'queuePools' => [
        'synchronizationPool' => [
            'DE-connection',
            'AT-connection',
            'US-connection',
        ],
    ],
    'storesWithSharedPersistence' => ['AT','US'],
];

$stores['AT'] = [
        'storesWithSharedPersistence' => ['DE','US'],
    ] + $stores['DE'];

$stores['US'] = [
        'storesWithSharedPersistence' => ['DE','AT'],
    ] + $stores['DE'];

// @hook travis-ci

return $stores;
