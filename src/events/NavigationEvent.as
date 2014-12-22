/**
 * Created by Rostik on 20.12.2014.
 */
package events {
import starling.events.Event;

public class NavigationEvent extends Event{

    public static const CHANGE_SCREEN = 'onChangeScreen';

    private var _params:Object;

    public function NavigationEvent(_type:String, params:Object = null, bubbles:Boolean = false) {
        super(_type, bubbles);

        this._params = params;
    }

    public function get params():Object {
        return _params;
    }
}
}
