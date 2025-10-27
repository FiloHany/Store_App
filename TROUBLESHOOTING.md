# Flutter Project Troubleshooting Guide

## Common Gradle and Android Build Issues

### 1. Gradle Version Warning/Error
**Issue:**
```
Warning: Flutter support for your project's Gradle version (X.X.X) will soon be dropped.
```

**Solution:**
1. Open `android/gradle/wrapper/gradle-wrapper.properties`
2. Update the distributionUrl to the latest supported version:
```properties
distributionUrl=https\://services.gradle.org/distributions/gradle-8.7-all.zip
```

### 2. Android Gradle Plugin (AGP) Version Warning/Error
**Issue:**
```
Warning: Flutter support for your project's Android Gradle Plugin version will soon be dropped.
```

**Solution:**
1. Open `android/settings.gradle`
2. Update the AGP version in the plugins block:
```groovy
plugins {
    id "com.android.application" version "8.6.0" apply false
}
```

### 3. Kotlin Version Warning/Error
**Issue:**
```
Warning: Flutter support for your project's Kotlin version will soon be dropped.
```

**Solution:**
1. Open `android/settings.gradle`
2. Update the Kotlin version in the plugins block:
```groovy
plugins {
    id "org.jetbrains.kotlin.android" version "2.1.0" apply false
}
```

### 4. Java Version Issues
**Issue:**
- Java compatibility warnings
- JAVA_HOME not set correctly

**Solution:**
1. Open `android/app/build.gradle`
2. Update Java version settings:
```groovy
android {
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }
}
```
3. Set JAVA_HOME in PowerShell (temporary):
```powershell
$env:JAVA_HOME = "C:\Program Files\Java\jdk-17.0.1"
```
4. Or set JAVA_HOME permanently in Windows:
   - Open System Properties → Advanced → Environment Variables
   - Add/Update JAVA_HOME to point to your JDK 17 installation

## Quick Fix Commands

### Reset Flutter Project
```powershell
flutter clean
flutter pub get
flutter run
```

### Rebuild Gradle Wrapper
```powershell
cd android
./gradlew wrapper --gradle-version 8.7 --distribution-type all
cd ..
```

### Force Update Dependencies
```powershell
flutter pub upgrade
flutter pub outdated  # Check for available updates
```

## Package Version Issues

### Font Awesome Flutter Issues
If you encounter errors with font_awesome_flutter package:

1. Option A - Pin version in `pubspec.yaml`:
```yaml
dependencies:
  font_awesome_flutter: 10.8.1  # Use stable version
```

2. Option B - Upgrade Flutter:
```powershell
flutter upgrade
flutter pub get
```

## Build Performance Tips

1. Enable Gradle Daemon:
   - Create/edit `android/gradle.properties`:
```properties
org.gradle.daemon=true
org.gradle.jvmargs=-Xmx2048m
org.gradle.parallel=true
android.useAndroidX=true
```

2. Use offline mode when possible:
```powershell
cd android
./gradlew --offline
```

## Checking Versions

### Flutter and Dart
```powershell
flutter --version
dart --version
```

### Java
```powershell
java -version
```

### Gradle
```powershell
cd android
./gradlew --version
```

## Emergency Bypass Flags

If you need to temporarily bypass version checks:
```powershell
flutter run --android-skip-build-dependency-validation
```

**Note:** This is a temporary solution. It's better to update to supported versions.

## Keep Updated

Regularly check for updates:
```powershell
flutter upgrade
flutter pub outdated
```

## Support Resources

- [Flutter Documentation](https://docs.flutter.dev)
- [Gradle Documentation](https://docs.gradle.org)
- [Android Gradle Plugin Documentation](https://developer.android.com/studio/releases/gradle-plugin)
- [Kotlin Documentation](https://kotlinlang.org/docs/home.html)