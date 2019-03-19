<?php

namespace spec\Acme;

use Acme\HelloWorld;
use PhpSpec\ObjectBehavior;
use Prophecy\Argument;

class HelloWorldSpec extends ObjectBehavior
{
    function it_is_initializable()
    {
        $this->shouldHaveType(HelloWorld::class);
    }
}
