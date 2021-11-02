<?php
namespace fablevision\netlogo\assetbundles;

use craft\web\AssetBundle;
use craft\web\assets\cp\CpAsset;

class LoginBundle extends AssetBundle
{
    public function init()
    {
        $this->sourcePath = '@fablevision/netlogo/assetbundles/login';
        $this->css = [ 
        	"css/login.css",
        ];

        parent::init();
    }
}