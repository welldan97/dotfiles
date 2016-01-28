// ==UserScript==
// @name         _trelloTotals
// @namespace    welldan97
// @include      *trello.com/b/*
// ==/UserScript==

var main,
    counter,
    createElement,
    getTrelloOptions,
    insertAfter;

main = function() {
  var counterElement,
      titleElement;
  if (!getTrelloOptions().totals) {
    return;
  }

  titleElement = document.getElementsByClassName('board-header-btn-text')[0];
  counterElement = createElement('span', counter.value());
  insertAfter(titleElement, counterElement);
};

getTrelloOptions = function() {
  var options, titleElement;
  titleElement = document.getElementsByClassName('board-header-btn-text')[0];
  try {
    options = JSON.parse(titleElement.innerHTML.match(/{.*}$/));
  } catch (e) {
    options = {};
  }
  return options;
};

insertAfter = function(element, elementToInsert) {
  element.parentNode.insertBefore(elementToInsert, element.nextSibling);
};

createElement = function(tag, html) {
  var element = document.createElement(tag);
  element.innerHTML = html;
  return element;
};

counter = {
  value: function() {
    return document.getElementsByClassName('list-card').length;
  }
};

main();
