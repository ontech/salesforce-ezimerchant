public class eziTransactionResponse {

    private String OrderURL;

	public String PaymentCompletionURL {
        get {
            return this.OrderURL;
        }
    }

	public PageReference PaymentPageReference {
			get { 
				String[] Split = this.OrderURL.split('\\?', 2);

				String Base = Split[0];
				String[] Search = Split[1].split('=', 2);
				String Key = EncodingUtil.urlDecode(Search[1], 'utf-8');

	            PageReference pr = new PageReference(Base);	            
	            pr.getParameters().put('o', Key);	            
	            pr.setRedirect(true);

				return pr;
			}
	}

	public eziTransactionResponse(String OrderURL)
	{
		this.OrderURL = OrderURL;
	}
}