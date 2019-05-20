<?php

/**
 * This file is part of the Spryker Commerce OS.
 * For full license information, please view the LICENSE file that was distributed with this source code.
 */

namespace Acceptance\Page\Yves;

use Acceptance\Page\YvesPage;
use PHPUnit\Framework\Assert;

class ProductListPage extends YvesPage
{
    /**
     * @var string
     */
    protected $path = '{url}';

    /**
     * @return void
     */
    public function assertPriceRangeFilterExists()
    {
        Assert::assertTrue($this->hasPriceRangeFilter());
    }

    /**
     * @return bool
     */
    private function hasPriceRangeFilter(): bool
    {
        return $this->has('xpath', '//div[@data-qa="component filter-price-range"]');
    }
}
