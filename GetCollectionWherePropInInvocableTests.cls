@IsTest
public class GetCollectionWherePropInInvocableTests {
	@IsTest
    public static void getListOfAccountsUsingAccountIdInContactsList()
    {
        Account accountOne = TestHelper.createAccount();
        Account accountTwo = TestHelper.createAccount();
        Account accountThree = TestHelper.createAccount();
        Contact contactOne = TestHelper.createContact(accountOne);
        Contact contactTwo = TestHelper.createContact(accountTwo);
        Contact contactThree = TestHelper.createContact(accountTwo);
        
        List<GetCollectionWherePropInInvocableMethod.InputModel> inputModels = new List<GetCollectionWherePropInInvocableMethod.InputModel>();
        GetCollectionWherePropInInvocableMethod.InputModel inputModel = new GetCollectionWherePropInInvocableMethod.InputModel();
        inputModel.collectionWithFieldToFilterBy = new List<Contact> { contactOne, contactTwo };
        inputModel.collectionFilterColumnApiNameToFilterBy = 'AccountId';
        inputModel.objectApiName = 'Account';
        inputModel.columnApiNameToFilterBy = 'Id';
        inputModels.add(inputModel);
        
        List<GetCollectionWherePropInInvocableMethod.OutputModel> outputModels = GetCollectionWherePropInInvocableMethod.get(inputModels);
        GetCollectionWherePropInInvocableMethod.OutputModel outputModel = outputModels[0];
        
        System.assertEquals(2, outputModel.collection.size());
        System.assertEquals(accountOne.Id, outputModel.collection[0].Id);
        System.assertEquals(accountTwo.Id, outputModel.collection[1].Id);
    }
    
    @IsTest
    public static void shouldReturnNullWhenNoRecordsAreFound()
    {
        Account accountOne = TestHelper.createAccount();
        Contact contactOne = TestHelper.createContact(accountOne);
        
        delete accountONe;
        
        List<GetCollectionWherePropInInvocableMethod.InputModel> inputModels = new List<GetCollectionWherePropInInvocableMethod.InputModel>();
        GetCollectionWherePropInInvocableMethod.InputModel inputModel = new GetCollectionWherePropInInvocableMethod.InputModel();
        inputModel.collectionWithFieldToFilterBy = new List<Contact> { contactOne };
        inputModel.collectionFilterColumnApiNameToFilterBy = 'AccountId';
        inputModel.objectApiName = 'Account';
        inputModel.columnApiNameToFilterBy = 'Id';
        inputModels.add(inputModel);
        
        List<GetCollectionWherePropInInvocableMethod.OutputModel> outputModels = GetCollectionWherePropInInvocableMethod.get(inputModels);
        GetCollectionWherePropInInvocableMethod.OutputModel outputModel = outputModels[0];
        
        System.assertEquals(null, outputModel.collection);
    }
}