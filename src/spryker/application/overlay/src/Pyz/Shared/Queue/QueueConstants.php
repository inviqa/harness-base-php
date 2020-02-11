<?php

/**
 * Needed for Travis inspection.
 */

namespace Pyz\Shared\Queue;

use Spryker\Shared\Queue\QueueConstants as SprykerQueueConstants;

class QueueConstants implements SprykerQueueConstants
{
    /**
     * Specification:
     * - Default timeout for all queue processes
     */
    public const QUEUE_PROCESS_TIMEOUT = 'QUEUE_PROCESS_TIMEOUT';
}
