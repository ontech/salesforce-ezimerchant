global class eziTransactionEvent {

	webservice static void transactionEvent(String json)
	{
		System.debug(json);
	}

}