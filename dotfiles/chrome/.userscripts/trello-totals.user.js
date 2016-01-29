// ==UserScript==
// @name         _trelloTotals
// @namespace    welldan97
// @include      *trello.com/b/*
// ==/UserScript==
;
var addJQuery, counter, createElement, getTrelloOptions, insertAfter, main, updateCounter;

console.log('heeey');

main = function() {
  var counterElement, titleElement;
  counterElement = void 0;
  titleElement = void 0;
  if (!getTrelloOptions().totals) {
    return;
  }
  titleElement = document.getElementsByClassName('board-header-btn-text')[0];
  counterElement = createElement('span', '');
  counterElement.className = 'welldan97-trello-totals__counter';
  insertAfter(titleElement, counterElement);
  updateCounter();
  document.addEventListener('click', updateCounter);
};

updateCounter = function() {
  document.getElementsByClassName('welldan97-trello-totals__counter')[0].innerHTML = counter.getValue();
};

getTrelloOptions = function() {
  var e, error, options, titleElement;
  options = void 0;
  titleElement = void 0;
  titleElement = document.getElementsByClassName('board-header-btn-text')[0];
  try {
    options = JSON.parse(titleElement.innerHTML.match(/{.*}$/));
  } catch (error) {
    e = error;
    options = {};
  }
  return options;
};

insertAfter = function(element, elementToInsert) {
  element.parentNode.insertBefore(elementToInsert, element.nextSibling);
};

createElement = function(tag, html) {
  var element;
  element = document.createElement(tag);
  element.innerHTML = html;
  return element;
};

counter = {
  getValue: function() {
    return document.getElementsByClassName('list-card').length;
  }
};

addJQuery = function(callback) {
  var jQueryUrl, script;
  jQueryUrl = '//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js';
  script = document.createElement('script');
  script.setAttribute('src', jQueryUrl);
  script.addEventListener('load', function() {
    script = document.createElement('script');
    script.textContent = "window.jQ=jQuery.noConflict(true);(" + (callback.toString()) + ")();";
    return document.body.appendChild(script);
  });
  return document.body.appendChild(script);
};

main();
