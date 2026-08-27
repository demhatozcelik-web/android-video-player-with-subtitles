# APK Derleme Talimatları

## 🚀 Hızlı Başlangıç

### Seçenek 1: Script Kullanarak (Önerilen)

**Linux/Mac:**
```bash
chmod +x build-apk.sh
./build-apk.sh
```

**Windows:**
```cmd
build-apk.bat
```

### Seçenek 2: Manuel Derleme

#### Debug APK (Test için)
```bash
./gradlew assembleDebug
```
**Çıktı:** `app/build/outputs/apk/debug/app-debug.apk`

#### Release APK (Yayınlamak için)
```bash
./gradlew assembleRelease
```
**Çıktı:** `app/build/outputs/apk/release/app-release.apk`

---

## 📋 Sistem Gereksinimleri

- ✅ Android SDK 21+ (API 21)
- ✅ Android Build Tools 34.0.0+
- ✅ Java 11 veya daha yeni
- ✅ Gradle 7.4.2+

---

## 🔧 Ön Yapılandırma

### 1. Android SDK'yı Kurun

**Android Studio aracılığıyla:**
1. File → Settings → Appearance & Behavior → System Settings → Android SDK
2. "SDK Platforms" sekmesinden API 34 seçin
3. "SDK Tools" sekmesinden şunları seçin:
   - Android SDK Build-Tools 34.0.0
   - Android Emulator
   - Android SDK Platform-Tools

### 2. JAVA_HOME Ayarlayın

**Windows:**
```cmd
setx JAVA_HOME "C:\Program Files\Android\Android Studio\jbr"
```

**Linux/Mac:**
```bash
export JAVA_HOME=/usr/libexec/java_home -v 11
```

### 3. Gradle Wrapper İzni (Linux/Mac)
```bash
chmod +x gradlew
```

---

## 📦 APK Dosyaları

| Dosya | Konum | Boyut | Kullanım |
|-------|-------|-------|----------|
| **Debug APK** | `app/build/outputs/apk/debug/app-debug.apk` | ~50MB | Geliştirme ve test |
| **Release APK** | `app/build/outputs/apk/release/app-release.apk` | ~30MB | Play Store'a yükleme |

---

## 🎯 APK Yükleme

### Android Emülatör'e Yükleme

```bash
adb install app/build/outputs/apk/debug/app-debug.apk
```

### Fiziksel Cihaza Yükleme

1. USB Hata Ayıklama'yı etkinleştirin (Ayarlar → Geliştirici Seçenekleri)
2. USB ile bilgisayara bağlayın
3. Çalıştırın:
```bash
adb install app/build/outputs/apk/debug/app-debug.apk
```

---

## ⚙️ Derleme Seçenekleri

### Yalnızca Build Klasörünü Temizle
```bash
./gradlew clean
```

### Derlemeden Önce Temizle
```bash
./gradlew clean assembleDebug
```

### Detaylı Çıktı ile Derle
```bash
./gradlew assembleDebug --info
```

### Belirli Bir Varyanta Derle
```bash
./gradlew assembleDebug  # Debug
./gradlew assembleRelease # Release
```

---

## 🐛 Sorun Giderme

### Hata: "JAVA_HOME is not set"
```bash
# Linux/Mac
export JAVA_HOME=$(/usr/libexec/java_home -v 11)

# Windows
setx JAVA_HOME "C:\Program Files\Android\Android Studio\jbr"
```

### Hata: "Build tools not found"
```bash
./gradlew --version
# Güncel Gradle Wrapper'ı güncellemek gerekebilir
```

### Hata: "Insufficient storage"
```bash
# Gradle cache'i temizle
rm -rf ~/.gradle/caches
./gradlew clean build
```

### APK İmzalama Hatası
`app/build.gradle` dosyasındaki `signingConfig` ayarlarını kontrol edin:
```gradle
signingConfigs {
    release {
        storeFile file("keystore.jks")
        storePassword "123456"
        keyAlias "videoplayerkey"
        keyPassword "123456"
    }
}
```

---

## 📊 Derleme İstatistikleri

Derleme tamamlandıktan sonra aşağıdakileri kontrol edebilirsiniz:

```bash
# APK boyutunu kontrol et
ls -lh app/build/outputs/apk/debug/app-debug.apk

# APK içeriğini incelemek
unzip -l app/build/outputs/apk/debug/app-debug.apk
```

---

## 🚀 Devam Eden Geliştirme

### Live Reload ile Çalıştırma
```bash
./gradlew installDebug
adb shell am start -n com.example.videoplayersubtitles/.MainActivity
```

### Android Profiler ile Çalıştırma
```bash
./gradlew profileDebug
```

---

## 📝 Notlar

- **Debug APK**: İmzasız, hata ayıklama bilgisi içerir, geliştirme için uygundur
- **Release APK**: İmzalı, optimize edilmiş, Play Store'a yüklenebilir
- APK boyutunu azaltmak için ProGuard kuralları uygulanmıştır

---

**Son Güncelleme:** 2026-08-27
