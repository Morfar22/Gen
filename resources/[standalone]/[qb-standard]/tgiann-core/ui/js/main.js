window.addEventListener('message', (event) => {
    switch(event.data.type) {
        case "contextOpen":
            const element = document.getElementById("context")
            element.classList.add("display");
            element.innerHTML = event.data.text;
            break;
        case "contextClose":
            document.getElementById("context").classList.remove("display");
            break;
    }
});