public class eziTransactionLine {

	// (Optional) 
	public String ProductCode {get; set;}

	// (Required) 
	public String ProductName {get; set;}

	// (Optional) - default to 1
	public Decimal Quantity {get; set;}

	// (Optional) - if no price presented - order becomes a request for quote
	public Decimal Price {get; set;}

	// (Optional) - list price - allows the checkout process to display discounting per line if appropriate
	public Decimal ListPrice {get; set;}

	// (Optional) - tax code (as defined in tax settings in admin system)
	public String Tax {get; set;}

	// constructor
	public eziTransactionLine()
	{
		this.ProductCode = '';
        this.ProductName = null;
        this.Quantity = 1;
        this.Price = null;
        this.ListPrice = null;
        this.Tax = '';
	}

	public void populate(Map<String, String> attributeMap) {

        for (String fieldName : attributeMap.keySet()){
            if(fieldName.equalsIgnoreCase('productcode'))
                this.ProductCode = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase('productname'))
                this.ProductName = attributeMap.get(fieldName);
            else if(fieldName.equalsIgnoreCase('quantity'))
                this.Quantity = Decimal.valueOf(attributeMap.get(fieldName));
            else if(fieldName.equalsIgnoreCase('price'))
                this.Price = Decimal.valueOf(attributeMap.get(fieldName));
            else if(fieldName.equalsIgnoreCase('listprice'))
                this.ListPrice = Decimal.valueOf(attributeMap.get(fieldName));
            else if(fieldName.equalsIgnoreCase('tax'))
                this.Tax = attributeMap.get(fieldName);
        }
	}
}