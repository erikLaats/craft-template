<?php
namespace craft\contentmigrations;

use craft\db\Migration;
use dgrigg\migrationassistant\MigrationAssistant;

/**
 * Generated migration
 */
class m210930_192214_migration_entry_journey_diffusion_task_diffusion_journey_wildfires_task_wildfires_1 extends Migration
{
    /**
    Migration manifest:

    ENTRY
    - journey-diffusion-task-diffusion
    - journey-wildfires-task-wildfires-1
    */

    private $json = <<<'JSON'
{"content":{"entries":[{"slug":"journey-diffusion-task-diffusion","section":"journeyTask","sites":{"default":{"slug":"journey-diffusion-task-diffusion","section":"journeyTask","enabled":true,"site":"default","enabledForSite":true,"postDate":{"date":"2021-06-07 07:51:00.000000","timezone_type":3,"timezone":"America/Los_Angeles"},"expiryDate":null,"title":"Journey: Diffusion, Task: Diffusion 1","entryType":"journeyTask","uid":"6f1d2c0a-4499-438a-a228-ff04dc2cebfe","author":"admin","fields":{"taskTitle":"Diffusion","blockLibrary":["diffusion"],"taskScript":[{"elementType":"craft\\elements\\Asset","filename":"water-diffusion.nlogo","folder":"Netlogo Scripts","source":"netlogoScripts","path":""}],"worldWidth":201}}}},{"slug":"journey-wildfires-task-wildfires-1","section":"journeyTask","sites":{"default":{"slug":"journey-wildfires-task-wildfires-1","section":"journeyTask","enabled":true,"site":"default","enabledForSite":true,"postDate":{"date":"2021-09-28 09:49:00.000000","timezone_type":3,"timezone":"America/Los_Angeles"},"expiryDate":null,"title":"Journey: Wildfires, Task: Wildfires 1","entryType":"journeyTask","uid":"4736b7e0-3738-4ab0-8d5e-a8c491b93f1f","author":"admin","fields":{"taskTitle":"Wildfires","blockLibrary":["general","wildfires"],"taskScript":[{"elementType":"craft\\elements\\Asset","filename":"wildfire-and-smoke-spread.nlogo","folder":"Netlogo Scripts","source":"netlogoScripts","path":""}],"worldWidth":31}}}}]}}
JSON;

    /**
     * Any migration code in here is wrapped inside of a transaction.
     * Returning false will rollback the migration
     *
     * @return bool
     */
    public function safeUp()
    {
        return MigrationAssistant::getInstance()->migrations->import($this->json);
    }

    public function safeDown()
    {
        echo "m210930_192214_migration_entry_journey_diffusion_task_diffusion_journey_wildfires_task_wildfires_1 cannot be reverted.\n";
        return false;
    }
}
