$('#code').hide();
$('#keyframe-container').hide();

$(function () {
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.action === "open") {
            window.invokeNative('openUrl', item.data)
        }
    })
})