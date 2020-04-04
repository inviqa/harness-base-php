<?php

namespace Inviqa\Acceptance\Context;

use Behat\Behat\Context\Context;
use Inviqa\Acceptance\Page\HomePage;
use PHPUnit\Framework\Assert;

class WebWithPageObjectsWithConstructorInjectionContext implements Context
{
    /** @var HomePage */
    private $homePage;

    public function __construct(HomePage $homePage)
    {
        // homepage was injected through the constructor by the page object extension
        // see documentation here: https://behat-page-object-extension.readthedocs.io/en/stable/guide/working_with_page_objects.html#injecting-page-objects-into-a-context-file
        $this->homePage = $homePage;
    }

    /**
     * @When I visit the home page
     */
    public function iVisitTheHomePage()
    {
        $this->homePage->open();
    }

    /**
     * @Then I should see the home page
     */
    public function iShouldSeeTheHomePage()
    {
        Assert::assertTrue($this->homePage->isOpen());
    }    
}
