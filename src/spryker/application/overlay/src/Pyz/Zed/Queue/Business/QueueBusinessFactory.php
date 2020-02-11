<?php

/**
 * QueueBusinessFactory
 *
 * Part of the patch to fix Symfony 60 second timeout issue in queue:task:start
 *
 * @author     Hardik Gajjar
 * @package Pyz\Zed\Queue\Business
 */

namespace Pyz\Zed\Queue\Business;

use Pyz\Zed\Queue\Business\Process\ProcessManager;
use Spryker\Zed\Queue\Business\QueueBusinessFactory as SprykerQueueBusinessFactory;

/**
 * Class QueueBusinessFactory
 * @package Pyz\Zed\Queue\Business
 */
class QueueBusinessFactory extends SprykerQueueBusinessFactory
{
    /**
     * @return \Spryker\Zed\Queue\Business\Process\ProcessManagerInterface
     */
    public function createProcessManager()
    {
        return new ProcessManager(
            $this->getQueryContainer(),
            $this->getServerUniqueId(),
            $this->getConfig()
        );
    }
}
