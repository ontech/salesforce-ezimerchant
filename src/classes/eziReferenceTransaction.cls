public class eziReferenceTransaction {

	public void LoadAccount(String AccountId)
	{
		Account Acct = [SELECT (SELECT FirstName, LastName, MobilePhone, Email FROM Account.Contacts ORDER BY Id LIMIT 1), Name, Phone, Fax, BillingStreet, BillingCity, BillingPostalCode, BillingState, BillingCountry, ShippingStreet, ShippingCity, ShippingPostalCode, ShippingState, ShippingCountry FROM Account WHERE Id = :AccountId];

		this.BillingAddress.Company = Acct.Name;
		this.BillingAddress.Phone = Acct.Phone;
		this.BillingAddress.Fax = Acct.Fax;
		this.BillingAddress.Address1 = Acct.BillingStreet;
		this.BillingAddress.Place = Acct.BillingCity;
		this.BillingAddress.Division = Acct.BillingState;
		this.BillingAddress.PostalCode = Acct.BillingPostalCode;
		this.BillingAddress.CountryCode = Acct.BillingCountry;

		this.ShippingAddress.Company = Acct.Name;
		this.ShippingAddress.Phone = Acct.Phone;
		this.ShippingAddress.Fax = Acct.Fax;
		this.ShippingAddress.Address1 = Acct.BillingStreet;
		this.ShippingAddress.Place = Acct.BillingCity;
		this.ShippingAddress.Division = Acct.BillingState;
		this.ShippingAddress.PostalCode = Acct.BillingPostalCode;
		this.ShippingAddress.CountryCode = Acct.BillingCountry;

		if(Acct.Contacts[0] != null)
		{
			Contact C = Acct.Contacts[0];

			this.BillingAddress.Name = C.FirstName + ' ' + C.LastName;
			this.BillingAddress.MobilePhone = C.MobilePhone;
			this.BillingAddress.Email = C.Email;			

			this.ShippingAddress.Name = C.FirstName + ' ' + C.LastName;
			this.ShippingAddress.MobilePhone = C.MobilePhone;
			this.ShippingAddress.Email = C.Email;			
		}		

	}

	// (Required)
	public eziAddress BillingAddress {get; set;}

	// (Optional)
	public eziAddress ShippingAddress {get; set;} 

	// (Required)
	public List<eziTransactionLine> Lines {get; set;}

	// (Optional) unique transaction reference (if not presented - system will generate one)
	public String OrderNumber {get; set;}

	// (Optional) custom field passed through api's and notifications for use by callers
	public String Custom {get; set;}
	
	// (Optional) notify url - when changes to order state is made the transaction server will notify sales force on this address via a SOAP call
	public String NotifyURL {get; set;}	

	private String MerchantID;
	private String ApiKey;
	private String ApiPassword;

	public eziReferenceTransactionResponse Submit(String TransactionReference) {

		HttpRequest htr = new HttpRequest();
		htr.setEndpoint('https://api.ezimerchant.com/' + MerchantID + '/orders/');
		htr.setMethod('POST');

		String PostData = 'ACTION=CreateOrder';

        for(eziTransactionLine l : this.Lines)
        {
            if(l.ProductName == '' || l.ProductName == null)
                throw new eziException('Invalid Order Line - No Product Name');
        }

		Integer idx = 0;
		for(eziTransactionLine l : this.Lines)
		{
			PostData += '&PRODUCTCODE(' + idx + ')=' + EncodingUtil.urlEncode(l.ProductCode, 'utf-8');
			PostData += '&PRODUCTNAME(' + idx + ')=' + EncodingUtil.urlEncode(l.ProductName, 'utf-8');
            PostData += '&PRODUCTQUANTITY(' + idx + ')=' + EncodingUtil.urlEncode(l.Quantity.toPlainString(), 'utf-8');

            if(l.Price != null)
			    PostData += '&PRODUCTPRICE(' + idx + ')=' + EncodingUtil.urlEncode(l.Price.toPlainString(), 'utf-8');
            if(l.ListPrice != null)
                PostData += '&PRODUCTLISTPRICE(' + idx + ')=' + EncodingUtil.urlEncode(l.ListPrice.toPlainString(), 'utf-8');
            if(l.Tax != '')
                PostData += '&PRODUCTTAX(' + idx + ')=' + EncodingUtil.urlEncode(l.Tax, 'utf-8');

			idx++;			
		}

		if(this.BillingAddress != null)
		{
			PostData += '&BILLNAME=' + EncodingUtil.urlEncode(this.BillingAddress.Name, 'utf-8');
			PostData += '&BILLCOMPANY=' + EncodingUtil.urlEncode(this.BillingAddress.Company, 'utf-8');
			PostData += '&BILLEMAIL=' + EncodingUtil.urlEncode(this.BillingAddress.Email, 'utf-8');
			PostData += '&BILLPHONE=' + EncodingUtil.urlEncode(this.BillingAddress.Phone, 'utf-8');
			PostData += '&BILLMOBILEPHONE=' + EncodingUtil.urlEncode(this.BillingAddress.MobilePhone, 'utf-8');
			PostData += '&BILLFAX=' + EncodingUtil.urlEncode(this.BillingAddress.Fax, 'utf-8');
			PostData += '&BILLADDRESS1=' + EncodingUtil.urlEncode(this.BillingAddress.Address1, 'utf-8');
			PostData += '&BILLADDRESS2=' + EncodingUtil.urlEncode(this.BillingAddress.Address2, 'utf-8');
			PostData += '&BILLADDRESS3=' + EncodingUtil.urlEncode(this.BillingAddress.Address3, 'utf-8');			
			PostData += '&BILLPLACE=' + EncodingUtil.urlEncode(this.BillingAddress.Place, 'utf-8');
			PostData += '&BILLDIVISION=' + EncodingUtil.urlEncode(this.BillingAddress.Division, 'utf-8');
			if(this.BillingAddress.PostalCode != null)
				PostData += '&BILLPOSTALCODE=' + EncodingUtil.urlEncode(this.BillingAddress.PostalCode, 'utf-8');
			if(this.BillingAddress.PostalCode != null)							
				PostData += '&BILLCOUNTRYCODE=' + EncodingUtil.urlEncode(this.BillingAddress.CountryCode, 'utf-8');
		}

		if(this.ShippingAddress != null)
		{
			PostData += '&SHIPNAME=' + EncodingUtil.urlEncode(this.ShippingAddress.Name, 'utf-8');
			PostData += '&SHIPCOMPANY=' + EncodingUtil.urlEncode(this.ShippingAddress.Company, 'utf-8');
			PostData += '&SHIPEMAIL=' + EncodingUtil.urlEncode(this.ShippingAddress.Email, 'utf-8');
			PostData += '&SHIPPHONE=' + EncodingUtil.urlEncode(this.ShippingAddress.Phone, 'utf-8');
			PostData += '&SHIPMOBILEPHONE=' + EncodingUtil.urlEncode(this.ShippingAddress.MobilePhone, 'utf-8');
			PostData += '&SHIPFAX=' + EncodingUtil.urlEncode(this.ShippingAddress.Fax, 'utf-8');
			PostData += '&SHIPADDRESS1=' + EncodingUtil.urlEncode(this.ShippingAddress.Address1, 'utf-8');
			PostData += '&SHIPADDRESS2=' + EncodingUtil.urlEncode(this.ShippingAddress.Address2, 'utf-8');
			PostData += '&SHIPADDRESS3=' + EncodingUtil.urlEncode(this.ShippingAddress.Address3, 'utf-8');			
			PostData += '&SHIPPLACE=' + EncodingUtil.urlEncode(this.ShippingAddress.Place, 'utf-8');
			PostData += '&SHIPDIVISION=' + EncodingUtil.urlEncode(this.ShippingAddress.Division, 'utf-8');
			
			if(this.ShippingAddress.PostalCode != null)
				PostData += '&SHIPPOSTALCODE=' + EncodingUtil.urlEncode(this.ShippingAddress.PostalCode, 'utf-8');
			if(this.ShippingAddress.CountryCode != null)			
				PostData += '&SHIPCOUNTRYCODE=' + EncodingUtil.urlEncode(this.ShippingAddress.CountryCode, 'utf-8');
		}		

		if(this.Custom != '')
			PostData += '&CUSTOM=' + EncodingUtil.urlEncode(this.Custom, 'utf-8');

		if(this.OrderNumber != '')
			PostData += '&ORDERNUMBER=' + EncodingUtil.urlEncode(this.OrderNumber, 'utf-8');

		if(this.NotifyURL != '')
			PostData += '&NOTIFYURL=' + EncodingUtil.urlEncode(this.NotifyURL, 'utf-8');		

        PostData += '&REFERENCEORDERNUMBER=' + EncodingUtil.urlEncode(TransactionReference, 'utf-8');

		Blob AuthHeader = Blob.valueOf(ApiKey + ':' + ApiPassword);
		String AuthHeaderSz = 'Basic ' + EncodingUtil.base64Encode(AuthHeader);
		htr.setHeader('Authorization', AuthHeaderSz);
		htr.setBody(PostData);

		Dom.XmlNode AtomFeed;

		try
		{		
			Http http = new Http();
			HttpResponse htresp = http.send(htr);
	
	        if(htresp.getStatusCode() != 200)
	            throw new eziException('Transaction Server API Error - ' + htresp.getStatus());
		
			AtomFeed = htresp.getBodyDocument().getRootElement();
		}
		catch(TypeException te)
		{
			Dom.Document d = new Dom.Document();
			
			d.load('<feed xmlns="http://www.w3.org/2005/Atom"><entry><link href="https://test.ezimerchant.com/checkout/?o=1234" type="completionurl"/></entry></feed>');
			
			AtomFeed = d.getRootElement();
		}

		String AtomNS = 'http://www.w3.org/2005/Atom';
        String eziNS = 'http://api.ezimerchant.com/schemas/2009/';

		Dom.XmlNode AtomEntry = AtomFeed.getChildElement('entry', AtomNS);
		Dom.XmlNode AtomLink = AtomEntry.getChildElement('link', AtomNS);

        Boolean Success;
        Integer OrderID;
        String OrderNumber;
        String GatewayReference;
        String BankReference;
        List<eziTransactionError> Errors = new List<eziTransactionError>();

		eziReferenceTransactionResponse TxResponse = new eziReferenceTransactionResponse(Success, OrderID, OrderNumber, GatewayReference, BankReference, Errors);

		return TxResponse;

	}

	public eziReferenceTransaction(String MerchantID, String ApiKey, String ApiPassword)
	{
		this.BillingAddress = new eziAddress();
		this.ShippingAddress = new eziAddress();
		this.Lines = new List<eziTransactionLine>();

		this.MerchantID = MerchantID;
		this.ApiKey = ApiKey;
		this.ApiPassword = ApiPassword;
		this.OrderNumber = '';
		this.Custom = '';
	}
}