import QtMultimedia 5.5
import QtQuick 2.6
import QtQuick.Layouts 1.0
import Qt.labs.platform 1.0
import QtQuick.Controls 2.2
import "MyConstants.js" as Constants


Video {
    property string source_v : ""
    property int currentSwipeIndex: 0
    id: video
    //width : parent.width
    //height : parent.height
    width: metaData.resolution ? metaData.resolution.width : 640
    height: metaData.resolution ? metaData.resolution.height : 360
    source: source_v === "" ? "file:///Volumes/Space/Documents/Faks/2.letnik/UV/Projekt/video-samples/bunny.mp4" : source_v
    focus: true
    //anchors.centerIn: parent;
    MouseArea {
        anchors.fill: parent
        onClicked: {
//            video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
//            Constants.video_playback = !Constants.video_playback;
//            console.log("[Video] is playing: ", Constants.video_playback);
//            video.seek(video.position + 5000)
        }
    }

    onStateChanged: {
        if (video.state === "play"){
            video.play()
            Constants.video_playback = true
        } else if (video.state === "pause") {
            video.pause()
            Constants.video_playback = false
        }
        console.log("[Video] is playing: ", Constants.video_playback);
    }

    states: [
        State {
            name: "play"
            PropertyChanges { target: video;}
        },
        State {
            name: "pause"
            PropertyChanges { target: video; }
        }

    ]

//    onVisibleChanged:  {
//        console.log("[ChooseVideo] video_playback", Constants.video_playback);
//    }

    Keys.onPressed: {
        console.log(event.key)
        if(event.key === Qt.Key_Space){
            video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
            console.log("[key pressed] space pressed")
            event.accepted = true;
        } else if(event.key === Qt.Key_Left){
            video.seek(video.position - 5000)
            console.log("[key pressed] left pressed")
            event.accepted = true;
        } else if(event.key === Qt.Key_Right){
            console.log("[key pressed] right pressed")
            video.seek(video.position + 5000)
            event.accepted = true;
        }
    }
}



