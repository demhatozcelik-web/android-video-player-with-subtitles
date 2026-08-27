@echo off
REM ============================================================
REM   Android Video Player APK - Otomatik Derleme ve İndirme
REM ============================================================

setlocal enabledelayedexpansion

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║                                                        ║
echo ║   🚀 Android Video Player APK Derleyici               ║
echo ║                                                        ║
echo ║   Video Oynatıcı + Senkronize Altyazı                 ║
echo ║                                                        ║
echo ╚════════════════════════════════════════════════════════╝
echo.

REM Check Java
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ HATA: Java kurulu değil!
    echo 💡 Lütfen Java 11+ yükleyin: https://www.oracle.com/java/technologies/downloads/
    pause
    exit /b 1
)

echo ✅ Java kontrol edildi
echo.

REM Clean build
echo 🧹 Build klasörü temizleniyor...
call gradlew.bat clean

if %errorlevel% neq 0 (
    echo ❌ Clean işlemi başarısız!
    pause
    exit /b 1
)

REM Build Debug APK
echo.
echo 🔨 Debug APK derleniyorsa...
echo ⏳ Bu birkaç dakika sürebilir...
echo.

call gradlew.bat assembleDebug

if %errorlevel% neq 0 (
    echo.
    echo ❌ HATA: Debug APK derleme başarısız!
    echo.
    echo 💡 Sorun Giderme İpuçları:
    echo    1. Internet bağlantısını kontrol edin
    echo    2. Gradle cache'i temizleyin: gradlew.bat --stop
    echo    3. Komutu admin olarak çalıştırmayı deneyin
    echo.
    pause
    exit /b 1
)

REM Build Release APK
echo.
echo 📦 Release APK derleniyorsa...
echo ⏳ Bu birkaç dakika sürebilir...
echo.

call gradlew.bat assembleRelease

if %errorlevel% neq 0 (
    echo.
    echo ⚠️  UYARI: Release APK derleme başarısız
    echo    Debug APK başarıyla oluşturuldu, onu kullanabilirsiniz
    echo.
)

REM Success message
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║                                                        ║
echo ║           ✅ APK DERLEMESİ BAŞARILI!                   ║
echo ║                                                        ║
echo ╚════════════════════════════════════════════════════════╝
echo.

echo 📋 OLUŞTURULAN APK DOSYALARI:
echo.
echo   📁 Debug APK (Test İçin):
echo      📍 app\build\outputs\apk\debug\app-debug.apk
echo.

if exist "app\build\outputs\apk\release\app-release.apk" (
    echo   📁 Release APK (Yayınlamak İçin):
    echo      📍 app\build\outputs\apk\release\app-release.apk
    echo.
)

echo.
echo 🎯 SONRAKI ADIMLAR:
echo.
echo   1️⃣  APK dosyasını Android cihazınıza kopyalayın
echo   2️⃣  Cihazda "Bilinmeyen kaynaklar"dan kuruluma izin verin
echo       (Ayarlar → Güvenlik → Bilinmeyen Kaynaklar)
echo   3️⃣  APK dosyasına dokunun ve "Kur" seçeneğini tıklayın
echo.

echo 💻 EMÜLATÖR'E YÜKLEMEK İÇİN:
echo.
echo   adb install app\build\outputs\apk\debug\app-debug.apk
echo.

echo ═══════════════════════════════════════════════════════════
echo.

pause
