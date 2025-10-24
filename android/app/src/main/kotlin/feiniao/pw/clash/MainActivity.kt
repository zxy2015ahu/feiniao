package feiniao.pw.clash


import feiniao.pw.clash.plugins.AppPlugin
import feiniao.pw.clash.plugins.ProxyPlugin
import feiniao.pw.clash.plugins.TilePlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.umeng.commonsdk.UMConfigure
import android.os.Bundle

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GlobalState.flutterEngine?.destroy()
        super.configureFlutterEngine(flutterEngine)
        flutterEngine.plugins.add(AppPlugin())
        flutterEngine.plugins.add(ProxyPlugin())
        flutterEngine.plugins.add(TilePlugin())
        GlobalState.flutterEngine = flutterEngine
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        UMConfigure.preInit(this, "68e6ffea8560e34872c2ba2c", "Umeng")
    }
    override fun onDestroy() {
        GlobalState.flutterEngine = null
        super.onDestroy()
    }
}