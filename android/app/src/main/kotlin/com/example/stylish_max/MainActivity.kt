package com.example.stylish_max

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import androidx.annotation.NonNull
import android.util.Log

class MainActivity: FlutterActivity() {
    private val CHANNEL = "example.stylish_max/channel"
    
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->
      if (call.method == "getDeviceInfo") {
        val deviceInfo = "123"
        print("Max123 $deviceInfo")
        result.success(deviceInfo)
    } else {
        result.notImplemented()
    }
    }
  }
}
