<?php

/**
 * This file is part of the Spryker Commerce OS.
 * For full license information, please view the LICENSE file that was distributed with this source code.
 */

namespace Pyz\Shared\Queue;

use Spryker\Shared\Queue\QueueConstants as SprykerQueueConstants;

/**
 * Class QueueConstants
 *
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
