#!/bin/bash
# APK Derleme Scripti

echo "🚀 Android Video Player APK Derleme Başladı..."

# Debug APK Oluştur
echo ""
echo "📦 Debug APK oluşturuluyor..."
./gradlew assembleDebug

if [ $? -eq 0 ]; then
    echo "✅ Debug APK başarıyla oluşturuldu!"
    echo "📁 Konum: app/build/outputs/apk/debug/app-debug.apk"
else
    echo "❌ Debug APK oluşturma hatası!"
    exit 1
fi

# Release APK Oluştur
echo ""
echo "📦 Release APK oluşturuluyor..."
./gradlew assembleRelease

if [ $? -eq 0 ]; then
    echo "✅ Release APK başarıyla oluşturuldu!"
    echo "📁 Konum: app/build/outputs/apk/release/app-release.apk"
else
    echo "❌ Release APK oluşturma hatası!"
    exit 1
fi

echo ""
echo "🎉 Tüm APK'lar başarıyla oluşturuldu!"
echo ""
echo "📋 APK Bilgileri:"
echo "  Debug:   app/build/outputs/apk/debug/app-debug.apk"
echo "  Release: app/build/outputs/apk/release/app-release.apk"
