package com.example.food_driver

import com.yandex.mapkit.MapKitFactory
import io.flutter.app.FlutterApplication

class MainApplication: FlutterApplication() {
  override fun onCreate() {
    super.onCreate()
    MapKitFactory.setApiKey("8b2e8560-d3ba-4e12-af55-13799846eb68")
  }
}