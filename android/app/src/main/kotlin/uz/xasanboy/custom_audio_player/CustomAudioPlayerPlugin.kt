package uz.xasanboy.custom_audio_player

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Intent

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry




const val PLAYER_ACTIVITY = 111
const val PLAYER_ACTIVITY_FINISH = 222

class CustomAudioPlayerPlugin : FlutterPlugin, MethodCallHandler, ActivityAware,
    PluginRegistry.NewIntentListener, PluginRegistry.ActivityResultListener {
    private lateinit var channel: MethodChannel
    private var activity: Activity? = null
    private var resultMethod: Result? = null


    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {

        channel = MethodChannel(binding.binaryMessenger, "custom_audio_player")
        channel.setMethodCallHandler(this)



    }

    @SuppressLint("UnsafeOptInUsageError")
    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "play"){
            result.success(1)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)

    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity as FlutterActivity
        binding.addOnNewIntentListener(this)
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null

    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null

    }

    override fun onNewIntent(intent: Intent): Boolean {
        return true
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == PLAYER_ACTIVITY && resultCode == PLAYER_ACTIVITY_FINISH) {
            resultMethod?.success(data?.getLongExtra("position", 0))
        }
        return true
    }




}
