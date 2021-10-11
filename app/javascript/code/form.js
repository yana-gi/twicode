const hljs = require('highlight.js/lib/core');

document.addEventListener('DOMContentLoaded', (event) => {
    hljs.highlightAll();
    let textarea = document.querySelector("#code_body");
    let precode = document.querySelector("pre code");

    textarea.addEventListener('input', highlight);
    function highlight() {
        precode.innerText = textarea.value;
        hljs.highlightElement(precode);
    }
});
