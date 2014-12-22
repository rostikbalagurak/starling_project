/**
 * Created by Rostik on 20.12.2014.
 */
package screens {
import flash.utils.getTimer;

import objects.GameBackground;
import objects.Hero;

import starling.display.Button;

import starling.display.Sprite;
import starling.events.Event;
import utils.Assets;

import utils.Config;

public class InGame extends Sprite implements Disposable {
    protected var heroEasingFactor:Number = 0.05;

    protected var hero:Hero;
    protected var startBtn:Button;
    protected var bg:GameBackground;

    protected var timePrevious:Number = 0;
    protected var timeCurrent:Number = 0;
    protected var timeElapsed:Number = 0;

    protected var heroSpeed:int = 0;
    protected var hitsEncountered:int = 0;

    protected var gameState:int;

    public function InGame() {
        super();

        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    protected function onAddedToStage(e:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        drawGame();
    }

    protected function drawGame():void {
        bg = new GameBackground();
        addChild(bg);

        hero = new Hero();
        hero.x = stage.stageWidth / 2;
        hero.y = stage.stageHeight / 2;
        addChild(hero);

        startBtn = new Button(Assets.getTextureAtlas().getTexture('startButton'));
        startBtn.x = (stage.stageWidth / 2) - (startBtn.width / 2);
        startBtn.y = (stage.stageHeight / 2) - (startBtn.height / 2);
        addChild(startBtn);
    }

    protected function onStartBtnTriggered(e:Event):void {
        this.startBtn.visible = false;
        this.startBtn.removeEventListener(Event.TRIGGERED, onStartBtnTriggered);

        launchGame();
    }

    protected function launchGame():void {
        this.addEventListener(Event.ENTER_FRAME, onGameTick);
    }

    protected function onGameTick(e:Event):void {
        switch (gameState) {
            case Config.GAME_STATE_IDLE:
                if(hero.x < stage.stageWidth / 4) {
                    hero.x += (stage.stageWidth / 4) * heroEasingFactor; // moving to required position
                    hero.y = stage.stageHeight / 2 - hero.height / 2; // centered vertically

                    heroSpeed += (Hero.MIN_SPEED - heroSpeed) * heroEasingFactor; // increasing speed to minimal with easing
                    bg.speed = heroSpeed * timeElapsed; // increasing bg speed using player speed and time spent in game
                } else {
                    gameState = Config.GAME_STATE_RUNNING;
                }
                break;
            case Config.GAME_STATE_RUNNING:
                heroSpeed -= (heroSpeed - Hero.MIN_SPEED) * 0.01;
                bg.speed = heroSpeed * timeElapsed; // continue to increase speed based on time spent in game
                break;
            case Config.GAME_STATE_OVER:

                break;
        }
    }

    public function disposeTemporally():void {
        this.visible = false;
    }

    public function initialize():void {
        this.visible = true;

        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
        gameState = Config.GAME_STATE_IDLE;

        hero.x = -stage.stageWidth / 2;
        hero.y = stage.stageHeight / 2;

        startBtn.addEventListener(Event.TRIGGERED, onStartBtnTriggered);

        this.heroSpeed = 0;
        this.hitsEncountered = 0;
        this.bg.speed = 0;
    }

    /**
     * Calculate seconds from the game start
     * @param e
     */
    protected function onEnterFrame(e:Event):void {
        timePrevious = timeCurrent;
        timeCurrent = getTimer();

        timeElapsed = (timeCurrent - timePrevious) * 0.001;
    }
}
}
