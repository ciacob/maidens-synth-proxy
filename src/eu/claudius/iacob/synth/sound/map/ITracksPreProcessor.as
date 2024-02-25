package eu.claudius.iacob.synth.sound.map {

/**
 * An ITracksPreProcessor implementor is a handler that preprocesses Tracks material before sending it to the synth.
 * The typical use would be to alter velocity, volume and/or start time/end time in order to increase the degree of
 * realism of the played back material.
 */
public interface ITracksPreProcessor {

    /**
     * Actually performs any due alteration of the original material. This method performs destructive work, i.e.,
     * the original data is changed in place. If a back-up is needed, it must be made outside this implementor's class.
     *
     * @param   tracks
     *          Collection of Tracks (containing NoteTrackObjects). Note that it is not expected that this implementor
     *          relocates the existing NoteTrackObjects (to other tracks); it should contain itself to altering their
     *          `offset` properties.
     */
    function process(tracks:Vector.<Track>):void;
}
}
