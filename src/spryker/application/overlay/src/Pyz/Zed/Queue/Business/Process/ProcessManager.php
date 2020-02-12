<?php

/**
 * This file is part of the Spryker Commerce OS.
 * For full license information, please view the LICENSE file that was distributed with this source code.
 */

namespace Pyz\Zed\Queue\Business\Process;

use Pyz\Zed\Queue\QueueConfig;
use Spryker\Zed\Queue\Business\Process\ProcessManager as SprykerProcessManager;
use Spryker\Zed\Queue\Persistence\QueueQueryContainerInterface;

/**
 * Class ProcessManager
 *
 * @package Pyz\Zed\Queue\Business\Process
 */
class ProcessManager extends SprykerProcessManager
{
    /**
     * @var \Pyz\Zed\Queue\QueueConfig
     */
    private $queueConfig;

    /**
     * Create new ProcessManager
     *
     * @param \Spryker\Zed\Queue\Persistence\QueueQueryContainerInterface $queryContainer
     * @param int $serverUniqueId
     * @param \Pyz\Zed\Queue\QueueConfig $queueConfig
     */
    public function __construct(QueueQueryContainerInterface $queryContainer, $serverUniqueId, QueueConfig $queueConfig)
    {
        parent::__construct($queryContainer, $serverUniqueId);
        $this->queueConfig = $queueConfig;
    }

    /**
     * Increase queue worker timeout to allow it to be finished in single run
     * (required for initial run when there are lots of messages to process)
     *
     * @param string $command
     *
     * @return \Symfony\Component\Process\Process
     */
    protected function createProcess($command)
    {
        $process = parent::createProcess($command);
        $process->setTimeout($this->queueConfig->getQueueProcessTimeout());
        return $process;
    }
}
