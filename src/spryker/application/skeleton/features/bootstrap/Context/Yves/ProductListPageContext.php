<?php

/**
 * This file is part of the Spryker Commerce OS.
 * For full license information, please view the LICENSE file that was distributed with this source code.
 */

namespace Acceptance\Context\Yves;

use Acceptance\Page\Yves\ProductListPage;
use SensioLabs\Behat\PageObjectExtension\Context\PageObjectContext;

class ProductListPageContext extends PageObjectContext
{
    /**
     * @When I visit the product list page :arg1
     *
     * @param string $uri
     *
     * @return void
     */
    public function iVisitTheProductListPage(string $uri)
    {
        $this->getProductListPage()->open(['url' => $uri]);
    }

    /**
     * @Then I should see a the price range filter
     *
     * @return void
     */
    public function iShouldSeeAThePriceRangeFilter()
    {
        $this->getProductListPage()->assertPriceRangeFilterExists();
    }

    /**
     * @return \SensioLabs\Behat\PageObjectExtension\PageObject\Page|\Acceptance\Page\Yves\ProductListPage
     */
    private function getProductListPage()
    {
        return $this->getPage(ProductListPage::class);
    }
}
