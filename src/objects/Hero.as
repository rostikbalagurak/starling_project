/**
 * Created by Rostik on 20.12.2014.
 */
package objects {
import starling.core.Starling;
import starling.display.MovieClip;
import starling.display.Sprite;
import starling.events.Event;

import utils.Assets;

public class Hero extends Sprite{

    public static const LIFES_COUNT = 3;
    public static const MIN_SPEED = 650;
    protected var heroArt:MovieClip;

    public function Hero() {
        super();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    protected function onAddedToStage(e:Event):void {
        if(StarlingProject.isDebugEnabled()){
            trace('Hero object is added to stage');
        }
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        this.drawHeroArt();
    }

    protected function drawHeroArt():void {
        heroArt = new MovieClip(Assets.getTextureAtlas().getTextures('fly_'), 20);

        // place art in the center of this class
        heroArt.x = Math.ceil(-heroArt.width/2);
        heroArt.y = Math.ceil(-heroArt.height/2);
        addChild(heroArt);

        // starting animation
        Starling.juggler.add(heroArt);
    }
}
}
