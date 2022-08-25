let inVehicle = false
let staminaBarOn = true
let normalCompassOn = true
let stress = false
let minimap = false

$( document ).ready(function() {
    $.post('https://tgiann-hudv2/settings');
});

window.addEventListener('message', (event) => {
    if (event.data.action == "hudmenu" ){
        $(".hud-menu-container").css("display", "flex");
    } else if (event.data.action == "setting") {
        minimap = event.data.minimap

        if (minimap) {
            $(".mapoutline").fadeIn(50);
            if (staminaBarOn) { $("#stamina-bar").fadeOut(0); };
            $(".status-bar").animate({
                height: "2.1vh",
                "font-size": "1.1vh",
            }, 0, function() {
                $(".status-hud").animate({
                    left: "2.6vh",
                    width: "25.5vh",
                    bottom: "0.5vh",
                }, 500);
            });

            $(".street-text-compass").animate({
                height: "2.1vh",
                width: "2.1vh",
                "font-size": "1vh"
            }, 0, function(){
                $(".street-text").animate({
                    left: "28.1vh",
                    bottom: "0.5vh"
                }, 500);
            });
        }

        if (event.data.mph) {
            $(".km-s-text").html("MP\H")
        } else {
            $(".km-s-text").html("KM\H")
        }

        if (event.data.stress) {
            stress = true
            $("#stress-bar").fadeIn(0)
            $(".hud-checkbox-menu-container").append(`
                <div class="hud-menu-content">
                    <div class="hud-menu-content-setting">
                        <div class="hud-menu-content-setting-text">Stress</div>
                        <label class="switch">
                            <input type="checkbox" id="stressswitch" checked>
                            <span class="slider"></span>
                        </label>
                    </div>
                </div>
            `)
        } else {
            $("#stress-bar").fadeOut(0)
        }
    } else if (event.data.action == "ui") {
        if (event.data.show) {
            $(".container").fadeIn();
        } else {
            $(".container").fadeOut();
        }
    } else if (event.data.action == 'updateStatus') {
        for (let i = 0; i < event.data.data.length; i++) {
            const element = event.data.data[i];
            var val = element.percent
            var prop = element.name
            $("#"+prop).css("width", val+"%")
        }
    } else if (event.data.action == 'tick') {
        $("#heal").css("width", event.data.heal+"%")
        $("#zirh").css("width", event.data.zirh+"%")
        if (!inVehicle) {
            let oxyVal = event.data.oxy * 2.5
            if (oxyVal > 100 ) { oxyVal = 100 }
            if (oxyVal < 100) {
                $("#oxy").css("width", oxyVal+"%")
                $("#stamina-bar").fadeOut()
                $("#oxy-bar").fadeIn()
            } else {
                $("#stamina").css("width", event.data.stamina+"%")
                if (staminaBarOn) { $("#stamina-bar").fadeIn(); }
                $("#oxy-bar").fadeOut()
            }    
        }
        
    } else if (event.data.action == "compassv2") {
        $(".direction-tip2").find(".image-2").attr('style', 'transform: translate3d(' + calcHeading(event.data.direction) + 'px, 0px, 0px)');
        $(".street-sol").css("display", "flex");
        $(".street-sag").css("display", "flex");
        $(".direction-tip2").css("width", "100px");
        $(".street-sag").html(event.data.streetSag)
        $(".street-sol").html(event.data.streetSol)
    } else if (event.data.action == "carHud") {
        if (normalCompassOn) {
            $(".street-text-text").html(event.data.street)
            $(".street-text-compass").html(event.data.compass)
        }
        let fuel = event.data.fuel/3.57
        if (fuel > 28) { fuel = 28 }
        $(".fuel-dis").css("stroke-dasharray", fuel+", 180")
        if (fuel > 10) {
            $(".fuel-dis").css("stroke", "#fff")
        } else {
            $(".fuel-dis").css("stroke", "#ef5350")
        }
        carHudMiniIconOnOff("engine", event.data.engine)
        carHudMiniIconOnOff("light", event.data.light)
        carHudMiniIconOnOff("belt", event.data.belt, event.data.seatbeltmod)
        carHudMiniIconOnOff("cruise", event.data.cruise)
        if (event.data.engineHealth < 500) {
            $(".engine-error").css("color", "#ef5350")
        } else {
            $(".engine-error").css("color", "rgb(255 255 255 / 30%)")
        }
    } else if (event.data.action == "vehSpeed") {
        let htmlText = event.data.speed
        let textLength = event.data.speed.length
        if (textLength == 1) {
            htmlText = "<span style='color: rgb(255 255 255 / 30%);'>00</span>"+htmlText
        } else if (textLength == 2) {
            htmlText = "<span style='color: rgb(255 255 255 / 30%);'>0</span>"+htmlText
        }
        $(".km-s").html(htmlText)
        let speed = event.data.speed / 2
        if (speed > 164) {speed = 164 }
        $(".speed-dis").css("stroke-dasharray", speed+", 185")
    } else if (event.data.action == "inVeh") {
        if (event.data.data) {
            inVehicle = true
            $(".mapoutline").fadeIn(50);
            if (staminaBarOn) { $("#stamina-bar").fadeOut(0); };
            $(".status-bar").animate({
                height: "2.1vh",
                "font-size": "1.1vh",
            }, 0, function() {
                $(".status-hud").animate({
                    left: "2.6vh",
                    width: "25.5vh",
                    bottom: "0.5vh",
                }, 500);
            });

            $(".car-hud").fadeIn()
           
            $(".street-text-compass").animate({
                height: "2.1vh",
                width: "2.1vh",
                "font-size": "1vh"
            }, 0, function(){
                $(".street-text").animate({
                    left: "28.1vh",
                    bottom: "0.5vh"
                }, 500);
            });

        } else {
            inVehicle = false
            if (!minimap) {
                $(".mapoutline").fadeOut(50);
                if (staminaBarOn) { $("#stamina-bar").fadeIn(0); };
                $(".status-bar").animate({
                    height: "3.0vh",
                    "font-size": "1.4vh",
                }, 0, function() {
                    $(".status-hud").animate({
                        left: "1.8vh",
                        width: "32vh",
                        bottom: "2.0vh",
                    }, 500);
                });

                $(".street-text-compass").animate({
                    height: "3.0vh",
                    width: "3.0vh",
                    "font-size": "1.1vh"
                }, 0, function(){
                    $(".street-text").animate({
                        left: "1.8vh",
                        bottom: "6vh"
                    }, 500);
                });
            }

            $(".car-hud").fadeOut(500);
        }
    } else if (event.data.action == "clockStreet") {
        $(".street-text-text").html(event.data.street)
        $(".street-text-compass").html(event.data.compass)
    }
});

function carHudMiniIconOnOff(style, on, beltmode) {
    let color = "rgb(255 255 255 / 30%)"
    if (on == 1) {
        color = "#fff"
        if (beltmode) {
            color = "#629749"
        }
    }
    $("#car-"+style).css("color", color)
}

$(document).on("click", "#stamina-checkbox" ,function(e) {
    staminaBarOn = e.currentTarget.checked
    const elem = $("#stamina-bar")
    if (staminaBarOn) {
        if (!inVehicle) {elem.fadeIn(); }
    } else {
        elem.fadeOut();
    };
});

$(document).on("click", "#hungercheckbox" ,function(e) {
    const elem = $("#hunger-bar")
    if (e.currentTarget.checked) {
        elem.fadeIn();
    } else {
        elem.fadeOut();
    };
});

$(document).on("click", "#water" ,function(e) {
    const elem = $("#water-bar")
    if (e.currentTarget.checked) {
        elem.fadeIn();
    } else {
        elem.fadeOut();
    };
});

$(document).on("click", "#stressswitch" ,function(e) {
    const elem = $("#stress-bar")
    if (e.currentTarget.checked) {
        elem.fadeIn();
    } else {
        elem.fadeOut();
    };
});

let imageWidth = 100 // leave this letiable, related to pixel size of the directions
let containerWidth = 100 // width of the image container
let width =  0;
let south = (-imageWidth) + width
let west = (-imageWidth * 2) + width
let north = (-imageWidth * 3) + width
let east = (-imageWidth * 4) + width
let south2 = (-imageWidth * 5) + width

function calcHeading(direction) {
    if (direction < 90) {
        return lerp(north, east, direction / 90)
    } else if (direction < 180) {
        return lerp(east, south2, rangePercent(90, 180, direction))
    } else if (direction < 270) {
        return lerp(south, west, rangePercent(180, 270, direction))
    } else if (direction <= 360) {
        return lerp(west, north, rangePercent(270, 360, direction))
    }
}
 
function rangePercent(min, max, amt) {
    return (((amt - min) * 100) / (max - min)) / 100
}

function lerp(min, max, amt) {
    return (1 - amt) * min + amt * max
}

$(document).on("click", ".hud-menu-header-close" ,function(e) {
    $(".hud-menu-container").css("display", "none");
    $.post('https://tgiann-hudv2/hudmenuclose');
});

$(document).on("click", "#blackbar" ,function(e) {
    if (e.currentTarget.checked) {
        $(".container").fadeOut()
        $(".voice").fadeOut()
        $(".blackbar-container").css("display", "flex")
    } else {
        $(".container").fadeIn()
        $(".voice").fadeIn()
        $(".blackbar-container").css("display", "none")
    };
    $.post('https://tgiann-hudv2/blackbar', JSON.stringify({status: e.currentTarget.checked}) );
});

$(document).on("click", "#compass" ,function(e) {
    normalCompassOn = !e.currentTarget.checked
    if (normalCompassOn) {
        $(".tepe-hud").css("display", "none");
        $(".street-text").fadeIn();
    } else {
        $(".tepe-hud").css("display", "flex");
        $(".street-text").fadeOut();
    };
    $.post('https://tgiann-hudv2/compass', JSON.stringify({status: normalCompassOn}) );
});