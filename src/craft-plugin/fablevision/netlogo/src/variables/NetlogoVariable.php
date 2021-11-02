<?php
/**
 * netlogo plugin for Craft CMS 3.x
 *
 * Craft plugin to support Blockly and Netlogo integration 
 *
 * @link      fablevision.com
 * @copyright Copyright (c) 2021 Chris Spence
 */

namespace fablevision\netlogo\variables;

use fablevision\netlogo\Netlogo;
use craft\elements\Entry;

use Craft;

/**
 * @author    Chris Spence
 * @package   Netlogo
 * @since     0.0.5
 */
class NetlogoVariable
{
    // Public Methods
    // =========================================================================

    /**
     * @param null $optional
     * @return string
     */
    public function getJourneyAndTask($journeyId, $taskId = null) {

        $output = (object) array();
        
        $journey = Entry::find()
                    ->section("journey")
                    ->id($journeyId)
                    ->one();

        $output->journey = (object) array();
        $output->journey->title = $journey->journeyTitle;
        $output->journey->description = $journey->journeyDescription->getParsedContent();

        if(!empty($taskId)) {
            $task = Entry::find()
                    ->section("journeyTask")
                    ->id($taskId)
                    ->one();

            $script = $task->taskScript->one();
            $output->task = (object) array();
            $output->task->title = $task->taskTitle;
            $output->task->script = $script->getUrl();
        }

        return $output;
    }
}
