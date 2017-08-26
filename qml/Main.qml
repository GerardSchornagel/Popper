import VPlay 2.0
import QtQuick 2.0
import QtMultimedia 5.0
import "scenes"
import "common"

GameWindow {
    id: window
    licenseKey: "8021D42E8ED7CA1D26C97E7286B89D98A6C0280F2F035B7ADE464A49D3C3CE89AEACF55B9B158D454D5632B40AAC22DF6EC682CBE003901524566AF2108B22A307C2FA546E09DB04062D0050908C86F48A1547E696AD66CB21C8DA69A91F9AC10C726108D65948F12614745CEBAB6D80388DC214BFBD175F6C75FF6BB78B3DC9052E0DF82AFDC8497144F9896F7A560E14DF46DD1178CAC0DDE93CF142AA82DAC552A91C044ECBBE6AD11E7B184C58C6278129118DE861652955A0B694E81837A0353E5E65798867643D4988611AF459C13ABF2D9E335F04C5C786E129C62F89DC9C5ACD19A29C00D0D4FA4D9469E6A0797D79BC7B2BBCCE9AFC24322F98507ED26E9AACC15F0AEE3B82ADEC6B65D9F5E06335B5E39F1E6CFEDC0B24356E5C7CD1F4E06E72A90218D6C42F73FFA98EFE"
    screenWidth: 640
    screenHeight: 960

    PhysicsWorld {
        id: physicsWorld
        debugDrawVisible: false
        updatesPerSecondForPhysics: 60
        velocityIterations: 5
        positionIterations: 5
    }

    SoundSFX { id: sfx }

    SoundBGM { id: bgm }

    EntityManager {
        id: eManagerMenu
        entityContainer: sceneMenu
    }

    SceneMenu {
        id: sceneMenu
        onSignalNewGame: {
            window.state = "game"
            bgm.menu()
            bgm.level01()
        }

        onSignalMusic: { bgm.mute() }
        onSignalSound: { sfx.mute() }
        onBackButtonPressed: { nativeUtils.displayMessageBox(qsTr("Really quit the game?"), "", 2) }

        // Messagebox Handler
        Connections {
            target: nativeUtils
            onMessageBoxFinished: { if(accepted && window.activeScene === sceneMenu) {Qt.quit()} }
        }
    }

    // game scene to play a level
    SceneGame {
        id: sceneGame
        onBackButtonPressed: {
            window.state = "menu"
            bgm.level01()
            bgm.menu()
        }
    }

    // menuScene is our first scene, so set the state to menu initially
    state: "menu"
    activeScene: sceneMenu

    // state machine, takes care reversing the PropertyChanges when changing the state, like changing the opacity back to 0
    states: [
        State {
            name: "menu"
            PropertyChanges {target: sceneMenu; opacity: 1}
            PropertyChanges {target: window; activeScene: sceneMenu}
        },
        State {
            name: "game"
            PropertyChanges {target: sceneGame; opacity: 1}
            PropertyChanges {target: window; activeScene: sceneGame}
        }
    ]
}
