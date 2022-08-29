$(function () {
    function display(bool) {
        var item = event.data;

        if (bool) {
            $(".fullscreen").show();
        } else {
            $(".fullscreen").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    document.onkeyup = function (data) {
        if (event.key == 'Escape') {
            $.post('https://DP_Hookers/exit');
        }
    };

    $('#close').click(function(){
        _type = "close";
        $.post(`https://DP_Hookers/exit`, JSON.stringify({type : _type}));
        return
    });
})

if(document.getElementById) {
    window.choice = function(data) {
        if(data === "blowjob") {
            _type = "blowjob";
            $.post(`https://DP_Hookers/blowjob`, JSON.stringify({type : _type}));
        }
        if(data === "blowjob2") {
            _type = "blowjob2";
            $.post(`https://DP_Hookers/blowjob2`, JSON.stringify({type : _type}));
        }
        if(data === "allinone") {
            _type = "allinone";
            $.post(`https://DP_Hookers/allinone`, JSON.stringify({type : _type}));
        }
    }
}

document.addEventListener("DOMContentLoaded", () => {
    document
        .querySelectorAll("[data-i18n-key]")
        .forEach(translateElement);
});

function translateElement(element) {
  const key = element.getAttribute("data-i18n-key");
  const translation = Locales[key];
  element.innerText = translation;
}