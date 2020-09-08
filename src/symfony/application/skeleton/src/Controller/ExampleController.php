<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ExampleController
{
    /**
     * @Route("/")
     */
    public function homepage(): Response
    {
        return new Response(
            '<html><body><h1>Homepage</h1></body></html>'
        );
    }
}
