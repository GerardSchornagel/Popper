import QtQuick 2.0
import VPlay 2.0

Item {
    property bool boolMuted: false

    function mute() {
        if (boolMuted === false) {
            boolMuted = true
            sfxWeaponFire01.muted = true
            sfxTargetExplosion.muted = true
        } else {
            boolMuted = false
            sfxWeaponFire01.muted = false
            sfxTargetExplosion.muted = false
        }
    }


    function weaponFire01() {
        sfxWeaponFire01.play()
    }

    function targetExplosion() {
        timerTargetExplosion.start()
    }

    SoundEffectVPlay {
        id: sfxWeaponFire01
        source: "../../assets/snd/sfx/weaponFire01.wav"
        loops: 1
    }

    SoundEffectVPlay {
        id: sfxTargetExplosion
        source: "../../assets/snd/sfx/explosion.wav"
        loops: 1
    }

    Timer {
        id: timerTargetExplosion
        running: false
        repeat: false
        interval: 125

        onTriggered: { sfxTargetExplosion.play() }
    }
}
