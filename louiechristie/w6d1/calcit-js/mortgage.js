function calculate() {
    var principal = parseFloat(document.getElementById('principal').value);
    var interest_rate = parseFloat(document.getElementById('interest_rate').value);
    var number_of_payments = parseFloat(document.getElementById('number_of_payments').value);

    var monthly_interest_rate = (interest_rate /100)/12;

    var foo = Math.pow(1 + monthly_interest_rate, number_of_payments);

    var top = monthly_interest_rate * foo;
    var bottom = foo - 1;

    var monthly_payment = principal * (top / bottom);
        
    document.getElementById('principal_out').innerHTML = principal;
    document.getElementById('interest_rate_out').innerHTML = interest_rate;
    document.getElementById('number_of_payments_out').innerHTML = number_of_payments;

    document.getElementById('result').innerHTML = monthly_payment;  
}