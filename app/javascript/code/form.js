const hljs = require('highlight.js/lib/common');
import html2canvas from 'html2canvas';

document.addEventListener('turbolinks:load', (event) => {
    let textarea = document.querySelector("#code_body");
    let precode = document.querySelector("pre code");
    let language = document.querySelector("#parse_language");

    precode.className = "ruby hljs language-ruby"

    textarea.addEventListener('input', highlight);
    language.addEventListener('change', highlight);

    function highlight() {
        precode.className = language.value
        precode.innerHTML = hljs.highlight(textarea.value, {language: language.value}).value
        hljs.highlightAll();
    }
});
