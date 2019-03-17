import "bootstrap";
import ClipboardJS from 'clipboard/dist/clipboard.min';

const input = document.querySelector('.query-input')
const textSnippets = document.querySelectorAll('.card-body');
const copyButtons = document.querySelectorAll('.copy-button');

new ClipboardJS(copyButtons);
const wordsArray = input.dataset.query.split(' ');
console.log(wordsArray);

// primitive text highlighter

textSnippets.forEach((snippet) => {
    wordsArray.forEach((word) => {
      if (snippet.innerText.includes(word) ) {
        snippet.innerHTML = snippet.innerHTML.replace(word, `<i class="highlighted">${word}</i>`)
    }
  })
})


