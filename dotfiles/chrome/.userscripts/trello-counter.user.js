
// ==UserScript==
// @name         _trelloCounter
// @namespace    welldan97
// @include      *trello.com/b/*
// ==/UserScript==

// load scripts like jQuery from other sites
// http://stackoverflow.com/a/6834930/319918
var load,execute,loadAndExecute;load=function(a,b,c){var d;d=document.createElement("script"),d.setAttribute("src",a),b!=null&&d.addEventListener("load",b),c!=null&&d.addEventListener("error",c),document.body.appendChild(d);return d},execute=function(a){var b,c;typeof a=="function"?b="("+a+")();":b=a,c=document.createElement("script"),c.textContent=b,document.body.appendChild(c);return c},loadAndExecute=function(a,b){return load(a,function(){return execute(b)})};
;
var jQueryUrl, whenReady;

whenReady = function() {
  var Counter, CounterNumber, TrelloExtension, main;
  main = function() {
    var counter, counterNumber, extension;
    extension = new TrelloExtension('counter');
    if (!extension.isActive()) {
      return;
    }
    counter = new Counter({
      offset: extension.getOptions().offset
    });
    counterNumber = new CounterNumber();
    counter.onUpdate(function() {
      return counterNumber.setValue(counter.getValue());
    });
    return counterNumber.setValue(counter.getValue());
  };
  TrelloExtension = (function() {
    function TrelloExtension(name) {
      this.name = name;
    }

    TrelloExtension.prototype.isActive = function() {
      return !!this.getOptions();
    };

    TrelloExtension.prototype.getOptions = function() {
      var e, error;
      try {
        return JSON.parse(localStorage.getItem('teo'))[this.name];
      } catch (error) {
        e = error;
        return false;
      }
    };

    return TrelloExtension;

  })();
  CounterNumber = (function() {
    function CounterNumber() {
      var $title;
      $title = $('.board-header-btn-text:first');
      $title.after('<span class="welldan97-trello-totals__counter"></span>');
      this.$el = $('.welldan97-trello-totals__counter');
    }

    CounterNumber.prototype.setValue = function(value) {
      return this.$el.html(value);
    };

    return CounterNumber;

  })();
  Counter = (function() {
    Counter.prototype.DEFAULT_OPTIONS = {
      offset: 0
    };

    function Counter(arg) {
      this.offset = (arg != null ? arg : DEFAULT_OPTIONS).offset;
      $(document).on('click', (function(_this) {
        return function() {
          return _this._onUpdate();
        };
      })(this));
    }

    Counter.prototype.onUpdate = function(_onUpdate) {
      this._onUpdate = _onUpdate;
    };

    Counter.prototype.getValue = function() {
      return $('.list-card:not(.js-composer)').length + this.offset;
    };

    return Counter;

  })();
  return main();
};

jQueryUrl = 'https://code.jquery.com/jquery-2.2.0.min.js';

loadAndExecute(jQueryUrl, whenReady);
