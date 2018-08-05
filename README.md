# Flutter DisplayMetrics

I needed to be able to detect the DPI of an Android device (as an attempt to determine the physical screen size for a decision about Tablet/Phone form factors). I could not find anything that existed and had no suggestions to queries on how to do it so I decided to try and create some Android code to get the DisplayMetrics (dpi being part of this data).

The demo app will attempt to extract the DisplayMetrics of the device/emulator and prints the values to the screen. It does this by using *platform channels*  via some java code which can be found in **android/app/src/main/java/com/example/devicedetect/MainActivity.java**.


<img src ="http://butterfly-mobile.uk/wp-content/uploads/2018/08/display-metrics.jpeg" />


I actually only needed the DPI, but set it up to return all the DisplayMetrics data. Whether the screen size calcs work is another matter........



## Update
I have been updated and told of a much easier way to get the DPI by @slightfoot on the Flutter Gitter channel (Thanks Simon) 

MediaQuery gives the devicePixel Ratio  which on my emulator is 3.5, so if you multiple this value by 160 (mdpi value)  you end up with the DPI, in my case (560)


## Getting Started

For help getting started with Flutter, view the online
[documentation](https://flutter.io/).
