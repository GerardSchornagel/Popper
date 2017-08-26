import QtQuick 2.0
import VPlay 2.0

Item {
    property bool boolMuted: false

    function mute() {
        if (boolMuted === false) {
            boolMuted = true
            bgmLevel01.muted = true
            bgmMenu.muted = true
        } else {
            boolMuted = false
            bgmLevel01.muted = false
            bgmMenu.muted = false
        }
    }

    function level01() {
        if (bgmLevel01.playing === false) {
            bgmLevel01.play()
        } else {
            bgmLevel01.stop()
        }
    }

    function menu() {
        if (bgmMenu.playing === false) {
            bgmMenu.play()
        } else {
            bgmMenu.stop()
        }
    }

    BackgroundMusic {
        id: bgmLevel01
        source: "../../assets/snd/music/level1.wav"
        autoPlay: false
    }

    BackgroundMusic {
        id: bgmMenu
        source: "../../assets/snd/music/menu.wav"
        autoPlay: true
    }
}
