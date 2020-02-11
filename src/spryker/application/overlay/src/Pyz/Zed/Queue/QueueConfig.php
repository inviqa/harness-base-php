<?php

/**
 * This file is part of the Spryker Commerce OS.
 * For full license information, please view the LICENSE file that was distributed with this source code.
 */

namespace Pyz\Zed\Queue;

use Generated\Shared\Transfer\RabbitMqConsumerOptionTransfer;
use Pyz\Shared\Queue\QueueConstants;
use Spryker\Shared\Config\Config;
use Spryker\Shared\Event\EventConstants;
use Spryker\Shared\Log\LogConstants;
use Spryker\Zed\Queue\QueueConfig as SprykerQueueConfig;

class QueueConfig extends SprykerQueueConfig
{
    public const RABBITMQ = 'rabbitmq';

    /**
     * @return int
     */
    public function getQueueProcessTimeout(): int
    {
        return Config::get(QueueConstants::QUEUE_PROCESS_TIMEOUT, 30);
    }

    /**
     * @return array
     */
    protected function getQueueReceiverOptions()
    {
        return [
            QueueConstants::QUEUE_DEFAULT_RECEIVER => [
                static::RABBITMQ => $this->getRabbitMqQueueConsumerOptions(),
            ],
            EventConstants::EVENT_QUEUE => [
                static::RABBITMQ => $this->getRabbitMqQueueConsumerOptions(),
            ],
            Config::get(LogConstants::LOG_QUEUE_NAME) => [
                static::RABBITMQ => $this->getRabbitMqQueueConsumerOptions(),
            ],
        ];
    }

    /**
     * @return array
     */
    protected function getMessageCheckOptions()
    {
        return [
            QueueConstants::QUEUE_WORKER_MESSAGE_CHECK_OPTION => [
                static::RABBITMQ => $this->getRabbitMqQueueMessageCheckOptions(),
            ],
        ];
    }

    /**
     * @return \Generated\Shared\Transfer\RabbitMqConsumerOptionTransfer
     */
    protected function getRabbitMqQueueMessageCheckOptions()
    {
        $queueOptionTransfer = $this->getRabbitMqQueueConsumerOptions();
        $queueOptionTransfer->setRequeueOnReject(true);

        return $queueOptionTransfer;
    }

    /**
     * @return \Generated\Shared\Transfer\RabbitMqConsumerOptionTransfer
     */
    protected function getRabbitMqQueueConsumerOptions()
    {
        $queueOptionTransfer = new RabbitMqConsumerOptionTransfer();
        $queueOptionTransfer->setConsumerExclusive(false);
        $queueOptionTransfer->setNoWait(false);

        return $queueOptionTransfer;
    }
}
