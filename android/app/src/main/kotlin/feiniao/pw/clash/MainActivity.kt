package feiniao.pw.clash


import feiniao.pw.clash.plugins.AppPlugin
import feiniao.pw.clash.plugins.ProxyPlugin
import feiniao.pw.clash.plugins.TilePlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GlobalState.flutterEngine?.destroy()
        super.configureFlutterEngine(flutterEngine)
        flutterEngine.plugins.add(AppPlugin())
        flutterEngine.plugins.add(ProxyPlugin())
        flutterEngine.plugins.add(TilePlugin())
        GlobalState.flutterEngine = flutterEngine
    }

    override fun onDestroy() {
        GlobalState.flutterEngine = null
        super.onDestroy()
    }
}