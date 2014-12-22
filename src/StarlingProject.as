/**
 * Created by Rostik on 13.12.2014.
 */
package {
import flash.display.Sprite;
import starling.core.Starling;
import utils.debug.Stats;

[SWF(frameRate="60", width="800", height="600", backgroundColor="0x333333")]
public class StarlingProject extends Sprite{

    protected static var debugEnabled:Boolean = true;

    protected var myStarling:Starling;
    protected var stat:Stats;

    public function StarlingProject() {
        if(debugEnabled){
            stat = new Stats();
            addChild(stat);
        }

        myStarling = new Starling(Game, stage);
        myStarling.antiAliasing = 1;
        myStarling.start();
    }

    public static function isDebugEnabled():Boolean{
        return StarlingProject.debugEnabled;
    }
}
}
