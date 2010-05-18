global class eziTransactionResponse {

	global String PaymentCompletionURL {get; set;}

	public PageReference PaymentPageReference {
			get { 
				String[] Split = this.PaymentCompletionURL.split('\\?', 2);
				
				String Base = Split[0];
				String[] Search = Split[1].split('=', 2);
				String Key = EncodingUtil.urlDecode(Search[1], 'utf-8');
				            
	            PageReference pr = new PageReference(Base);	            
	            pr.getParameters().put('o', Key);	            
	            pr.setRedirect(true);
								
				return pr;
			}
	}

	public eziTransactionResponse(String paymenturl)
	{
		this.PaymentCompletionURL = paymenturl;
	}
}