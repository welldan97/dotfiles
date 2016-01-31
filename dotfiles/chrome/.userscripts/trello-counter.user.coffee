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
    extension = new TrelloExtension('counter')
    return unless extension.isActive()

    counter = new Counter()
    counterNumber = new CounterNumber()

    counter.onUpdate ->
      counterNumber.setValue counter.getValue()

    counterNumber.setValue counter.getValue()


  class TrelloExtension
    constructor: (@name) ->

    isActive: ->
      !! @getOptions

    getOptions: ->
      try
        JSON.parse(localStorage.getItem('teo'))[name]
      catch e
        false

  class CounterNumber
    constructor: ->
      $title = $('.board-header-btn-text:first')
      $title.after '<span class="welldan97-trello-totals__counter"></span>'
      @$el = $('.welldan97-trello-totals__counter')

    setValue: (value) ->
      @$el.html value

  class Counter
    constructor: ->
      $(document).on 'click', =>
        @_onUpdate()

    onUpdate: (@_onUpdate) ->
    getValue: ->
      $('.list-card:not(.js-composer)').length

  main()

jQueryUrl = 'https://code.jquery.com/jquery-2.2.0.min.js'
loadAndExecute jQueryUrl, whenReady
