import VPlay 2.0
import QtQuick 2.0
import QtMultimedia 5.0
import "scenes"
import "common"
import "levels"

GameWindow {
    id: window
    licenseKey: "C95BA0FD2E4B099811E0325A2A77CD58A827D4B2EF4E75B692D0B776DE7ED31A41657E9A9AD9D0BEA4086356E422BD56EDF158261BB6ACD10331C0E6E02739CE5330A76A608E565F6C5E2412BEEEB85E06405E2EC14C12A38ECE8392802AF0C1525AE6DAB1D4EE8182FDFF0519F85DD19A8D3BDF847A92AA8EEEBAC4254A8E9B564E4E6CCCC7EBF714B7CD4458C61624C1A9E83687C5B237184F9B29FEB0805E810CDCA376EB4769C00CC0E30085483488013491DE26629EFDB9118346544BCD47848A587B28CA56B209CA50B90D87BE31B9DC78E4DBED736B79477AE02578235F601291080C9C1D9A71974E6895648923A56BD3345A744200C103B04558A27BEB7F84E3E2482951337C3D6D176252B0FA597DFDFFB276EB25D3D06B0D15EB7B66214138975B6B192B67F9A5042CC509"
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

    CurrentLevel { id: currentLevel }

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
