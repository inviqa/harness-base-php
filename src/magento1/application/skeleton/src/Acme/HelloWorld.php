<?php

namespace Acme;

class HelloWorld
{
    protected $_greeting;

    public function __construct()
    {
        $this->_greeting = 'Hello, World';
    }
}
