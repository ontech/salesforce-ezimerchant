@isTest
private class eziTransactionTest {

	static testMethod void testApply()
	{
		eziTransaction tx = new eziTransaction('12822', 'jschiller@ontech.com.au', 'password');
		
		Account a = [SELECT Id FROM Account LIMIT 1];
		
		tx.LoadAccount(a.Id);
		tx.Custom = 'test';
		tx.OrderNumber = '1234';
		tx.ReturnURL = 'http://www.google.com/';
		tx.CancelURL = 'http://www.google.com/';
		tx.NotifyURL = 'http://www.google.com/';
		
		eziTransactionLine l = new eziTransactionLine();
		
		l.ProductCode = 'A';
		l.ProductName = 'B';		
		l.Price = 59.99;
		l.ListPrice = 69.99;
		l.Quantity = 1;
		l.Tax = 'GST';
		
		tx.Lines.add(l);
		
		eziTransactionResponse r = tx.Submit();
	}

}