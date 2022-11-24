// TODO: React to a click on the button!
const points = document.querySelector('#points-count');
const checkbox = document.querySelector('#checkbox');

checkbox.addEventListener('click', (e) => {
  e.points.innerText = 'Bingo!';

});
