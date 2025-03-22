plugins {
    id "com.android.application"
    id "com.google.gms.google-services" // Firebase
    id "kotlin-android"
    id "dev.flutter.flutter-gradle-plugin"
}

android {
    namespace = "com.example.depi"
    compileSdk 34
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_1_8
    }

    defaultConfig {
        applicationId = "com.example.depi"
        buildToolsVersion = "33.0.0"
        minSdk = 23
        targetSdk = 33
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled true // ✅ Enabled MultiDex
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.debug
        }
    }
}

dependencies {
    implementation 'androidx.multidex:multidex:2.0.1' // ✅ Added MultiDex dependency
}

flutter {
    source = "../.."
}
