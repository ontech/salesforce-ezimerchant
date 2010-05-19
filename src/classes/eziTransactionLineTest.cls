@isTest
private class eziTransactionLineTest {

	static testMethod void testApply()
	{
		eziTransactionLine e = new eziTransactionLine();
		
		Map<String, String> properties = new Map<String, String>();
		
		properties.put('productcode', 'A');
		properties.put('productname', 'B');
		properties.put('quantity', '1');
		properties.put('price', '59.99');
		properties.put('listprice', '69.99');
		properties.put('tax', 'GST');
		
		e.populate(properties);
	}

}