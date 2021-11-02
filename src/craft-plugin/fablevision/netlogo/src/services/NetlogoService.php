<?php
/**
 * netlogo plugin for Craft CMS 3.x
 *
 * Craft plugin to support Blockly and Netlogo integration 
 *
 * @link      fablevision.com
 * @copyright Copyright (c) 2021 Chris Spence
 */

namespace fablevision\netlogo\services;

use fablevision\netlogo\Netlogo;
use fablevision\netlogo\records\ProgressRecord;

use Craft;
use craft\base\Component;

/**
 * @author    Chris Spence
 * @package   Netlogo
 * @since     0.0.5
 */
class NetlogoService extends Component {

    public function saveProgress($userId, $journeyId, $taskId, $progress) {
        $record = ProgressRecord::find()
                    ->where(["userId" => $userId, "journeyId" => $journeyId, "taskId" => $taskId])
                    ->one();

        if(empty($record)) {
            $record = new ProgressRecord();
            $record->setAttribute("userId", $userId);
            $record->setAttribute("journeyId", $journeyId);
            $record->setAttribute("taskId", $taskId);
        }

        $record->setAttribute("progress", $progress);
        $record->save();

        return json_encode((object) array("status" => 200));
    }


    public function loadProgress($userId, $journeyId, $taskId) {
        $record = ProgressRecord::find()
                    ->where(["userId" => $userId, "journeyId" => $journeyId, "taskId" => $taskId])
                    ->one();

        if(empty($record)) {
            return json_encode((object) array("status" => 200, "progress" => null));
        }

        return json_encode((object) array("status" => 200, "progress" => $record->getAttribute("progress")));
    }
    
}
