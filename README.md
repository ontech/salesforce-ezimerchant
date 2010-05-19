
ezimerchant Checkout integration with salesforce.com.
Allows you to take payments via the ezimerchant ecommerce service from within SalesForce apps.
This allows simplified and unified PayPal and credit card handling (amongst other payment types) in an easy to use
package.

Requirements
============
A salesforce environment
An ezimerchant account


Installation
============
simply add the ezi classes to your salesforce environment (includes test cases with production quality coverage).

Examples
========

eziTransaction tx = new eziTransaction(<ezimerchantid>, <ezimerchantemail>, <ezimerchantpassword>);

tx.LoadAccount([SELECT Id FROM Account LIMIT 1]);

eziTransactionLine l = new eziTransactionLine();
l.ProductCode = 'A';
l.ProductName = 'B';
l.Price = 59.99;
l.ListPrice = 69.99;
l.Tax = 'GST';

tx.Lines.add(l);

eziTransactionResponse r = tx.Submit();

----
The eziTransactionResponse object contains a PageReference object that you can use to redirect the user to a payment 
flow

If you specify NotifyURL on the transaction object and set the value to be the exposed SOAP service of the loaded 
eziTransactionEvent class - you may implement the transactionEvent method to receive callbacks when payment is completed