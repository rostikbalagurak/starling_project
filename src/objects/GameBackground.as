/**
 * Created by Rostik on 21.12.2014.
 */
package objects {
import starling.display.Sprite;
import starling.events.Event;

public class GameBackground extends Sprite{

    protected var layerSky:BgLayer;
    protected var layerHills:BgLayer;
    protected var layerBuildings:BgLayer;
    protected var layerTrees:BgLayer;

    private var _speed:int = 0;

    public function GameBackground() {
        super();

        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    protected function onAddedToStage(e:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        layerSky = new BgLayer(BgLayer.LAYER_SKY, 0.02);
        addChild(layerSky);
        layerHills = new BgLayer(BgLayer.LAYER_HILLS, 0.2);
        addChild(layerHills);
        layerBuildings = new BgLayer(BgLayer.LAYER_BUILDINGS, 0.5);
        addChild(layerBuildings);
        layerTrees = new BgLayer(BgLayer.LAYER_TREES, 1);
        addChild(layerTrees);

        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    /**
     * Decrement x position of every layer based on speed and parallax variables.
     * Restore initial position if layer moved to far
     * TODO rewrite (move background on 1 px every (x) frames X based on parallax)
     * @param e
     */
    protected function onEnterFrame(e:Event):void {
        var nextPos = layerSky.x - Math.ceil(_speed * layerSky.parallax);
        if(nextPos < -stage.stageWidth) {
            layerSky.x = 0;
        } else {
            layerSky.x = nextPos;
        }

        nextPos = layerHills.x - Math.ceil(_speed * layerHills.parallax);
        if(nextPos < -stage.stageWidth) {
            layerHills.x = 0;
        } else {
            layerHills.x = nextPos;
        }

        nextPos = layerBuildings.x - Math.ceil(_speed * layerBuildings.parallax);
        if(nextPos < -stage.stageWidth) {
            layerBuildings.x = 0;
        } else {
            layerBuildings.x = nextPos;
        }

        nextPos = layerTrees.x - Math.ceil(_speed * layerTrees.parallax);
        if(nextPos < -stage.stageWidth) {
            layerTrees.x = 0;
        } else {
            layerTrees.x = nextPos;
        }
    }

    public function get speed():int {
        return _speed;
    }

    public function set speed(value:int):void {
        _speed = value;
    }
}
}
