<?php

/**
 * QueueBusinessFactory
 *
 * Part of the patch to fix Symfony 60 second timeout issue in queue:task:start
 *
 * @package Pyz\Zed\Queue\Business
 * @category blah
 * @author Hardik Gajjar <hardik.gajjar@inviqa.com>
 * @license blah
 * @link blah
 */

namespace Pyz\Zed\Queue\Business;

use Pyz\Zed\Queue\Business\Process\ProcessManager;
use Spryker\Zed\Queue\Business\QueueBusinessFactory as SprykerQueueBusinessFactory;

/**
 * Class QueueBusinessFactory
 * 
 * Short description
 *
 * @package Pyz\Zed\Queue\Business
 * @category blah
 * @author Hardik Gajjar <hardik.gajjar@inviqa.com>
 * @license blah
 * @link blah
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
