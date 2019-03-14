import "bootstrap";


const input = document.querySelector('.query-input')
const snippets = document.querySelectorAll('.card-text');
const wordsArray = input.dataset.query.split(' ');
console.log(wordsArray);

snippets.forEach((snippet) => {
  console.log(input.dataset);
  console.dir(snippet);

  wordsArray.forEach((word) => {
    if (snippet.innerText.includes(word) ) {
      snippet.innerHTML = snippet.innerHTML.replace(word, `<i class="highlighted">${word}</i>`)
    }
  })
  // break the data set into an array of words
  // iterate through each snippet
  // if any of the words is contained within the snippet
  // highlight



})
