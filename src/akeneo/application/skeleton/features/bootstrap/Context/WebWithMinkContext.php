<?php

namespace App\Acceptance\Context;

use Behat\Behat\Context\Context;
use Behat\Behat\Tester\Exception\PendingException;
use Behat\MinkExtension\Context\MinkContext;

class WebWithMinkContext extends MinkContext
{
    /**
     * @When I visit the home page
     */
    public function iVisitTheHomePage()
    {
        $this->iAmOnHomepage();
    }

    /**
     * @Then I should see the home page
     */
    public function iShouldSeeTheHomePage()
    {
        $this->assertHomepage();
        $this->assertResponseStatus(200);
    }

    /**
     * @Then I should see the login page
     */
    public function iShouldSeeTheLoginPage()
    {
        $this->assertSession()->addressEquals($this->locatePath('/user/login'));
        $this->assertResponseStatus(200);
    }
}
