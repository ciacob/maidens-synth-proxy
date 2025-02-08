package eu.claudius.iacob.synth.interfaces {

    import flash.utils.ByteArray;

    public interface ISynthEngine {

        function initSynth(bank:int, preset:int):void;
        function supplySoundFont(fileName:String, soundFontData:ByteArray):void;
        function noteOn(channel:int, key:int, velocity:int):void;
        function noteOff(channel:int, key:int):void;
        function getSamples(buffer:ByteArray):void;
    }
}
