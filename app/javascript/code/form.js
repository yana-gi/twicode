const hljs = require('highlight.js/lib/common');

document.addEventListener('DOMContentLoaded', (event) => {
    hljs.highlightAll();
    let textarea = document.querySelector("#code_body");
    let precode = document.querySelector("pre code");

    textarea.addEventListener('input', highlight);

    function highlight() {
        precode.innerHTML = hljs.highlight(textarea.value, {language: 'ruby'}).value
        hljs.highlightAll();
    }
});
