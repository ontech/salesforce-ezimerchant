global class eziTransactionLine {

	// (Optional) 
	global String ProductCode {get; set;}
	
	// (Required) 
	global String ProductName {get; set;}

	// (Optional) - default to 1
	global Decimal Quantity {get; set;}

	// (Optional) - if no price presented - order becomes a request for quote
	global Decimal Price {get; set;}

	// (Optional) - list price - allows the checkout process to display discounting per line if appropriate
	global Decimal ListPrice {get; set;}

	// (Optional) - tax code (as defined in tax settings in admin system)
	global String Tax {get; set;}

	// constructor
	global eziOrderLine()
	{
		// TODO
	}

	public void populate(Map<String, String> attributeMap) {

		// TODO

	}
}