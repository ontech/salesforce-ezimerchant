global class eziTransaction {

	// (Required)
	public eziAddress BillingAddress {get; set;}

	// (Optional)
	public eziAddress ShippingAddress {get; set;} 

	// (Required)
	public List<eziTransactionLine> Lines {get; set;}
	

	// (Default - true) allows transactions to be modified by an end user during payment flow
	public Boolean ReadOnly {get; set;}

	// (Optional) the url to redirect the visitor to when the transaction completes
	public String ReturnURL {get; set;}

	// (Optional) the url to return to if the visitor wishes to cancel the transaction
	public String CancelURL {get; set;}

	// (Optional) notify url - when changes to order state is made the transaction server will notify sales force on this address via a SOAP call
	public String NotifyURL {get; set;}

	// (Optional) unique transaction reference (if not presented - system will generate one)
	public String TransactionReference {get; set;}

	// (Optional) custom field passed through api's and notifications for use by callers
	public String Custom {get; set;}

	// create the transaction and get the completion url
	public eziTransactionResponse Submit() {

		// TODO

	}
}