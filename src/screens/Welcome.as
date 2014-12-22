/**
 * Created by Rostik on 14.12.2014.
 */
package screens {
import com.greensock.easing.Quad;

import events.NavigationEvent;
import starling.display.Button;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.EnterFrameEvent;
import starling.events.Event;
import com.greensock.TweenLite;

import utils.Assets;

public class Welcome extends Sprite implements Disposable{

    protected var bg:Image;
    protected var title:Image;
    protected var hero:Image;

    protected var playBtn:Button;
    protected var aboutBtn:Button;

    public function Welcome() {
        super();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        this.addEventListener(Event.TRIGGERED, onBtnTriggered);
    }

    protected function onAddedToStage(e:Event):void{
        if(StarlingProject.isDebugEnabled()){
            trace('Welcome screen is added to stage!');
        }
        this.drawScren();
    }

    /**
     * initializes and places textures, enables animation
     */
    protected function drawScren():void{
        bg = new Image(Assets.getTexture('bgWelcome'));
        addChild(bg);

        title = new Image(Assets.getTextureAtlas().getTexture('welcome_title'));
        title.x = 440;
        title.y = 20;
        addChild(title);

        hero = new Image(Assets.getTextureAtlas().getTexture('welcome_hero'));
        hero.x = - hero.width;
        hero.y = 100;
        addChild(hero);

        playBtn = new Button(Assets.getTextureAtlas().getTexture('welcome_playButton'));
        playBtn.x = 500;
        playBtn.y = 300;
        addChild(playBtn);

        aboutBtn = new Button(Assets.getTextureAtlas().getTexture('welcome_aboutButton'));
        aboutBtn.x = 410;
        aboutBtn.y = 420;
        addChild(aboutBtn);
    }

    public function initialize():void{
        this.visible = true;

        hero.x = - hero.width;
        hero.y = 100;

        TweenLite.to(hero, 1.2, {x: 80, ease:Quad.easeInOut});

        this.addEventListener(EnterFrameEvent.ENTER_FRAME, floatingAnimation);
    }

    public function disposeTemporally():void {
        this.visible = false;
        if(this.hasEventListener(EnterFrameEvent.ENTER_FRAME)) {
            this.removeEventListener(EnterFrameEvent.ENTER_FRAME, floatingAnimation);
        }
    }

    protected function floatingAnimation(e:Event):void{
        var currDate:Date = new Date();

        // some magic stuff
        hero.y = 100 + (Math.cos(currDate.getTime() * 0.002) * 25);
        playBtn.y = 300 + (Math.cos(currDate.getTime() * 0.002) * 10);
        aboutBtn.y = 420 + (Math.cos(currDate.getTime() * 0.002) * 10);
    }

    protected function onBtnTriggered(e:Event):void {
        var targetBtn:Button = e.target as Button;

        switch (targetBtn) {
            case playBtn:
                this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: Game.PLAY_SCREEN}, true));
                break;
            case aboutBtn:
                this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: Game.ABOUT_SCREEN}, true));
                break;
        }
    }
}
}
