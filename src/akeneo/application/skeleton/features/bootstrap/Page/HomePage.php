<?php

namespace Inviqa\Acceptance\Page;

use SensioLabs\Behat\PageObjectExtension\PageObject\Page;
use SensioLabs\Behat\PageObjectExtension\PageObject\Exception\UnexpectedPageException;

class HomePage extends Page
{
    protected $path = '/';

    /**
     * Overload to verify if the current url matches the expected one. Throw an exception otherwise.
     *
     * @param array $urlParameters
     */
    protected function verifyUrl(array $urlParameters = array())
    {
        $expectedUrl = $this->getUrl($urlParameters) . 'user/login';
        $currentUrl = $this->getDriver()->getCurrentUrl();

        if ($currentUrl !== $expectedUrl) {
            throw new UnexpectedPageException(sprintf('Expected to be on "%s" but found "%s" instead', $expectedUrl, $currentUrl));
        }
    }
}
