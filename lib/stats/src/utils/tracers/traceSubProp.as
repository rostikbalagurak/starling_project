/**
 * Created with IntelliJ IDEA.
 * User: Jerry_Orta
 * Date: 5/23/13
 * Time: 12:34 PM
 * To change this template use File | Settings | File Templates.
 */
package utils.tracers {

    public function traceSubProp(id:String, obj:Object):void {
            trace(id + ": Object = ")
            for(var prop:String in obj) {
                var value:Object = obj[prop];
                if (typeof obj[prop] === "object") {
                    traceSubProp(id, obj[prop]);
                } else if (typeof obj[prop] === "array"){
                    traceSubArray(id, obj[prop])
                } else {
                    trace("\t" + id + " = " + value);
                }
            }

    }

}
