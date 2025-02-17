package com.pinciat.external_path

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.os.Environment
import android.content.Context
import java.io.File
import kotlin.collections.ArrayList

class ExternalPathPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "external_path")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when(call.method) {
      "getExternalStorageDirectories" -> result.success(getExternalStorageDirectories())
      "getExternalStoragePublicDirectory" -> result.success(getExternalStoragePublicDirectory(call.argument<String>("type")))
      else -> result.notImplemented()
    }
  }

  private fun getExternalStorageDirectories(): ArrayList<String> {
    val appsDir: Array<File> = context.getExternalFilesDirs(null)
    val extRootPaths: ArrayList<String> = ArrayList()
    for (file in appsDir) {
      extRootPaths.add(file.absolutePath)
    }
    return extRootPaths
  }

  private fun getExternalStoragePublicDirectory(type: String?): String {
    return Environment.getExternalStoragePublicDirectory(type).toString()
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
