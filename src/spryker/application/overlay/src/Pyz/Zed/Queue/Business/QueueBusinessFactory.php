<?php

/**
 * This file is part of the Spryker Commerce OS.
 * For full license information, please view the LICENSE file that was distributed with this source code.
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
 * @author Hardik Gajjar <hardik.gajjar@inviqa.com>
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
