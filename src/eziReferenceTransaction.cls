global class eziReferenceTransaction {

	// (Required)
	public eziAddress BillingAddress {get; set;}

	// (Optional)
	public eziAddress ShippingAddress {get; set;} 

	// (Required)
	public List<eziTransactionLine> Lines {get; set;}

	public static eziReferenceTransactionResponse Submit(String TransactionReference) {

		// TODO

	}

}