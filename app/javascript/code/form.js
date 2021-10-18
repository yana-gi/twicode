const hljs = require('highlight.js/lib/common');
import html2canvas from 'html2canvas';

document.addEventListener('turbolinks:load', (event) => {
    let textarea = document.querySelector("#code_body");
    let precode = document.querySelector("pre code");
    let language = document.querySelector("#parse_language");
    let hidden_image_url = document.querySelector('#code_image_url')

    precode.className = "ruby hljs language-ruby"

    textarea.addEventListener('input', highlight);
    language.addEventListener('change', highlight);

    function highlight() {
        precode.className = language.value
        precode.innerHTML = hljs.highlight(textarea.value, {language: language.value}).value
        hljs.highlightAll();
    }

    const form = document.querySelector('form');
    form.addEventListener("submit", function (event) {
        event.preventDefault();
        getDataUrl().then((dataUrl) => {
            hidden_image_url.setAttribute('value', dataUrl);
        }).then(() => {
            form.submit();
        })
    });

    async function getDataUrl() {
        const canvas = await html2canvas(precode,{windowWidth:600, windowHeight:314})
        return canvas.toDataURL('image/jpeg')
    }
});
