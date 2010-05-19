public class eziAddress {

	// (Required) customer contact name
	public String Name {get; set;}

	// (Optional) customer contact company
	public String Company {get; set;}

	// (Optional) customer contact email
	public String Email {get; set;}

	// (Optional) customer contact phone
	public String Phone {get; set;}

	// (Optional) customer contact mobile
	public String MobilePhone {get; set;}

	// (Optional) customer contact fax
	public String Fax {get; set;}

	// (Required) billing/shipping address1
	public String Address1 {get; set;}

	// (Optional) billing/shipping address2
	public String Address2 {get; set;}

	// (Optional) billing/shipping address3
	public String Address3 {get; set;}

	// (Required) billing/shipping suburb/city/town
	public String Place {get; set;}

	// (Required) billing/shipping state/territory/region
	public String Division {get; set;}

	// (Required) billing/shipping post code/zipcode
	public String PostalCode {get; set;}

	// (Required) billing/shipping country code (ISO 3166)
	public String CountryCode {get; set;}


	// constructor
	public eziAddress()
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
            if(fieldName.equalsIgnoreCase('name'))
                this.Name = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase('company'))
                this.Company = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase('email'))
                this.Email = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase('phone'))
                this.Phone = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase('mobilephone'))
                this.MobilePhone = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase('fax'))
                this.Fax= attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase('address1'))
                this.Address1 = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase('address2'))
                this.Address2 = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase('address3'))
                this.Address3 = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase('place'))
                this.Place = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase('division'))
                this.Division = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase('postalcode'))
                this.PostalCode = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase('countrycode'))
                this.CountryCode = attributeMap.get(fieldName);
        }
	}
}