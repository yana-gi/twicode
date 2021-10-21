const hljs = require('highlight.js/lib/common');
import html2canvas from 'html2canvas';

document.addEventListener('turbolinks:load', (event) => {

    const form = document.querySelector('form');
    const textarea = document.querySelector("#code_body");
    const precode = document.querySelector("pre code");
    const language = document.querySelector("#parse_language");
    const hiddenImageDataUrl = document.querySelector('#code_image_data_url');

    if (precode) {
        hljs.highlightAll();
    }
    if (form) {
        precode.className = "ruby hljs language-ruby"

        textarea.addEventListener('input', highlight);
        language.addEventListener('change', highlight);

        form.addEventListener("submit", function (event) {
            event.preventDefault();
            getImageDataUrl().then((imageDataUrl) => {
                hiddenImageDataUrl.setAttribute('value', imageDataUrl);
            }).then(() => {
                form.submit();
            })
        });
    }

    function highlight() {
        precode.className = language.value
        precode.innerHTML = hljs.highlight(textarea.value, {language: language.value}).value
        hljs.highlightAll();
    }

    async function getImageDataUrl() {
        const canvas = await html2canvas(precode,{windowWidth:600, windowHeight:314})
        return canvas.toDataURL('image/jpeg', 1.0)
    }
});
