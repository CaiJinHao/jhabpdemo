"use strict";

function Camera() {
  let video = document.querySelector("#face_vidio");

  return {
    IsPlay: false,
    mediaStream:{},
    openMedia: function (options) {
      let _the = this;
      if(_the.IsPlay){
        return;
      }
      //请求媒体选项
      let requestMediaOptions = {
        video: true,
        audio: false,
      };
      navigator.mediaDevices
        .getUserMedia(requestMediaOptions)
        .then(function (mediaStream) {
          console.log('openMedia');
          _the.mediaStream = mediaStream;
          video.srcObject = mediaStream;
          // video.onloadedmetadata = function (e) {
          //   video.play();
          // };
          _the.IsPlay = true;
        })
        .catch(function (error) {
          console.log(error.name + ":" + error.message);
          let message = "";
          switch (error.name) {
            case "AbortError":
              message =
                "尽管用户和操作系统都授予了访问设备硬件的权利，而且未出现可能抛出NotReadableError异常的硬件问题，但仍然有一些问题的出现导致了设备无法被使用";
              break;
            case "NotAllowedError":
              message =
                "用户拒绝了当前的浏览器实例的访问请求；或者用户拒绝了当前会话的访问；或者用户在全局范围内拒绝了所有媒体访问请求。";
              break;
            case "NotFoundError":
              message = "找不到满足请求参数的媒体类型";
              break;
            case "NotReadableError":
              message =
                "尽管用户已经授权使用相应的设备，操作系统上某个硬件、浏览器或者网页层面发生的错误导致设备无法被访问";
              break;
            case "OverconstrainedError":
              message = "指定的要求无法被设备满足";
              break;
            case "SecurityError":
              message = "使用设备媒体被禁止";
              break;
            case "TypeError":
              message = "constraints 对象未设置［空］，或者都被设置为false";
              break;
            default:
              break;
          }
          alert(message);
        });
    },
    closeMedia: function () {
      let _the = this;
      if (_the.IsPlay) {
        console.log('closeMedia');
        _the.mediaStream.getTracks().forEach(function (item) {
          item.stop();
        });
      }
      _the.IsPlay = false;
    },
    takePhoto: function () {
      let _the = this;
      if (!_the.IsPlay) {
        throw "没有打开摄像头";
      }
      let width = video.videoWidth;
      let height = video.videoHeight;
      let canvas = document.createElement("canvas");
      canvas.width = width;
      canvas.height = height;
      let ctx = canvas.getContext("2d");
      ctx.drawImage(video, 0, 0, width, height);
      return canvas.toDataURL();
    },
  };
}

let camera = new Camera();
// camera.openMedia();

document.querySelector("#btn_capture").addEventListener("click", function (e) {
  try {
    var data = camera.takePhoto();
    console.log(data);
    document.querySelector("#capture_img").src = data;
  } catch (error) {
    console.log(error);
  }
});

window.addEventListener("beforeunload", function (e) {
  e.preventDefault();
  camera.closeMedia();
  e.returnValue='';//提示是否刷新
});

document.querySelector('#btn_open').addEventListener('click',function(e){
  camera.openMedia();
});

document.querySelector('#btn_close').addEventListener('click',function(e){
  camera.closeMedia();
});