/**
 * Created by Rostik on 14.12.2014.
 */
package utils {
import flash.display.Bitmap;
import flash.utils.Dictionary;

import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class Assets {
    protected static var gameTextures:Dictionary = new Dictionary();
    protected static var gameTexturesAtlas:TextureAtlas;

    [Embed(source="../../media/graphics/bgWelcome.jpg")]
    public static const bgWelcome:Class;

    [Embed(source="../../media/graphics/bgLayer1.jpg")]
    public static const bgSky:Class;

    [Embed(source="../../media/graphics/mySpritesheet.png")]
    protected static const atlasTextureGame:Class;

    [Embed(source="../../media/graphics/mySpritesheet.xml", mimeType="application/octet-stream")]
    protected static const atlasTextureGameXml:Class;

    public static function getTextureAtlas():TextureAtlas{
        if(gameTexturesAtlas == null) {
            var texture:Texture = getTexture("atlasTextureGame");
            var xml:XML = XML(new atlasTextureGameXml());
            gameTexturesAtlas = new TextureAtlas(texture, xml);
        }
        return gameTexturesAtlas;
    }

    public static function getTexture(name:String):Texture {
        if(gameTextures[name] == undefined) {
            var bitmap:Bitmap = new Assets[name](); // WTF??
            gameTextures[name] = Texture.fromBitmap(bitmap);
        }
        return gameTextures[name];
    }
}
}
