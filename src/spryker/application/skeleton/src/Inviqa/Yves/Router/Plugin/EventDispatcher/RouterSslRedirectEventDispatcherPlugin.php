<?php

/**
 * This file is part of the Spryker Commerce OS.
 * For full license information, please view the LICENSE file that was distributed with this source code.
 */

namespace Inviqa\Yves\Router\Plugin\EventDispatcher;

use Spryker\Shared\EventDispatcher\EventDispatcherInterface;
use Spryker\Yves\Router\Plugin\EventDispatcher\RouterSslRedirectEventDispatcherPlugin as SprykerRouterSslRedirectEventDispatcherPlugin;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpKernel\Event\GetResponseEvent;
use Symfony\Component\HttpKernel\KernelEvents;

class RouterSslRedirectEventDispatcherPlugin extends SprykerRouterSslRedirectEventDispatcherPlugin
{
    /**
     * @override
     *
     * Fixes the issue that it does not redirect to HTTPS url, when trusted proxies config is set
     *
     * @param \Spryker\Shared\EventDispatcher\EventDispatcherInterface $eventDispatcher
     *
     * @return \Spryker\Shared\EventDispatcher\EventDispatcherInterface
     */
    protected function addListener(EventDispatcherInterface $eventDispatcher): EventDispatcherInterface
    {
        $eventDispatcher->addListener(KernelEvents::REQUEST, function (GetResponseEvent $event): void {
            $request = $event->getRequest();
            if ($this->shouldBeSsl($request)) {
                $fakeRequest = clone $request;
                $fakeRequest->server->set('HTTPS', true);
                $fakeRequest->headers->set('X_FORWARDED_PROTO', 'https');
                $fakeRequest->headers->set('X_FORWARDED_PORT', '443');
                $event->setResponse(new RedirectResponse($fakeRequest->getUri(), 301));
            }
        });

        return $eventDispatcher;
    }
}
