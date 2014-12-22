/**
 * Created by Rostik on 21.12.2014.
 */
package objects {
import starling.display.BlendMode;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;

import utils.Assets;

public class BgLayer extends Sprite{
    public static const LAYER_SKY:int = 1;
    public static const LAYER_HILLS:int = 2;
    public static const LAYER_BUILDINGS:int = 3;
    public static const LAYER_TREES:int = 4;

    protected var firstImage:Image;
    protected var secondImage:Image;

    protected var layerType:int;
    protected var _parallax:Number;

    public function BgLayer(layerType:int, parallax:Number) {
        super();

        this.layerType = layerType;
        this._parallax = parallax;
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    protected function onAddedToStage(e:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        switch (layerType) {
            case LAYER_SKY:
                this.firstImage = new Image(Assets.getTexture('bgSky'));
                this.secondImage = new Image(Assets.getTexture('bgSky'));
                break;
            case LAYER_HILLS:
                this.firstImage = new Image(Assets.getTextureAtlas().getTexture('bgLayer2'));
                this.secondImage = new Image(Assets.getTextureAtlas().getTexture('bgLayer2'));
                break;
            case LAYER_BUILDINGS:
                this.firstImage = new Image(Assets.getTextureAtlas().getTexture('bgLayer3'));
                this.secondImage = new Image(Assets.getTextureAtlas().getTexture('bgLayer3'));
                break;
            case LAYER_TREES:
                this.firstImage = new Image(Assets.getTextureAtlas().getTexture('bgLayer4'));
                this.secondImage = new Image(Assets.getTextureAtlas().getTexture('bgLayer4'));
                break;
            default:
                throw new Error("Unknown layer type: " + layerType);
                break;
        }

        firstImage.x = 0; // visible by default
        secondImage.x = secondImage.width; // right after stage

        firstImage.y = stage.stageHeight - firstImage.height; // align to the bottom of stage
        secondImage.y = firstImage.y;

        addChild(firstImage);
        addChild(secondImage);
    }

    public function get parallax():Number {
        return _parallax;
    }

    public function set parallax(value:Number):void {
        _parallax = value;
    }
}
}
