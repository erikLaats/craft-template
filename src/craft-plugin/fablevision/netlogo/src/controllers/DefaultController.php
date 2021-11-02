<?php
/**
 * netlogo plugin for Craft CMS 3.x
 *
 * Craft plugin to support Blockly and Netlogo integration 
 *
 * @link      fablevision.com
 * @copyright Copyright (c) 2021 Chris Spence
 */

namespace fablevision\netlogo\controllers;

use fablevision\netlogo\Netlogo;

use Craft;
use craft\web\Controller;

/**
 * @author    Chris Spence
 * @package   Netlogo
 * @since     0.0.5
 */
class DefaultController extends Controller
{

    // Protected Properties
    // =========================================================================

    /**
     * @var    bool|array Allows anonymous access to this controller's actions.
     *         The actions must be in 'kebab-case'
     * @access protected
     */
    protected $allowAnonymous = [];

    // Public Methods
    // =========================================================================

    /**
     * @return mixed
     */
    public function actionSaveProgress() {
        $this->requirePostRequest();
        $userId = $this->validateUserId();
        $journeyId = $this->getRequiredParam("journeyId");
        $taskId = $this->getRequiredParam("taskId");
        $progress = $this->getRequiredParam("progress");
        return Netlogo::$plugin->service->saveProgress($userId, $journeyId, $taskId, $progress);
    }


    public function actionLoadProgress() {
        $this->requirePostRequest();
        $userId = $this->validateUserId();
        $journeyId = $this->getRequiredParam("journeyId");
        $taskId = $this->getRequiredParam("taskId");
        return Netlogo::$plugin->service->loadProgress($userId, $journeyId, $taskId);
    }

    private function getRequiredParam($param) {
        return Craft::$app->getRequest()->getRequiredParam($param);
    }

    private function getOptionalParam($param, $nullVal = null) {
        if(Craft::$app->getRequest()->getParam($param) === false) return false;

        return empty(Craft::$app->getRequest()->getParam($param)) ? $nullVal : Craft::$app->getRequest()->getParam($param);
    }

    private function validateUserId() {
        
        $input = Craft::$app->getRequest()->getRequiredParam("userId");
        $user = Craft::$app->getUser();
        $sessionId = $user->id;

        //Block spoof attempts
        if((int)$sessionId !== (int)$input) {
            throw new \Exception('Invalid Form Request: Invalid User Id');
            die();
        }

        return $sessionId;
    }

}
