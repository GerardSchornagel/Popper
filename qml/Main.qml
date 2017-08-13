import VPlay 2.0
import QtQuick 2.0
import "scenes"

GameWindow {
    id: window
    licenseKey: "FB9A2A644F4D76B6BECD0C3CFE1DB33EF16A3B69FC85DF78CB7488948F55A9B8DB6AEB9D26A778D83569B4B33B09EF96AF45A37296059593A358C28EC0938768D530D3F30FC67374C5F0C8A1C3343523D6D4DE76FB4302523EDAA0AFFBF2D0283CC68EE4993ACC98DCECD57434F6C22C800E26FAEA39469140358697A2A7BBEEAC7B51CB5B7B6366D54957602E6AEEE03F864ABB25C231668D5809D2FD20C2F841938E00450D3862C5E66A93C9A80A61D9690CBCAEBF86F366A851F32B88B15EFCC73721988533828ADFEB80E8468557A94407A627E5D2F24FBFD213AAF1BD68BCFC5DE422717DF365AE4B8317680E51DEA287C9B87C4440689F4412DADE36680498A7DB453D0E3FDE06648DF7E508F2ACD6F9540B3292E0E3801696EAE99EABBD3CD4F294E6DA2161B9A9E35943263D"
    screenWidth: 640
    screenHeight: 960

    PhysicsWorld {
        id: physicsWorld
        debugDrawVisible: false
        updatesPerSecondForPhysics: 60
        velocityIterations: 5
        positionIterations: 5
    }

    EntityManager {
        id: eManagerMenu
        entityContainer: sceneMenu
    }

    SceneMenu {
        id: sceneMenu
        onSignalNewGame: window.state = "game"
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
        onBackButtonPressed: window.state = "menu"
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
