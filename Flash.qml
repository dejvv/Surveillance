import QtQuick 2.0

Item {
    Rectangle{
        id: flashy
        color: "black"
        opacity: 1.0
    }

    NumberAnimation {
        id: animateOpacity
        target: flashy
        properties: "opacity"
        from: 0.10
        to: 1.0
        duration: 1500
        loops: Animation.Infinite
    }

    Timer {
            interval: 1000; running: true
            onTriggered: {
                animateOpacity.start();
            }
    }
}
