<?php

namespace Inviqa\Yves\EventDispatcher;

use Inviqa\Yves\Router\Plugin\EventDispatcher\RouterSslRedirectEventDispatcherPlugin;
use Pyz\Yves\EventDispatcher\EventDispatcherDependencyProvider as PyzEventDispatcherDependencyProvider;
use Spryker\Shared\EventDispatcherExtension\Dependency\Plugin\EventDispatcherPluginInterface;
use Spryker\Yves\Router\Plugin\EventDispatcher\RouterSslRedirectEventDispatcherPlugin as SprykerRouterSslRedirectEventDispatcherPlugin;

class EventDispatcherDependencyProvider extends PyzEventDispatcherDependencyProvider
{
    /**
     * @override
     *
     * @return \Spryker\Shared\EventDispatcherExtension\Dependency\Plugin\EventDispatcherPluginInterface[]
     */
    protected function getEventDispatcherPlugins(): array
    {
        $corePlugins = parent::getEventDispatcherPlugins();
        $plugins = array_filter($corePlugins, function (EventDispatcherPluginInterface $plugin) {
            return ! $plugin instanceof SprykerRouterSslRedirectEventDispatcherPlugin;
        });

        $plugins[] = new RouterSslRedirectEventDispatcherPlugin();

        return $plugins;
    }
}
