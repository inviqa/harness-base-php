<?php

/**
 * Needed for Travis inspection.
 */

namespace Pyz\Zed\Queue\Business\Process;

use Pyz\Zed\Queue\QueueConfig;
use Spryker\Zed\Queue\Business\Process\ProcessManager as SprykerProcessManager;
use Spryker\Zed\Queue\Persistence\QueueQueryContainerInterface;

class ProcessManager extends SprykerProcessManager
{
    /**
     * @var \Pyz\Zed\Queue\QueueConfig
     */
    private $queueConfig;
    public function __construct(
        QueueQueryContainerInterface $queryContainer,
        $serverUniqueId,
        QueueConfig $queueConfig
    ) {
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
