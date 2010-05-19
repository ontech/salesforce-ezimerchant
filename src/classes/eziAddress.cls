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

        for (String fieldName : attributeMap.keySet()){
            if(fieldName.equalsIgnoreCase("name"))
                this.Name = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase("company"))
                this.Company = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase("email"))
                this.Email = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase("phone"))
                this.Phone = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase("mobilephone"))
                this.MobilePhone = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase("fax"))
                this.Fax= attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase("address1"))
                this.Address1 = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase("address2"))
                this.Address2 = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase("address3"))
                this.Address3 = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase("place"))
                this.Place = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase("division"))
                this.Division = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase("postalcode"))
                this.PostalCode = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase("countrycode"))
                this.CountryCode = attributeMap.get(fieldName);
        }
	}
}