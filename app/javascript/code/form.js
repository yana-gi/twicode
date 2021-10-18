const hljs = require('highlight.js/lib/common');
import html2canvas from 'html2canvas';

document.addEventListener('turbolinks:load', (event) => {

    const form = document.querySelector('form');
    const textarea = document.querySelector("#code_body");
    const precode = document.querySelector("pre code");
    const language = document.querySelector("#parse_language");
    const hidden_image_url = document.querySelector('#code_image_url')

    if (form) {
        precode.className = "ruby hljs language-ruby"

        textarea.addEventListener('input', highlight);
        language.addEventListener('change', highlight);

        form.addEventListener("submit", function (event) {
            event.preventDefault();
            getDataUrl().then((dataUrl) => {
                hidden_image_url.setAttribute('value', dataUrl);
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

    async function getDataUrl() {
        const canvas = await html2canvas(precode,{windowWidth:600, windowHeight:314})
        return canvas.toDataURL('image/jpeg')
    }
});
