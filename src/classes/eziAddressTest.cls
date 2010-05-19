@isTest
private class eziAddressTest {

	static testMethod void testApply()
	{
		eziAddress tmp = new eziAddress();
		
		Map<String, String> properties = new Map<String, String>();
		
		properties.put('name', 'Fred');
		properties.put('company', 'OnTechnology');
		properties.put('email', 'sales@ezimerchant.com');
		properties.put('phone', '+61 2 88898889');
		properties.put('mobilephone', '');
		properties.put('fax', '+61 2 88898890');
		properties.put('address1', 'Off 418 5 Celebration Dr');
		properties.put('address2', '');
		properties.put('address3', '');
		properties.put('place', 'BELLA VISTA');
		properties.put('division', 'NSW');
		properties.put('postalcode', '2153');
		properties.put('countrycode', 'AU');

		tmp.populate(properties);
	}

}