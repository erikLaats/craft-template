<?php
namespace craft\contentmigrations;

use craft\db\Migration;
use dgrigg\migrationassistant\MigrationAssistant;

/**
 * Generated migration
 */
class m210930_192221_migration_entry_journey_diffusion_journey extends Migration
{
    /**
    Migration manifest:

    ENTRY
    - journey-diffusion
    - journey
    */

    private $json = <<<'JSON'
{ "content": { "entries": [ { "slug": "journey-diffusion", "section": "journey", "sites": { "default": { "slug": "journey-diffusion", "section": "journey", "enabled": true, "site": "default", "enabledForSite": true, "postDate": { "date": "2021-06-07 07:50:00.000000", "timezone_type": 3, "timezone": "America/Los_Angeles" }, "expiryDate": null, "title": "Journey: Diffusion", "entryType": "journey", "uid": "e842418d-02b8-46f6-9c3a-811e5e0a8e23", "author": "admin", "fields": { "journeyTitle": "Diffusion", "journeyDescription": "<p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Donec sed odio dui. Nullam id dolor id nibh ultricies vehicula ut id elit. Nulla vitae elit libero, a pharetra augue.</p>", "thumbnail": [ { "elementType": "craft\\elements\\Asset", "filename": "placeholder.jpg", "folder": "Content Images", "source": "contentImages", "path": "/assets/images/content/" } ], "journeyTasks": [ { "elementType": "craft\\elements\\Entry", "slug": "journey-diffusion-task-diffusion", "section": "journeyTask", "site": "default" } ], "journeyResources": [] } } } }, { "slug": "journey", "section": "journey", "sites": { "default": { "slug": "journey", "section": "journey", "enabled": true, "site": "default", "enabledForSite": true, "postDate": { "date": "2021-09-28 09:50:00.000000", "timezone_type": 3, "timezone": "America/Los_Angeles" }, "expiryDate": null, "title": "Journey: Wildfires", "entryType": "journey", "uid": "c16fe0d9-6e99-419a-a8e2-16506591c59d", "author": "admin", "fields": { "journeyTitle": "How Wildfires Spread", "journeyDescription": "<p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Donec sed odio dui. Nullam id dolor id nibh ultricies vehicula ut id elit. Nulla vitae elit libero, a pharetra augue.</p>", "thumbnail": [ { "elementType": "craft\\elements\\Asset", "filename": "placeholder.jpg", "folder": "Content Images", "source": "contentImages", "path": "/assets/images/content/placeholder.jpg" } ], "journeyTasks": [ { "elementType": "craft\\elements\\Entry", "slug": "journey-wildfires-task-wildfires-1", "section": "journeyTask", "site": "default" } ], "journeyResources": [] } } } } ] } }
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
        echo "m210930_192221_migration_entry_journey_diffusion_journey cannot be reverted.\n";
        return false;
    }
}
