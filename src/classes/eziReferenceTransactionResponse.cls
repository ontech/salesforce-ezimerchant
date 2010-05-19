public class eziReferenceTransactionResponse {

    public Boolean Success {get;set;}
    public Integer OrderID {get;set;}
    public String OrderNumber {get;set;}
    public String GatewayReference {get;set;}
    public String BankReference {get;set;}
    public List<eziTransactionError> Errors {get;set;}

    public eziReferenceTransactionResponse(Boolean Success, Integer OrderID, String OrderNumber, String GatewayReference, String BankReference, List<eziTransactionError> Errors)
    {
        this.Success = Success;
        this.OrderID = OrderID;
        this.OrderNumber = OrderNumber;
        this.GatewayReference = GatewayReference;
        this.BankReference = BankReference;
        this.Errors = Errors;
    }
}