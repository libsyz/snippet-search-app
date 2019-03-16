import "bootstrap";
import "clipboard";

const input = document.querySelector('.query-input')
const snippets = document.querySelectorAll('.card-text');
const wordsArray = input.dataset.query.split(' ');
console.log(wordsArray);

const clipboard = new ClipboardJS('.query-input')

snippets.forEach((snippet) => {

  console.log(input.dataset);
  console.dir(snippet);

  wordsArray.forEach((word) => {
    if (snippet.innerText.includes(word) ) {
      snippet.innerHTML = snippet.innerHTML.replace(word, `<i class="highlighted">${word}</i>`)
    }
  })
})


