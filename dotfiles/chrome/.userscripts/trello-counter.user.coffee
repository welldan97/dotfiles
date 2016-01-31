`
// ==UserScript==
// @name         _trelloCounter
// @namespace    welldan97
// @include      *trello.com/b/*
// ==/UserScript==

// load scripts like jQuery from other sites
// http://stackoverflow.com/a/6834930/319918
var load,execute,loadAndExecute;load=function(a,b,c){var d;d=document.createElement("script"),d.setAttribute("src",a),b!=null&&d.addEventListener("load",b),c!=null&&d.addEventListener("error",c),document.body.appendChild(d);return d},execute=function(a){var b,c;typeof a=="function"?b="("+a+")();":b=a,c=document.createElement("script"),c.textContent=b,document.body.appendChild(c);return c},loadAndExecute=function(a,b){return load(a,function(){return execute(b)})};
`
whenReady = ->
  main = ->
    return if !getTrelloOptions().totals
    $title = $('.board-header-btn-text:first')
    $title.after '<span class="welldan97-trello-totals__counter"></span>'
    updateCounter()
    $(document).on 'click', updateCounter

  updateCounter = ->
    $('.welldan97-trello-totals__counter').html counter.getValue()

  getTrelloOptions = ->
    $title = $('.board-header-btn-text:first')
    try
      options = JSON.parse($title.text().match(/{.*}$/))
    catch e
      options = {}
    options

  counter = getValue: ->
    $('.list-card').length

  main()

jQueryUrl = 'https://code.jquery.com/jquery-2.2.0.min.js'
loadAndExecute jQueryUrl, whenReady
