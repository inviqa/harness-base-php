<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;

class ExampleController
{
    public function homepage(): Response
    {
        return new Response(
            '<html><body><h1>Homepage</h1></body></html>'
        );
    }
}
