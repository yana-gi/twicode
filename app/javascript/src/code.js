import html2canvas from "html2canvas";
const hljs = require("highlight.js/lib/common");

document.addEventListener("turbolinks:load", () => {
  const form = document.querySelector("form");
  const textarea = document.querySelector("#code_body");
  const precode = document.querySelector("pre code");
  const language = document.querySelector("#parse_language");
  const hiddenImageDataUrl = document.querySelector("#code_image_data_url");

  if (precode) {
    precode.className = language.innerHTML;
    hljs.highlightAll();
  }
  if (form) {
    precode.className = "hljs language-PlainText";

    textarea.addEventListener("input", highlight);
    language.addEventListener("change", highlight);

    form.addEventListener("submit", function (event) {
      event.preventDefault();
      getImageDataUrl()
        .then((imageDataUrl) => {
          hiddenImageDataUrl.setAttribute("value", imageDataUrl);
        })
        .then(() => {
          form.submit();
        });
    });
  }

  function highlight() {
    precode.className = language.value;
    precode.innerHTML = hljs.highlight(textarea.value, {
      language: language.value,
    }).value;
    hljs.highlightAll();
  }

  async function getImageDataUrl() {
    const canvas = await html2canvas(precode, {
      windowWidth: 600,
      windowHeight: 314,
    });
    return canvas.toDataURL("image/jpeg", 1.0);
  }
});
