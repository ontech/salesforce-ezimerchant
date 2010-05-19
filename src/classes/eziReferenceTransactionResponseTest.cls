@isTest
private class eziReferenceTransactionResponseTest {
	
	static testMethod void testApply()
	{
		eziReferenceTransactionResponse e = new eziReferenceTransactionResponse(true, 1, '1', 'A', 'B', new List<eziTransactionError>());
	}

}