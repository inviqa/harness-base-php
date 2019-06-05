<?php

/**
 * This file is part of the Spryker Commerce OS.
 * For full license information, please view the LICENSE file that was distributed with this source code.
 */

namespace Acceptance\Page;

use Behat\Mink\Session;
use SensioLabs\Behat\PageObjectExtension\PageObject\Factory;
use SensioLabs\Behat\PageObjectExtension\PageObject\Page;

abstract class YvesPage extends Page
{
    /**
     * @var string
     */
    protected $baseUrl;

    /**
     * @param \Behat\Mink\Session $session
     * @param \SensioLabs\Behat\PageObjectExtension\PageObject\Factory $factory
     * @param array $parameters
     */
    public function __construct(Session $session, Factory $factory, array $parameters = [])
    {
        if (!isset($parameters['base_url'])) {
            $parameters['base_url'] = isset($parameters['yves_base_url'])
                ? $parameters['yves_base_url']
                : 'http://' . getenv('YVES_HOST_DE');
        }

        $this->baseUrl = rtrim($parameters['base_url'], '/');

        parent::__construct($session, $factory, $parameters);
    }
}
