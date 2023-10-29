let myCanvas;
let myConfetti;

let winnerSound = new Audio("./sounds/winner.ogg");
let loserSound = new Audio("./sounds/loser.ogg");

let beepSound = new Audio("./sounds/beep.ogg");
let beepGoSound = new Audio("./sounds/beep_go.ogg");

window.onload = () => {
    myCanvas = document.getElementById("confetti");

    myConfetti = window.confetti.create(myCanvas, {
        resize: true,
        useWorker: true
    });

    // Locale setup
    document.getElementById("winner-text").innerHTML = LOCALES.win;
    document.getElementById("loser-text").innerHTML = LOCALES.lose;

    document.getElementById("loser-text").dataset.text = LOCALES.lose;

    document.getElementById("game-start").innerHTML = LOCALES.instructions_start;
    document.getElementById("game-play").innerHTML = `${LOCALES.instructions_play[0]} ${LOCALES.instructions_play[1]} ${LOCALES.instructions_play[2]}`;
    document.getElementById("game-leave").innerHTML = LOCALES.instructions_leave;
}

function fire(){
    myConfetti({
        particleCount: Math.floor(Math.random() * (300 - 100 + 1) + 100),
        spread: Math.floor(Math.random() * (500 - 200 + 1) + 200)
    });
}
let confettiInterval;
window.addEventListener("message", (e) => {
    if(e.data.do_ == "victory"){
        let fire_interval = (e.data.fire_interval)?e.data.fire_interval:1000;
        let stop_confetti = (e.data.stop_confetti)?e.data.stop_confetti:5000;
        let volume = (e.data.volume)?e.data.volume:0.2;
        let close_after = e.data.close_after?e.data.close_after:5000;

        showInfo();

        document.getElementById("winner-screen").style.display = "flex";
        
        winnerSound.volume = volume;
        winnerSound.play();

        confettiInterval = setInterval(() => {
            fire();
        }, fire_interval);

        setTimeout(() => {
            clearInterval(confettiInterval);
        }, stop_confetti);

        setTimeout(() => {
            exit();
        }, close_after);

        document.getElementById("game-play").innerHTML = `${LOCALES.instructions_play[0]} ${LOCALES.instructions_play[1]} ${LOCALES.instructions_play[2]}`;
        
    } else if(e.data.do_ == "defeat"){

        let volume = (e.data.volume)?e.data.volume:0.2;
        let close_after = e.data.close_after?e.data.close_after:5000;
        
        showInfo();

        document.getElementById("loser-screen").style.display = "flex";

        loserSound.volume = volume;
        loserSound.play();

        setTimeout(() => {
            exit();
        }, close_after);

        document.getElementById("game-play").innerHTML = `${LOCALES.instructions_play[0]} ${LOCALES.instructions_play[1]} ${LOCALES.instructions_play[2]}`;

    } else if(e.data.do_ == "countdown"){
        showInfo("play");

        let cs = document.getElementById("countdown-screen");
        cs.style.display = "flex";

        let number = document.getElementById("countdown-number");
        let start = (e.data.start)?e.data.start:3;
        let end = (e.data.end)?e.data.end:1;

        let volume = (e.data.volume)?e.data.volume:0.2;

        beepGoSound.volume = volume;
        beepSound.volume = volume;

        let current = start + 1;

        number.innerText = start;

        let interval = setInterval(() => {
            if(current == end){

                number.innerText = LOCALES.go;

                clearInterval(interval);

                beepGoSound.currentTime = 0;
                beepGoSound.play();

                setTimeout(() => {
                    cs.style.display = "none";
                }, 1000);

                // Send notification that the countdown is complete
                fetch('https://'+GetParentResourceName()+'/countdowncomplete', {
                    method:"POST",
                    body: JSON.stringify({ok:true}),
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }).catch(()=>{});

            } else {
                number.innerText = --current;
                beepSound.currentTime = 0;
                beepSound.play();
            }
        }, 1000);
    } else if(e.data.do_ == "start_instructions"){
        showInfo("start");
        document.getElementById("game-play").innerHTML = `${LOCALES.instructions_play[0]} <kbd>${e.data.key}</kbd> ${LOCALES.instructions_play[2]}`;
    } else if(e.data.do_ == "close_instructions"){
        showInfo();
    } else if(e.data.do_ == "leave_instructions"){
        showInfo("leave");
    } else if(e.data.do_ == "updatekey"){
        document.getElementById("game-play").classList.add("keychange");
        document.getElementById("game-play").innerHTML = `${LOCALES.instructions_play[0]} <kbd>${e.data.key}</kbd> ${LOCALES.instructions_play[2]}`;

        setTimeout(() => {
            document.getElementById("game-play").classList.remove("keychange")
        }, 1000)
        
    }
});

function exit(){
    // Close everything
    winnerSound.pause();
    winnerSound.currentTime = 0;

    loserSound.pause();
    loserSound.currentTime = 0;

    clearInterval(confettiInterval);
    myConfetti.reset();

    document.getElementById("winner-screen").style.display = "none";
    document.getElementById("loser-screen").style.display = "none";

    // Send notification that they exited
    fetch('https://'+GetParentResourceName()+'/exit', {
        method:"POST",
        body: JSON.stringify({ok:true}),
        headers: {
            'Content-Type': 'application/json'
        }
    }).catch(()=>{});
}

function showInfo(type){
    if(type == "start"){
        document.getElementById("game-start").classList.add("show");
        document.getElementById("game-play").classList.remove("show");
        document.getElementById("game-leave").classList.remove("show");
    } else if(type == "play"){
        document.getElementById("game-play").classList.add("show");
        document.getElementById("game-start").classList.remove("show");
        document.getElementById("game-leave").classList.remove("show");
    } else if(type == "leave") {
        document.getElementById("game-play").classList.remove("show");
        document.getElementById("game-start").classList.remove("show");
        document.getElementById("game-leave").classList.add("show");
    } else {
        document.getElementById("game-play").classList.remove("show");
        document.getElementById("game-start").classList.remove("show");
        document.getElementById("game-leave").classList.remove("show");
    }
}