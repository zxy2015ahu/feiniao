package feiniao.pw.clash.services

import android.annotation.SuppressLint
import android.app.PendingIntent
import android.content.Intent
import android.os.Build
import android.service.quicksettings.Tile
import android.service.quicksettings.TileService
import androidx.annotation.RequiresApi
import androidx.lifecycle.Observer
import feiniao.pw.clash.GlobalState
import feiniao.pw.clash.RunState
import feiniao.pw.clash.TempActivity
import feiniao.pw.clash.plugins.AppPlugin
import feiniao.pw.clash.plugins.ProxyPlugin
import feiniao.pw.clash.plugins.TilePlugin
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor


@RequiresApi(Build.VERSION_CODES.N)
class FlClashTileService : TileService() {

    private val observer = Observer<RunState> { runState ->
        updateTile(runState)
    }

    private fun updateTile(runState: RunState) {
        if (qsTile != null) {
            qsTile.state = when (runState) {
                RunState.START -> Tile.STATE_ACTIVE
                RunState.PENDING -> Tile.STATE_UNAVAILABLE
                RunState.STOP -> Tile.STATE_INACTIVE
            }
            qsTile.updateTile()
        }
    }

    override fun onStartListening() {
        super.onStartListening()
        GlobalState.runState.value?.let { updateTile(it) }
        GlobalState.runState.observeForever(observer)
    }

    @SuppressLint("StartActivityAndCollapseDeprecated")
    private fun activityTransfer() {
        val intent = Intent(this, TempActivity::class.java)
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        if (Build.VERSION.SDK_INT >= 34) {
            val pendingIntent = PendingIntent.getActivity(
                this,
                0,
                intent,
                PendingIntent.FLAG_IMMUTABLE
            )
            startActivityAndCollapse(pendingIntent)
        } else {
            startActivityAndCollapse(intent)
        }
    }

    private var flutterEngine: FlutterEngine? = null;

    private fun initFlutterEngine() {
        flutterEngine = FlutterEngine(this)
        flutterEngine?.plugins?.add(ProxyPlugin())
        flutterEngine?.plugins?.add(TilePlugin())
        flutterEngine?.plugins?.add(AppPlugin())
        GlobalState.flutterEngine = flutterEngine
        if (flutterEngine?.dartExecutor?.isExecutingDart != true) {
            val vpnService = DartExecutor.DartEntrypoint(
                FlutterInjector.instance().flutterLoader().findAppBundlePath(),
                "vpnService"
            )
            flutterEngine?.dartExecutor?.executeDartEntrypoint(vpnService)
        }
    }

    override fun onClick() {
        super.onClick()
        activityTransfer()
        val currentTilePlugin = GlobalState.getCurrentTilePlugin()
        if (GlobalState.runState.value == RunState.STOP) {
            GlobalState.runState.value = RunState.PENDING
            if(currentTilePlugin == null){
                initFlutterEngine()
            }else{
                currentTilePlugin.handleStart()
            }
        } else if(GlobalState.runState.value == RunState.START){
            GlobalState.runState.value = RunState.PENDING
            currentTilePlugin?.handleStop()
        }

    }

    override fun onDestroy() {
        GlobalState.runState.removeObserver(observer)
        super.onDestroy()
    }
}