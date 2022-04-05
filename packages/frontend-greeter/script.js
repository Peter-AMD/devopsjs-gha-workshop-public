const LAMBDA_URL = 'API_URL_CHANGEME/greeter' // Changed at build time (value from TF output)

const memeContainer = document.querySelector('.meme-container');
const greetingMessage = document.querySelector('.greetings');

function setMainContent (data) {
    memeContainer.innerHTML = `<img src="./assets/memes/powerGHA.jpeg" alt="Meme about GHA"/>`
    greetingMessage.innerHTML = data.message + "!"
}

fetch(LAMBDA_URL)
    .then((response) => response.json())
    .then(setMainContent);

