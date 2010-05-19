@isTest
private class eziAddressTest {

	static testMethod void testApply()
	{
		eziAddress tmp = new eziAddress();
		
		Map<String, String> properties = new Map<String, String>();
		
		tmp.populate(properties);
	}

}