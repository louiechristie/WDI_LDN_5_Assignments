$.ajax

var Stocks = Stocks || {};








Stocks.setup = function() {
  $('form').on('submit', Stocks.formSubmitHandler);
};


$(Stocks.setup)