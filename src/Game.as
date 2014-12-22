/**
 * Created by Rostik on 13.12.2014.
 */
package {
import events.NavigationEvent;

import screens.Welcome;
import screens.InGame;

import starling.display.Sprite;
import starling.events.Event;

public class Game extends Sprite{

    public static const PLAY_SCREEN:String = 'play';
    public static const ABOUT_SCREEN:String = 'about';

    protected var welcomeScreen:Welcome;
    protected var playScreen:InGame;

    public function Game() {
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    protected function onAddedToStage(e:Event):void{
        if(StarlingProject.isDebugEnabled()){
            trace('Starling initialized!');
        }

        playScreen = new InGame();
        addChild(playScreen);
        playScreen.disposeTemporally();

        welcomeScreen = new Welcome();
        addChild(welcomeScreen);
        welcomeScreen.initialize();

        this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
    }

    protected function onChangeScreen(e:NavigationEvent):void {

        switch (e.params.id) {
            case PLAY_SCREEN:
                switchToPlayScreen();
                break;
            case ABOUT_SCREEN:
                switchToAboutScreen();
                break;
        }
    }

    protected function switchToPlayScreen():void {
        welcomeScreen.disposeTemporally();
        playScreen.initialize();
    }

    protected function switchToAboutScreen():void {
        // TODO
    }
}
}
