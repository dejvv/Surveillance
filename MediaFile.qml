import QtMultimedia 5.5
import QtQuick 2.6
import QtQuick.Layouts 1.0
import Qt.labs.platform 1.0
import QtQuick.Controls 2.2
import "MyConstants.js" as Constants

Item {
    property string source_v : ""
    property string source_i : ""
    property int sWidth: 100
    property int sHeight: 100
    property alias stejt: video.state
    property alias visible_i: image.visible
    property alias vid: video
    width: sWidth
    height: sHeight
    Video {

        id: video
        //width : parent.width
        //height : parent.height
        width: metaData.resolution ? metaData.resolution.width : sWidth
        height: metaData.resolution ? metaData.resolution.height : sHeight
        source: source_v === "" ? "file:///Volumes/Space/Documents/Faks/2.letnik/UV/Projekt/video-samples/bunny.mp4" : source_v
        focus: true
//        anchors.centerIn: parent;
        anchors.left: parent.left
        anchors.top: parent.top
//        anchors.bottom: parent.bottom
//        Rectangle {
//            color: "blue"
//            opacity: 0.5
//            width: parent.width
//            height: parent.height
//            anchors.centerIn: parent
//        }

        onStateChanged: {
            if (video.state === "play"){
                video.play()
//                Constants.video_playback = true
                console.log("[MediaFile] is playing:");
            } else if (video.state === "pause") {
                video.pause()
//                Constants.video_playback = false
                console.log("[MediaFile] is paused:");
            }else if (video.state === "stop") {
                video.stop()
//                Constants.video_playback = false

                console.log("[MediaFile] has stopped:");
            }
        }

        states: [
            State {
                name: "play"
                PropertyChanges { target: video;}
            },
            State {
                name: "pause"
                PropertyChanges { target: video; }
            },
            State {
                name: "stop"
                PropertyChanges { target: video; }
            }

        ]

    }

    Image{
        id: image
        fillMode: Image.PreserveAspectFit
        width: sWidth
        height: sHeight
//        anchors.centerIn: parent
        source: source_i === "" ? "files/images/home.png" : source_i
        visible: false
        anchors.left: parent.left
        anchors.top: parent.top
    }
}





