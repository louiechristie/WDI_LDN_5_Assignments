// alert("Yep")

// var now = new Date();
// var currentDate = null;

// do {
//   currentDate = new Date(); // locks the app because it is constantly getting new dates.
// } while (currentDate - now < 10000);

var Stocks = Stocks || {};

Stocks.updatePage = function(data) {
  var bits = ['symbol', 'name', 'lastTrade', 'time', 'date', 'updatedAt'];
  $.each(bits, function(i, name) {
    Stocks.updateWithFlash($('#' + name), data[name])
    $('#' + name).text(data[name]);
  });
  // console.log(data);
  // $('#symbol').text(data['symbol']);
  // $('#name').text(data['name']);
};

Stocks.updateWithFlash = function(el, content) {
  var $el = $(el);
  $el.text(content);

  var up = true;
  var level = 15;
  var step = function() {
    var hex = level.toString(16);
    $el.css('background-color': '#FAFA' + hex + hex);
    if (up) {
      if (level > 0) {
        level--;
        setTimeout(step, 25);
      } else {
        up = false;
        level = 1;
        setTimeout(step, 25);
      }
    }
  }
  setTimeout(step, 25);
}

Stocks.showUpdating = function() {
  $('#updatemessage').slideUp();
};

Stocks.hideUpdating = function() {
  $('#updatemessage').slideDown();
}

Stocks.disableForm = function() {
  $('input').attr('disabled', 'disabled');
}

Stocks.enableForm = function() {
  $('input').attr('disabled', false);
}

// Stocks.setup = function() {
//   $('form').on('submit', function(ev) {
//     ev.preventDefault();
//     alert("Yup, this ran")
//   });
// };

Stocks.formSubmitHandler = function(ev) {
    ev.preventDefault();
    var stockSymbol = $('#symbol_input').val();
    //alert("Yup, this ran");

    var ajaxOptions = {
      url: '/' + stockSymbol,
      type: 'GET',
      error: function(data) {
        console.log("AJAX request failed.");
        console.log(data);

      }
    };
    $.ajax(ajaxOptions).
    done(Stocks.updatePage).
    always(Stocks.enableForm).
    always(Stocks.hideUpdating);
  };

Stocks.setup = function() {
  $('form').on('submit', Stocks.formSubmitHandler);
};


$(Stocks.setup);