# Check Yourself!
  This project is a cross-platform flutter application with minimal features, just enough to be used to check yourself!

<img src="/assets/images/icon-636×670-android.png" height="350px"/> <br>

# Screenshots: Visualizations On a Physical iOS Device
<img src="/assets/screenshots/IMG_912.PNG" height="620px"/> <img src="/assets/screenshots/IMG_2915.PNG" height="620px"/> <img src="/assets/screenshots/IMG_2916.PNG" height="620px"/> 
<img src="/assets/screenshots/IMG_2917.PNG" height="620px"/> <img src="/assets/screenshots/IMG_2918.PNG" height="620px"/> <img src="/assets/screenshots/IMG_2919.PNG" height="620px"/> 
<img src="/assets/screenshots/IMG_2920.PNG" height="620px"/> <img src="/assets/screenshots/IMG_2922.PNG" height="620px"/> <img src="/assets/screenshots/IMG_2925.PNG" height="620px"/>


# What to install
If your operating System is macOS, then you would need to get the Flutter SDK, run flutter doctor command to see if install any dependencies needed to complete the setup, and update the PATH variable for the current session at the command line so that you can run flutter commands in any terminal session.

# Platform setup
1. iOS setup

* Xcode installed

To develop and run this app for iOS, you need a Mac with Xcode installed. After downloading and installing Xcode from either https://developer.apple.com/xcode/ or https://apps.apple.com/us/app/xcode/id497799835.

* Set up the iOS simulator 

A simulator using a 64-bit device (iPhone 5s or later) is also needed to visualize and use the app (you can check the settings in the simulator’s Hardware > Device menu).

The fastest way would be find the Simulator via Spotlight. Using "open -a Simulator" command would also work. 

Depending on your development machine’s screen size, simulated high-screen-density iOS devices might overflow your screen. Set the device scale under the Window > Scale menu in the simulator.

* Deploy to iOS devices

To deploy your Flutter app to a physical iOS device you need the third-party CocoaPods dependency manager and an Apple Developer account. You’ll also need to set up physical device deployment in Xcode.

Firstly, you need to install and set up CocoaPods by running the following commands:

$ sudo gem install cocoapods
$ pod setup

Then please follow the Xcode signing flow to provision the project (details described here: https://flutter.dev/docs/get-started/install/macos#platform-setup.)

2. Android setup

* Install Android Studio

Download and install Android Studio: https://developer.android.com/studio
Start Android Studio, and go through the ‘Android Studio Setup Wizard’. This installs the latest Android SDK, Android SDK Command-line Tools, and Android SDK Build-Tools, which are required by Flutter when developing for Android.


* Set up your Android device

To prepare to run this app on an Android device, you’ll need an Android device running Android 4.1 (API level 16) or higher.
Then follow these steps:

Enable Developer options and USB debugging on your device. (Detailed instructions are available in the Android documentation.)
Windows-only: Install the Google USB Driver.

Using a USB cable, plug your phone into your computer. If prompted on your device, authorize your computer to access your device.

In the terminal, run the "flutter devices" command to verify that Flutter recognizes your connected Android device. By default, Flutter uses the version of the Android SDK where your adb tool is based. If you want Flutter to use a different installation of the Android SDK, you must set the ANDROID_HOME environment variable to that installation directory.

* Set up the Android emulator

To prepare to run this app on the Android emulator, follow these steps:

Enable VM acceleration on your machine.

Launch Android Studio > Tools > Android > AVD Manager and select Create Virtual Device. (The Android submenu is only present when inside an Android project.)

Choose a device definition and select Next.

Verify the AVD configuration is correct, and select Finish.

For details on the above steps, see Managing AVDs: https://developer.android.com/studio/run/managing-avds.

In Android Virtual Device Manager, click Run in the toolbar. The emulator starts up and displays the default canvas for your selected OS version and device.

Please refer to https://flutter.dev/docs/get-started/install/macos for a detailed step-by-step walkthrough.

# How to build & run

After finishing aforementioned set-up/preparation procedures, you could build this app in iOS by opening the runner file under the iOS folder in this project and click the run button in the Xcode. (Running "flutter run" would also work.) It will automatically run on a simulator once the app is built successfully via Xcode. 

To build this app in Android Virtual Device Manager, click Run in the toolbar. The emulator starts up and displays the default canvas for your selected OS version and device.


# References
https://flutter.dev/docs/get-started/install/macos

https://flutter.dev/docs/reference/tutorials

https://pub.dev/packages/calendar_strip

