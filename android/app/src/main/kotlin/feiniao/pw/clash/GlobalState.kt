package feiniao.pw.clash

import androidx.lifecycle.MutableLiveData
import feiniao.pw.clash.plugins.TilePlugin
import io.flutter.embedding.engine.FlutterEngine
import java.util.Date

enum class RunState {
    START,
    PENDING,
    STOP
}

class GlobalState {
    companion object {
        val runState: MutableLiveData<RunState> = MutableLiveData<RunState>(RunState.STOP)
        var runTime: Date? = null
        var flutterEngine: FlutterEngine? = null
        fun getCurrentTilePlugin(): TilePlugin? =
            flutterEngine?.plugins?.get(TilePlugin::class.java) as TilePlugin?
    }
}


