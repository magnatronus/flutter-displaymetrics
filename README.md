# Flutter DisplayMetrics

I needed to be able to detect the DPI of an Android device (as an attempt to determine the physical screen size for a decision about Tablet/Phone form factors). I could not find anything that existed and had no suggestions to queries on how to do it so I decided to try and create some Android code to get the DisplayMetrics (dpi being part of this data).

The demo app will attempt to extract the DisplayMetrics of the device/emulator and prints the values to the screen. It does this by using *platform channels*  via some java code which can be found in **android/app/src/main/java/com/example/devicedetect/MainActivity.java**.


<img src ="http://butterfly-mobile.uk/wp-content/uploads/2018/08/display-metrics.jpeg" />


I actually only needed the DPI, but set it up to return all the DisplayMetrics data. Whether the screen size calcs work is another matter........




## Getting Started

For help getting started with Flutter, view the online
[documentation](https://flutter.io/).
