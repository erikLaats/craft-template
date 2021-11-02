<?php
/**
 * netlogo plugin for Craft CMS 3.x
 *
 * Craft plugin to support Blockly and Netlogo integration 
 *
 * @link      fablevision.com
 * @copyright Copyright (c) 2021 Chris Spence
 */

namespace fablevision\netlogo;

use fablevision\netlogo\services\NetlogoService;
use fablevision\netlogo\variables\NetlogoVariable;

use Craft;
use craft\base\Plugin;
use craft\services\Plugins;
use craft\events\PluginEvent;
use craft\web\UrlManager;
use craft\web\View;
use craft\web\twig\variables\CraftVariable;
use craft\events\RegisterUrlRulesEvent;
use craft\events\RegisterTemplateRootsEvent;

use yii\base\Event;

/**
 * Class Netlogo
 *
 * @author    Chris Spence
 * @package   Netlogo
 * @since     0.0.5
 *
 * @property  NetlogoServiceService $netlogoService
 */
class Netlogo extends Plugin
{
    // Static Properties
    // =========================================================================

    /**
     * @var Netlogo
     */
    public static $plugin;

    // Public Properties
    // =========================================================================

    /**
     * @var string
     */
    public $schemaVersion = '0.0.6';

    /**
     * @var bool
     */
    public $hasCpSettings = false;

    /**
     * @var bool
     */
    public $hasCpSection = false;

    public $service;

    // Public Methods
    // =========================================================================

    /**
     * @inheritdoc
     */
    public function init()
    {
        parent::init();
        self::$plugin = $this;

        $this->service = new NetlogoService();

        Event::on(
            UrlManager::class,
            UrlManager::EVENT_REGISTER_SITE_URL_RULES,
            function (RegisterUrlRulesEvent $event) {
                error_log("here");
                $event->rules['siteActionTrigger1'] = 'netlogo/default';
            }
        );

        Event::on(
            View::class,
            View::EVENT_REGISTER_SITE_TEMPLATE_ROOTS,
            function(RegisterTemplateRootsEvent $event) {
                $event->roots['netlogo'] = __DIR__ . '/web-application';
            }
        );

        Event::on(
            CraftVariable::class,
            CraftVariable::EVENT_INIT,
            function (Event $event) {
                /** @var CraftVariable $variable */
                $variable = $event->sender;
                $variable->set('netlogo', NetlogoVariable::class);
            }
        );

        Event::on(
            Plugins::class,
            Plugins::EVENT_AFTER_INSTALL_PLUGIN,
            function (PluginEvent $event) {
                if ($event->plugin === $this) {
                }
            }
        );

        Craft::info(
            Craft::t(
                'netlogo',
                '{name} plugin loaded',
                ['name' => $this->name]
            ),
            __METHOD__
        );
    }

    // Protected Methods
    // =========================================================================

}
