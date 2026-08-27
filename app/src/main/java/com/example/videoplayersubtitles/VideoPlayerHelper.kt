package com.example.videoplayersubtitles

import android.net.Uri
import androidx.media3.exoplayer.ExoPlayer
import java.io.File

/**
 * Video oynatıcı yardımcı sınıfı - tüm video işlemlerini yönetir
 */
class VideoPlayerHelper(private val exoPlayer: ExoPlayer) {

    private val subtitleManager = SubtitleManager(exoPlayer.applicationContext)

    /**
     * Video ve altyazıyı yükle ve oynat
     */
    fun playVideoWithSubtitles(
        videoUri: Uri,
        subtitleUri: Uri,
        autoPlay: Boolean = true
    ) {
        subtitleManager.loadVideoWithSubtitles(videoUri, subtitleUri, exoPlayer = exoPlayer)
        if (autoPlay) {
            exoPlayer.play()
        }
    }

    /**
     * Lokal dosya oynat
     */
    fun playLocalVideo(
        videoFile: File,
        subtitleFile: File? = null
    ) {
        if (subtitleFile != null) {
            subtitleManager.loadLocalSubtitles(videoFile, subtitleFile, exoPlayer)
        } else {
            exoPlayer.setMediaItem(
                androidx.media3.common.MediaItem.fromUri(Uri.fromFile(videoFile))
            )
            exoPlayer.prepare()
            exoPlayer.play()
        }
    }

    /**
     * Oynatıcı durumunu kontrol et
     */
    fun isPlaying(): Boolean = exoPlayer.isPlaying

    /**
     * Mevcut pozisyon al (milisaniye)
     */
    fun getCurrentPosition(): Long = exoPlayer.currentPosition

    /**
     * Video süresini al (milisaniye)
     */
    fun getDuration(): Long = exoPlayer.duration

    /**
     * Oynatıcı kontrollerini göster/gizle
     */
    fun showControls(show: Boolean) {
        // PlayerView kontrollerini yönet
    }

    /**
     * Oynatıcıyı serbest bırak
     */
    fun release() {
        if (!exoPlayer.isReleased) {
            exoPlayer.release()
        }
    }
}
