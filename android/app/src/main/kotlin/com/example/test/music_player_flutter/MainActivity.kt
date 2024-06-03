package com.example.test.music_player_flutter

import android.content.Context
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.net.wifi.SupplicantState
import android.net.wifi.WifiInfo
import android.net.wifi.WifiManager
import android.net.wifi.WifiNetworkSpecifier
import android.os.Build
import android.util.Log
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "ua.kiev.utec.music_player").setMethodCallHandler { call, result ->

            //functions here
            fun getPathFromContentURI(contentUri: String?) {

                val path = ""



                result.success(path)

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

