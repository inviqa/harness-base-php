<?php

/**
 * QueueConstants
 *
 * Part of the patch to fix Symfony 60 second timeout issue in queue:task:start
 *
 * @author     Hardik Gajjar
 * @package Pyz\Shared\Queue
 */

namespace Pyz\Shared\Queue;

use Spryker\Shared\Queue\QueueConstants as SprykerQueueConstants;

/**
 * Class QueueConstants
 * @package Pyz\Shared\Queue
 */
class QueueConstants implements SprykerQueueConstants
{
    /**
     * Specification:
     * - Default timeout for all queue processes
     */
    public const QUEUE_PROCESS_TIMEOUT = 'QUEUE_PROCESS_TIMEOUT';
}
