const hljs = require('highlight.js/lib/common');

document.addEventListener('DOMContentLoaded', (event) => {
    hljs.highlightAll();
    let textarea = document.querySelector("#code_body");
    let precode = document.querySelector("pre code");
    let language = document.querySelector("#parse_language");

    textarea.addEventListener('input', highlight);
    language.addEventListener('change', highlight);

    function highlight() {
        precode.className = language.value
        precode.innerHTML = hljs.highlight(textarea.value, {language: language.value}).value
        hljs.highlightAll();
    }
});
