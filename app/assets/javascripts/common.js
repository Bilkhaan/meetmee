$(document).ready(function() {
  $(".cloudinary-fileupload")
    .fileupload({ 
      disableImageResize: false,
      imageMaxWidth: 800,
      imageMaxHeight: 600,
      acceptFileTypes: /(\.|\/)(gif|jpe?g|png|bmp|ico)$/i,
      maxFileSize: 2000000,
      dropZone: "#direct_upload",
      start: function (e) {
        $(".status").text("Starting upload...");
      },
      progress: function (e, data) {
        $(".status").text("Uploading... " + Math.round((data.loaded * 100.0) / data.total) + "%");
      },
      fail: function (e, data) {
        $(".status").text("Upload failed");
      }
    })
    .off("cloudinarydone").on("cloudinarydone", function (e, data) {
      $("#photo_bytes").val(data.result.bytes);
      $(".status").text("");
      var preview = $(".preview").html('');
      width = ($("#portfolio-form").length > 0) ? 300 : 200
      height = ($("#portfolio-form").length > 0) ? 300 : 200 
      $.cloudinary.image(data.result.public_id, {
        format: data.result.format, width: width, height: height, crop: "fit"
      }).appendTo(preview);
    });
  });
