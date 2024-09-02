package com.example.infcurion_app

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlin.math.log

class MainActivity: FlutterActivity() {
    private val channel = "com.example.infcurion_sdk/launch"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler {
            call, result ->
            if (call.method == "launchSDK") {
                launchSDK()
                result.success(null)
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    private fun launchSDK() {
        println("@@@ onCreated")
        startActivity(FlutterActivity.createDefaultIntent(this))
        println("@@@ started Activity")
        startActivity(FlutterActivity
            .withNewEngine()
            .build(this))
    }
}