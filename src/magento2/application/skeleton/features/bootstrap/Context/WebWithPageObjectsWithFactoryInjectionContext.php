<?php

namespace Inviqa\Acceptance\Context;

use Inviqa\Acceptance\Page\HomePage;
use PHPUnit\Framework\Assert;
use SensioLabs\Behat\PageObjectExtension\Context\PageObjectContext;

class WebWithPageObjectsWithFactoryInjectionContext extends PageObjectContext
{
    /**
     * @When I visit the home page
     */
    public function iVisitTheHomePage()
    {
        $this->homePage()->open();
    }

    /**
     * @Then I should see the home page
     */
    public function iShouldSeeTheHomePage()
    {
        Assert::assertTrue($this->homePage()->isOpen());
    }

    private function homePage(): HomePage
    {
        // using the page object factory
        // page object factory was injected to the context by the page object extension
        // because we extended PageObjectContext which implements PageObjectAware interface
        // see documentation here: https://behat-page-object-extension.readthedocs.io/en/stable/guide/working_with_page_objects.html#using-the-page-object-factory
        return $this->getPage('HomePage');
    }
}
