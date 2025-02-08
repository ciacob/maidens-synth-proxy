package eu.claudius.iacob.synth.sound {

    import cmodule.fluidsynth_swc.CLibInit;
    import eu.claudius.iacob.synth.interfaces.ISynthEngine;
    import flash.utils.ByteArray;
    import flash.system.System;

    public class AlchemySynthEngine implements ISynthEngine {
        private static const SOUND_FONT_DEFAULT_PRESET_NUMBER:int = 0;

        private var _shell:CLibInit;
        private var _synth:Object;
        private var _fluidSynthInitialized:Boolean;
        private var _soundFontSupplied:Boolean;
        private var _currPreset:int;

        public function AlchemySynthEngine() {
            _shell = new CLibInit();
            // _printMemory();
        }

        public function initSynth(bank:int, preset:int):void {

            // N.B.: we don't use this preset, as this synth is faulty and can only play
            // from bank `0`, preset `0`. We worked this around by building a
            // velocity-switched sound font, and sending the preset as velocity to
            // `noteOn` instead.
            // @see `noteOn`
            _currPreset = preset;
            if (!_fluidSynthInitialized) {
                _fluidSynthInitialized = true;
                _synth.fluidsynth_init(bank, SOUND_FONT_DEFAULT_PRESET_NUMBER);
            }
            // _printMemory();
        }

        public function supplySoundFont(fileName:String, soundFontData:ByteArray):void {
            if (!_soundFontSupplied) {
                _soundFontSupplied = true;
                _shell.supplyFile(fileName, soundFontData);
                _synth = _shell.init();
            }
            // _printMemory();
        }

        public function noteOn(channel:int, key:int, ignore:int):void {
            _synth.fluidsynth_noteon(channel, key, _currPreset);
            // _printMemory();
        }

        public function noteOff(channel:int, key:int):void {
            _synth.fluidsynth_noteoff(channel, key);
            // _printMemory ();
        }

        public function getSamples(buffer:ByteArray):void {
            _synth.fluidsynth_getdata(buffer);
        }

        private function _printMemory():void {
            var prv:String = (System.privateMemory / 1024 / 1024).toFixed(2);
            var totalNr:String = (System.totalMemoryNumber / 1024 / 1024).toFixed(2);
            var free:String = (System.freeMemory / 1024 / 1024).toFixed(2);
            trace('>>>> Memory MB (Private, Total Nr., Free):', prv, totalNr, free, '<<<<');
        }
    }
}
