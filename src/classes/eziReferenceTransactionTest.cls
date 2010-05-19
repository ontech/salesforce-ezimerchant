@isTest
private class eziReferenceTransactionTest {

	static testMethod void testApply()
	{
		eziReferenceTransaction tx = new eziReferenceTransaction('12822', 'jschiller@ontech.com.au', 'password');
		
		Account a = [SELECT Id FROM Account LIMIT 1];
		
		tx.LoadAccount(a.Id);
		tx.Custom = 'test';
		tx.OrderNumber = '1234';
		tx.NotifyURL = 'http://www.google.com/';
		
		eziTransactionLine l = new eziTransactionLine();
		
		l.ProductCode = 'A';
		l.ProductName = 'B';		
		l.Price = 59.99;
		l.ListPrice = 69.99;
		l.Quantity = 1;
		l.Tax = 'GST';
		
		tx.Lines.add(l);
		
		eziReferenceTransactionResponse r = tx.Submit('1234');		
	}

}