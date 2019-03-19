<?php

namespace Acceptance\Context;

use SensioLabs\Behat\PageObjectExtension\Context\PageObjectContext;

class Web extends PageObjectContext
{
    private $page;

    /**
     * @When /^I visit the home page$/
     */
    public function iVisitTheHomePage()
    {
        $this->page = $this->getPage('Home');
        $this->page->open();
    }
}
