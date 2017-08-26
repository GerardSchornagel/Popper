import QtQuick 2.0
import VPlay 2.0

Item {
    property int intLevel: 1

    property variant arrayEncounters: []
    property int intGoal: 1
    property int intSpeed: 1

    Level01 { id: level01 }
    Level02 { id: level02 }
    Level03 { id: level03 }
    Level04 { id: level04 }

    function setLevel(val) {
        intLevel = val
        if (intLevel === 1) {
            arrayEncounters = level01.arrayEntityType
            intGoal = level01.intGoal
            intSpeed = level01.intSpeed
        }
        if (intLevel === 2) {
            arrayEncounters = level02.arrayEntityType
            intGoal = level02.intGoal
            intSpeed = level02.intSpeed
        }
        if (intLevel === 3) {
            arrayEncounters = level03.arrayEntityType
            intGoal = level03.intGoal
            intSpeed = level03.intSpeed
        }
        if (intLevel === 4) {
            arrayEncounters = level04.arrayEntityType
            intGoal = level04.intGoal
            intSpeed = level04.intSpeed
             }

    }
}
