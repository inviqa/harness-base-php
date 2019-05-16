<?php

use Spryker\Shared\Application\ApplicationConstants;
use Spryker\Shared\Collector\CollectorConstants;
use Spryker\Shared\RabbitMq\RabbitMqEnv;
use Spryker\Shared\Search\SearchConstants;
use Spryker\Shared\Session\SessionConstants;

// ---------- Yves host
$config[ApplicationConstants::HOST_YVES] = getenv('YVES_HOST_AT');
$config[ApplicationConstants::PORT_SSL_YVES] = '';
$config[ApplicationConstants::BASE_URL_YVES] = sprintf(
    'http://%s%s',
    $config[ApplicationConstants::HOST_YVES],
    $config[ApplicationConstants::PORT_YVES]
);
$config[ApplicationConstants::BASE_URL_SSL_YVES] = sprintf(
    'https://%s%s',
    $config[ApplicationConstants::HOST_YVES],
    $config[ApplicationConstants::PORT_SSL_YVES]
);

// ---------- Session
$config[SessionConstants::YVES_SESSION_COOKIE_NAME] = $config[ApplicationConstants::HOST_YVES];
$config[SessionConstants::YVES_SESSION_COOKIE_DOMAIN] = $config[ApplicationConstants::HOST_YVES];

// ---------- Elasticsearch
$config[ApplicationConstants::ELASTICA_PARAMETER__INDEX_NAME]
    = $config[CollectorConstants::ELASTICA_PARAMETER__INDEX_NAME]
    = $config[SearchConstants::ELASTICA_PARAMETER__INDEX_NAME]
    = 'at_search';

// ----------- RabbitMQ
$config[RabbitMqEnv::RABBITMQ_API_VIRTUAL_HOST] = getenv('RABBITMQ_VHOST_AT');
$config[RabbitMqEnv::RABBITMQ_CONNECTIONS]['AT'][RabbitMqEnv::RABBITMQ_DEFAULT_CONNECTION] = true;
