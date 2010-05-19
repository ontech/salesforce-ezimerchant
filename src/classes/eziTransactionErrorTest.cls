@isTest
private class eziTransactionErrorTest {

	static testMethod void testApply()
	{
		eziTransactionError e = new eziTransactionError();
		
		e.code = 'TEST';
		e.message = 'TEST';
		
	}

}