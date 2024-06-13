package com.example.test.music_player_flutter

import android.content.ContentValues.TAG
import android.content.Context
import android.database.Cursor
import android.net.Uri
import android.provider.MediaStore
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "ua.kiev.utec.music_player").setMethodCallHandler { call, result ->

            //functions here
            fun getRealPathFromURI(context: Context, contentUri: Uri): String {
                val column = MediaStore.Audio.Media.DATA

                var cursor: Cursor? = null
                try {
                    val proj: Array<String> = Array(1){ column }
                    cursor = context.contentResolver.query(contentUri,  proj, null, null, null)
                    val columnIndex: Int = cursor?.getColumnIndex(column) ?: 0
                    cursor?.moveToFirst()
                    return cursor?.getString(columnIndex) ?: ""
                } catch (e: Exception) {
                    Log.e(TAG, "getRealPathFromURI Exception : $e")
                    return ""
                } finally {
                    cursor?.close()
                }
            }

            fun getPathFromContentURI(contentUri: String) {

                var absolutePath = ""

                val context: Context = this.applicationContext
                val uri: Uri = Uri.parse(contentUri)

                absolutePath = getRealPathFromURI(context, uri)

                result.success(absolutePath)

            }

            if (call.method == "getPathFromContentURI") {

                val contentUri = call.argument<String>("contentURI");
                if (contentUri != null) {
                    getPathFromContentURI(contentUri)
                }
            }
        }
    }
}

