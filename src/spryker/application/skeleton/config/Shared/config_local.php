<?php

use Pyz\Shared\Queue\QueueConstants;
use Pyz\Shared\Scheduler\SchedulerConfig;
use Pyz\Zed\Propel\PropelConfig;
use Pyz\Shared\Console\ConsoleConstants;
use Spryker\Shared\Application\ApplicationConstants;
use Spryker\Shared\Collector\CollectorConstants;
use Spryker\Shared\Customer\CustomerConstants;
use Spryker\Shared\GlueApplication\GlueApplicationConstants;
use Spryker\Shared\Http\HttpConstants;
use Spryker\Shared\Kernel\KernelConstants;
use Spryker\Shared\Kernel\Store;
use Spryker\Shared\Mail\MailConstants;
use Spryker\Shared\Newsletter\NewsletterConstants;
use Spryker\Shared\ProductManagement\ProductManagementConstants;
use Spryker\Shared\Propel\PropelConstants;
use Spryker\Shared\PropelQueryBuilder\PropelQueryBuilderConstants;
use Spryker\Shared\RabbitMq\RabbitMqEnv;
use Spryker\Shared\Router\RouterConstants;
use Spryker\Shared\Scheduler\SchedulerConstants;
use Spryker\Shared\SchedulerJenkins\SchedulerJenkinsConfig;
use Spryker\Shared\SchedulerJenkins\SchedulerJenkinsConstants;
use Spryker\Shared\SearchElasticsearch\SearchElasticsearchConstants;
use Spryker\Shared\SecurityBlocker\SecurityBlockerConstants;
use Spryker\Shared\Session\SessionConstants;
use Spryker\Shared\SessionRedis\SessionRedisConstants;
use Spryker\Shared\StorageRedis\StorageRedisConstants;
use Spryker\Shared\Twig\TwigConstants;
use Spryker\Shared\ZedRequest\ZedRequestConstants;
use Twig\Cache\FilesystemCache;

// todo: this file sets hardcoded auth secrets, remote environments needs to have a different ones supplied via env vars
require 'common/config_oauth.php';

$CURRENT_STORE = Store::getInstance()->getStoreName();
$sprykerFrontendHost = getenv('YVES_HOST_' . $CURRENT_STORE, true);
$sprykerBackendHost = getenv('ZED_HOST_' . $CURRENT_STORE, true);
$sprykerBackendApiHost = getenv('ZED_API_HOST_' . $CURRENT_STORE, true);

$config[ConsoleConstants::ENABLE_DEVELOPMENT_CONSOLE_COMMANDS] = (bool)getenv('DEVELOPMENT_CONSOLE_COMMANDS', true);

// ---------- Yves host
$config[ApplicationConstants::HOST_YVES] = $sprykerFrontendHost;
$config[ApplicationConstants::BASE_URL_YVES] = sprintf(
    'https://%s',
    $sprykerFrontendHost,
);
$config[ProductManagementConstants::BASE_URL_YVES] = $config[ApplicationConstants::BASE_URL_YVES];
$config[NewsletterConstants::BASE_URL_YVES] = $config[ApplicationConstants::BASE_URL_YVES];
$config[CustomerConstants::BASE_URL_YVES] = $config[ApplicationConstants::BASE_URL_YVES];
$config[HttpConstants::YVES_TRUSTED_PROXIES] = ['REMOTE_ADDR'];
$config[SessionConstants::YVES_SSL_ENABLED]
    = $config[RouterConstants::YVES_IS_SSL_ENABLED]
    = true;

// ---------- Zed host
$config[ApplicationConstants::BASE_URL_ZED] = sprintf(
    'https://%s',
    $sprykerBackendHost,
);
$config[ZedRequestConstants::HOST_ZED_API] = $sprykerBackendApiHost ?: $sprykerBackendHost;
$config[ZedRequestConstants::BASE_URL_ZED_API] = sprintf(
    'http://%s',
    $config[ZedRequestConstants::HOST_ZED_API],
);
$config[ZedRequestConstants::BASE_URL_SSL_ZED_API] = sprintf(
    'https://%s',
    $config[ZedRequestConstants::HOST_ZED_API],
);
$config[SessionConstants::ZED_SSL_ENABLED]
    = $config[RouterConstants::ZED_IS_SSL_ENABLED]
    = $config[ZedRequestConstants::ZED_API_SSL_ENABLED]
    = false;

// ----------- Glue Application
$config[GlueApplicationConstants::GLUE_APPLICATION_DOMAIN] = sprintf('http://%s', getenv('GLUE_HOST_' . $CURRENT_STORE, true));
$config[GlueApplicationConstants::GLUE_APPLICATION_CORS_ALLOW_ORIGIN] = sprintf('http://%s', getenv('GLUE_HOST_' . $CURRENT_STORE, true));

// ---------- Session
$config[SessionConstants::YVES_SESSION_COOKIE_NAME] = $sprykerFrontendHost;
$config[SessionConstants::YVES_SESSION_COOKIE_DOMAIN] = $sprykerFrontendHost;

// ---------- Session
$config[SessionConstants::ZED_SESSION_COOKIE_NAME] = $sprykerBackendHost;
$config[SessionConstants::ZED_SESSION_COOKIE_DOMAIN] = $sprykerBackendHost;

// ---------- Database credentials
$config[PropelConstants::ZED_DB_USERNAME] = getenv('DB_USER', true);
$config[PropelConstants::ZED_DB_PASSWORD] = getenv('DB_PASS', true);
$config[PropelConstants::ZED_DB_DATABASE] = getenv('DB_NAME', true);
$config[PropelConstants::ZED_DB_HOST] = getenv('DB_HOST', true);
$config[PropelConstants::ZED_DB_PORT] = 5432;
$config[PropelConstants::USE_SUDO_TO_MANAGE_DATABASE] = false;
$config[PropelConstants::ZED_DB_ENGINE]
    = $config[PropelQueryBuilderConstants::ZED_DB_ENGINE]
    = PropelConfig::DB_ENGINE_PGSQL;

// ---------- Elasticsearch
$config[SearchElasticsearchConstants::HOST] = getenv('SEARCHENGINE_HOST', true);
$config[SearchElasticsearchConstants::TRANSPORT] = getenv('SEARCHENGINE_SCHEME', true) ?: 'http';
$config[SearchElasticsearchConstants::PORT] = getenv('SEARCHENGINE_PORT', true);
if (getenv('SEARCHENGINE_USERNAME', true)) {
    $config[SearchElasticsearchConstants::AUTH_HEADER] = base64_encode(getenv('SEARCHENGINE_USERNAME', true) . ':' . getenv('SEARCHENGINE_PASSWORD', true));
}
$ELASTICA_INDEX_NAME = strtolower($CURRENT_STORE) . '_search';
$config[CollectorConstants::ELASTICA_PARAMETER__INDEX_NAME] = $ELASTICA_INDEX_NAME;

// ----------- Session and KV storage
$config[StorageRedisConstants::STORAGE_REDIS_SCHEME] = getenv('REDIS_PROTOCOL', true);
$config[StorageRedisConstants::STORAGE_REDIS_HOST] = getenv('REDIS_HOST', true);
$config[StorageRedisConstants::STORAGE_REDIS_PORT] = getenv('REDIS_PORT', true);
$config[StorageRedisConstants::STORAGE_REDIS_PASSWORD] = getenv('REDIS_PASSWORD', true);
$config[StorageRedisConstants::STORAGE_REDIS_DATABASE] = 0;
$config[SessionRedisConstants::YVES_SESSION_REDIS_SCHEME] = getenv('REDIS_PROTOCOL', true);
$config[SessionRedisConstants::YVES_SESSION_REDIS_HOST] = getenv('REDIS_HOST', true);
$config[SessionRedisConstants::YVES_SESSION_REDIS_PORT] = getenv('REDIS_PORT', true);
$config[SessionRedisConstants::YVES_SESSION_REDIS_PASSWORD] = getenv('REDIS_PASSWORD', true);
$config[SessionRedisConstants::YVES_SESSION_REDIS_DATABASE] = 1;
$config[SessionRedisConstants::ZED_SESSION_REDIS_SCHEME] = getenv('REDIS_PROTOCOL', true);
$config[SessionRedisConstants::ZED_SESSION_REDIS_HOST] = getenv('REDIS_HOST', true);
$config[SessionRedisConstants::ZED_SESSION_REDIS_PORT] = getenv('REDIS_PORT', true);
$config[SessionRedisConstants::ZED_SESSION_REDIS_PASSWORD] = getenv('REDIS_PASSWORD', true);
$config[SessionRedisConstants::ZED_SESSION_REDIS_DATABASE] = 2;

// >>> SECURITY BLOCKER
$config[SecurityBlockerConstants::SECURITY_BLOCKER_REDIS_SCHEME] = getenv('REDIS_PROTOCOL', true);
$config[SecurityBlockerConstants::SECURITY_BLOCKER_REDIS_HOST] = getenv('REDIS_HOST', true);
$config[SecurityBlockerConstants::SECURITY_BLOCKER_REDIS_PORT] = getenv('REDIS_PORT', true);
$config[SecurityBlockerConstants::SECURITY_BLOCKER_REDIS_PASSWORD] = getenv('REDIS_PASSWORD', true);
$config[SecurityBlockerConstants::SECURITY_BLOCKER_REDIS_DATABASE] = 3;

// ---------- RabbitMq
$config[RabbitMqEnv::RABBITMQ_API_HOST] = getenv('RABBITMQ_HOST', true);
$config[RabbitMqEnv::RABBITMQ_API_PORT] = getenv('RABBITMQ_API_PORT', true);
$config[RabbitMqEnv::RABBITMQ_API_USERNAME] = getenv('RABBITMQ_USER', true);
$config[RabbitMqEnv::RABBITMQ_API_PASSWORD] = getenv('RABBITMQ_PASSWORD', true);
$config[RabbitMqEnv::RABBITMQ_CONNECTIONS] = [
    'DE' => [
        RabbitMqEnv::RABBITMQ_CONNECTION_NAME => 'DE-connection',
        RabbitMqEnv::RABBITMQ_HOST => getenv('RABBITMQ_HOST', true),
        RabbitMqEnv::RABBITMQ_PORT => getenv('RABBITMQ_PORT', true),
        RabbitMqEnv::RABBITMQ_PASSWORD => getenv('RABBITMQ_PASSWORD', true),
        RabbitMqEnv::RABBITMQ_USERNAME => getenv('RABBITMQ_USER', true),
        RabbitMqEnv::RABBITMQ_VIRTUAL_HOST => getenv('RABBITMQ_VHOST_DE', true),
        RabbitMqEnv::RABBITMQ_STORE_NAMES => ['DE'],
    ],
    'AT' => [
        RabbitMqEnv::RABBITMQ_CONNECTION_NAME => 'AT-connection',
        RabbitMqEnv::RABBITMQ_HOST => getenv('RABBITMQ_HOST', true),
        RabbitMqEnv::RABBITMQ_PORT => getenv('RABBITMQ_PORT', true),
        RabbitMqEnv::RABBITMQ_PASSWORD => getenv('RABBITMQ_PASSWORD', true),
        RabbitMqEnv::RABBITMQ_USERNAME => getenv('RABBITMQ_USER', true),
        RabbitMqEnv::RABBITMQ_VIRTUAL_HOST => getenv('RABBITMQ_VHOST_AT', true),
        RabbitMqEnv::RABBITMQ_STORE_NAMES => ['AT'],
    ],
    'US' => [
        RabbitMqEnv::RABBITMQ_CONNECTION_NAME => 'US-connection',
        RabbitMqEnv::RABBITMQ_HOST => getenv('RABBITMQ_HOST', true),
        RabbitMqEnv::RABBITMQ_PORT => getenv('RABBITMQ_PORT', true),
        RabbitMqEnv::RABBITMQ_PASSWORD => getenv('RABBITMQ_PASSWORD', true),
        RabbitMqEnv::RABBITMQ_USERNAME => getenv('RABBITMQ_USER', true),
        RabbitMqEnv::RABBITMQ_VIRTUAL_HOST => getenv('RABBITMQ_VHOST_US', true),
        RabbitMqEnv::RABBITMQ_STORE_NAMES => ['US'],
    ],
];
$config[RabbitMqEnv::RABBITMQ_API_VIRTUAL_HOST] = getenv('RABBITMQ_VHOST_' . $CURRENT_STORE, true);
$config[RabbitMqEnv::RABBITMQ_CONNECTIONS][$CURRENT_STORE][RabbitMqEnv::RABBITMQ_DEFAULT_CONNECTION] = true;

// ---------- Scheduler
$config[SchedulerConstants::ENABLED_SCHEDULERS] = [];

if ((getenv('HAS_JENKINS_RUNNER', true) ?: 'true') === 'true') {
    $config[SchedulerConstants::ENABLED_SCHEDULERS] = [
        SchedulerConfig::PYZ_SCHEDULER_JENKINS,
    ];
    $config[SchedulerJenkinsConstants::JENKINS_CONFIGURATION] = [
        SchedulerConfig::PYZ_SCHEDULER_JENKINS => [
            SchedulerJenkinsConfig::SCHEDULER_JENKINS_BASE_URL => 'http://' . getenv('JENKINS_HOST', true) . ':' . getenv('JENKINS_PORT', true) . '/',
        ],
    ];
}

// ---------- Mail configuration
$config[MailConstants::SMTP_HOST] = getenv('SMTP_HOST', true);
$config[MailConstants::SMTP_PORT] = getenv('SMTP_PORT', true);

// ---------- Setting to work with queue process timeout patch
$config[QueueConstants::QUEUE_PROCESS_TIMEOUT] = 120;

// ----------- HTTP Security
$config[KernelConstants::STRICT_DOMAIN_REDIRECT] = false;
$config[KernelConstants::DOMAIN_WHITELIST] = [];

// ---------- Namespaces
$config[KernelConstants::PROJECT_NAMESPACES] = [
    'Inviqa',
    'Pyz',
];

// ---------- Twig
$config[TwigConstants::YVES_TWIG_OPTIONS] = [
    'cache' => new FilesystemCache(
        sprintf(
            '%s/data/%s/cache/%s/twig',
            APPLICATION_ROOT_DIR,
            $CURRENT_STORE,
            APPLICATION
        ),
        FilesystemCache::FORCE_BYTECODE_INVALIDATION
    ),
];
$config[TwigConstants::ZED_TWIG_OPTIONS] = [
    'cache' => new FilesystemCache(
        sprintf(
            '%s/data/%s/cache/%s/twig',
            APPLICATION_ROOT_DIR,
            $CURRENT_STORE,
            APPLICATION
        ),
        FilesystemCache::FORCE_BYTECODE_INVALIDATION
    ),
];

// ---------- Security
$config[HttpConstants::YVES_TRUSTED_HOSTS]
    = $config[HttpConstants::ZED_TRUSTED_HOSTS]
    = $config[KernelConstants::DOMAIN_WHITELIST]
    = [
        $sprykerFrontendHost,
        $sprykerBackendHost,
        $sprykerBackendApiHost,
    ];
