<?php
namespace Pyz\Zed\Queue\Business;
use Pyz\Zed\Queue\Business\Process\ProcessManager;
use Spryker\Zed\Queue\Business\QueueBusinessFactory as SprykerQueueBusinessFactory;
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