package eu.claudius.iacob.synth.sound.map {
public class TrackObjectWindow {

    private var _trackObject:TrackObject;
    private var _startTime:int;
    private var _timeSpan:int;

    /**
     * Helper class to represent the position a TrackObject currently holds on a Track.
     * @param   trackObject
     *          The TrackObject this information is related with.
     *
     * @param   startTime
     *          The starting position, in milliseconds, the related TrackObject is placed at, on its parent Track.
     *
     * @param   timeSpan
     *          The duration, in milliseconds, the related TrackObject occupies (technically: it is replicated for) on
     *          its parent Track.
     */
    public function TrackObjectWindow(trackObject:TrackObject, startTime:int, timeSpan:int) {
        _trackObject = trackObject;
        _startTime = startTime;
        _timeSpan = timeSpan;
    }

    public function get trackObject():TrackObject {
        return _trackObject;
    }

    public function get startTime():int {
        return _startTime;
    }

    public function get timeSpan():int {
        return _timeSpan;
    }
}
}
