@isTest
private class eziTransactionResponseTest {

	static testMethod void testApply()
	{
		eziTransactionResponse e = new eziTransactionResponse('https://test.ezimerchant.com/checkout/?o=1234');
		
		PageReference p = e.PaymentPageReference;
		String url = e.PaymentCompletionURL;		
	}

}