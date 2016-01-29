`
// ==UserScript==
// @name         _trelloTotals
// @namespace    welldan97
// @include      *trello.com/b/*
// ==/UserScript==
`

main = ->
  counterElement = undefined
  titleElement = undefined
  if !getTrelloOptions().totals
    return
  titleElement = document.getElementsByClassName('board-header-btn-text')[0]
  counterElement = createElement('span', '')
  counterElement.className = 'welldan97-trello-totals__counter'
  insertAfter titleElement, counterElement
  updateCounter()
  document.addEventListener 'click', updateCounter
  return

updateCounter = ->
  document.getElementsByClassName('welldan97-trello-totals__counter')[0].innerHTML = counter.getValue()
  return

getTrelloOptions = ->
  options = undefined
  titleElement = undefined
  titleElement = document.getElementsByClassName('board-header-btn-text')[0]
  try
    options = JSON.parse(titleElement.innerHTML.match(/{.*}$/))
  catch e
    options = {}
  options

insertAfter = (element, elementToInsert) ->
  element.parentNode.insertBefore elementToInsert, element.nextSibling
  return

createElement = (tag, html) ->
  element = document.createElement(tag)
  element.innerHTML = html
  element

counter = getValue: ->
  document.getElementsByClassName('list-card').length

addJQuery = (callback) ->
  jQueryUrl = '//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js'
  script = document.createElement('script')
  script.setAttribute 'src', jQueryUrl
  script.addEventListener 'load', ->
    script = document.createElement('script')
    script.textContent =
      "window.jQ=jQuery.noConflict(true);(#{callback.toString()})();"
    document.body.appendChild script
  document.body.appendChild script

main()
