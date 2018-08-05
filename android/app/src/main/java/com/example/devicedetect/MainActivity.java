package com.example.devicedetect;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

import android.util.DisplayMetrics;
import java.util.HashMap;
import java.util.Map;

public class MainActivity extends FlutterActivity {

  private static final String  METRICS_CHANNEL = "uk.spiralarm.display/metrics";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel( getFlutterView(), METRICS_CHANNEL).setMethodCallHandler(

      new MethodCallHandler() {

        @Override
        public void onMethodCall(MethodCall call, Result result) {
          if(call.method.equals("getDisplayMetrics")){
            DisplayMetrics dm = getDisplayMetrics();
            if(dm != null){
              Map<String, Object> metrics = new HashMap<>();
              metrics.put("density", dm.density);
              metrics.put("densityDpi", dm.densityDpi);
              metrics.put("width", dm.widthPixels);
              metrics.put("height", dm.heightPixels);
              metrics.put("scaledDensity", dm.scaledDensity);
              metrics.put("xdpi", dm.xdpi);
              metrics.put("ydpi", dm.ydpi);
              result.success(metrics);
            } else {
              result.error("UNAVAILABLE", "Display Metrics Not Available", null);
            }
          } else {
            result.notImplemented();
          }
        }

      }

    );
  }


  // Request the DisplayMetrics
  private DisplayMetrics getDisplayMetrics() {
    DisplayMetrics dm  = new DisplayMetrics();
    getWindowManager().getDefaultDisplay().getMetrics(dm);
    return dm;
  }

}
