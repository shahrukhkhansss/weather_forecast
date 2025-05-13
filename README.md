
# Weather Forecast App

Before you begin, make sure you have the following installed:
   vscode/Android studio
   Flutter SDK (latest stable version recommended)
   Android/iOS Emulator or a physical device
   

# step 1
install the dependencies in terminal-flutter pub get

# step 2
need to install the emulator in vscode/Android studio

# step 3
after installation you need to run the app-flutter run
 
# step 4
then you have to select the device 
* after selecting the device it will take little bit time install on emulator 
* when the installation complete the app will visible in emulator

# If you don't have the emulator or you feel your pc getting lag its has an alternate option

# Run Flutter App on a Physical Android Device
* Your Android phone with Developer Options and USB Debugging enabled
* A USB cable to connect your phone to your PC

# Enable Developer Option on your phone
* Open your phone’s Settings
* Go to About phone
* Tap Build number until you see “You are now a developer!”
* Go back to Settings → System → Developer options
* Enable USB Debugging

# Connect your phone to the computer via USB
* You might see a prompt on your phone to allow USB debugging access tap Allow

# after completion of this process
* check by typing flutter devices in terminal is this device is connected or not
* then type flutter run in terminal
* it automatically build the application on your physical device

# Another option to see the application by installing apk on physical device
* Path to locate the apk file in directory
* build/app/output/flutter-apk/app-release.apk
* transfer the apk to physical device and install the apk 