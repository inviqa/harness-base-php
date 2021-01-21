<?php

namespace App\Acceptance\Context;

use Behat\Behat\Context\Context;
use App\Acceptance\Page\HomePage;
use App\Acceptance\Page\LoginPage;
use PHPUnit\Framework\Assert;

class WebWithPageObjectsWithConstructorInjectionContext implements Context
{
    /** @var HomePage */
    private $homePage;
    /** @var LoginPage */
    private $loginPage;

    public function __construct(HomePage $homePage, LoginPage $loginPage)
    {
        // homepage was injected through the constructor by the page object extension
        // see documentation here: https://behat-page-object-extension.readthedocs.io/en/stable/guide/working_with_page_objects.html#injecting-page-objects-into-a-context-file
        $this->homePage = $homePage;
        $this->loginPage = $loginPage;
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

    /**
     * @Then I should see the login page
     */
    public function iShouldSeeTheLoginPage()
    {
        Assert::assertTrue($this->loginPage->isOpen());
    }
}
