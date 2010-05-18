global class eziAddress {

	// (Required) customer contact name
	public String Name {get; set;}

	// (Optional) customer contact company
	global String Company {get; set;}

	// (Optional) customer contact email
	global String Email {get; set;}

	// (Optional) customer contact phone
	global String Phone {get; set;}

	// (Optional) customer contact mobile
	global String MobilePhone {get; set;}

	// (Optional) customer contact fax
	global String Fax {get; set;}

	// (Required) billing/shipping address1
	global String Address1 {get; set;}

	// (Optional) billing/shipping address2
	global String Address2 {get; set;}

	// (Optional) billing/shipping address3
	global String Address3 {get; set;}

	// (Required) billing/shipping suburb/city/town
	global String Place {get; set;}

	// (Required) billing/shipping state/territory/region
	global String Division {get; set;}

	// (Required) billing/shipping post code/zipcode
	global String PostalCode {get; set;}

	// (Required) billing/shipping country code (ISO 3166)
	global String CountryCode {get; set;}


	// constructor
	global eziAddress()
	{
		this.Name = '';
		this.Company = '';
		this.Email = '';
		this.Phone = '';
		this.MobilePhone = '';
		this.Fax = '';
		this.Address1 = '';
		this.Address2 = '';
		this.Address3 = '';
		this.Place = '';
		this.Division = '';
		this.PostalCode = '';
		this.CountryCode = '';
	}


	// populate attributes of this object based on a key/value string dictionary
	public void populate(Map<String, String> attributeMap) {

		// TODO

	}
}