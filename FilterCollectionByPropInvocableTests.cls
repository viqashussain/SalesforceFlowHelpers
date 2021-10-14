@IsTest
public class FilterCollectionByPropInvocableTests {
    @IsTest
    public static void getListOfAccountsUsingContactId()
    {
        Account accountOne = TestHelper.createAccount();
        Account accountTwo = TestHelper.createAccount();
        Account accountThree = TestHelper.createAccount();
        List<Account> accounts = new List<Account> { accountOne, accountTwo, accountThree };
        Contact contactOne = TestHelper.createContact(accountOne);
        List<Contact> contacts = new List<Contact> { contactOne, TestHelper.createContact(accountTwo), TestHelper.createContact(accountThree) };        
            
        List<FilterCollectionByPropInvocableMethod.FilterCollectionByIdInvocableMethodInputModel> inputModels = new List<FilterCollectionByPropInvocableMethod.FilterCollectionByIdInvocableMethodInputModel>();
        FilterCollectionByPropInvocableMethod.FilterCollectionByIdInvocableMethodInputModel inputModel = new FilterCollectionByPropInvocableMethod.FilterCollectionByIdInvocableMethodInputModel();
        inputModel.collection = contacts;
        inputModel.valueToFilterBy = accountOne.Id;
        inputModel.columnApiNameToFilterBy = 'AccountId';
        inputModels.add(inputModel);
        
        List<FilterCollectionByPropInvocableMethod.FilterCollectionByIdInvocableMethodOutputModel> outputModels = FilterCollectionByPropInvocableMethod.filter(inputModels);
        FilterCollectionByPropInvocableMethod.FilterCollectionByIdInvocableMethodOutputModel outputModel = outputModels[0];
        
        System.assertEquals(contactOne.Id, outputModel.filteredObject.Id);
    }
    
    @IsTest
    public static void getListOfAccountsUsingContactIdAndId()
    {
        Account accountOne = TestHelper.createAccount();
        Account accountTwo = TestHelper.createAccount();
        Account accountThree = TestHelper.createAccount();
        List<Account> accounts = new List<Account> { accountOne, accountTwo, accountThree };
        Contact contactOne = TestHelper.createContact(accountOne);
        Contact contactTwo = TestHelper.createContact(accountTwo);
        List<Contact> contacts = new List<Contact> { contactOne, contactTwo, TestHelper.createContact(accountThree) };        
            
        List<FilterCollectionByPropInvocableMethod.FilterCollectionByIdInvocableMethodInputModel> inputModels = new List<FilterCollectionByPropInvocableMethod.FilterCollectionByIdInvocableMethodInputModel>();
        FilterCollectionByPropInvocableMethod.FilterCollectionByIdInvocableMethodInputModel inputModel = new FilterCollectionByPropInvocableMethod.FilterCollectionByIdInvocableMethodInputModel();
        inputModel.collection = contacts;
        inputModel.valueToFilterBy = accountTwo.Id;
        inputModel.columnApiNameToFilterBy = 'AccountId';
        inputModel.valueToFilterBy = ContactTwo.Id;
        inputModel.columnApiNameToFilterBy = 'Id';
        inputModels.add(inputModel);
        
        List<FilterCollectionByPropInvocableMethod.FilterCollectionByIdInvocableMethodOutputModel> outputModels = FilterCollectionByPropInvocableMethod.filter(inputModels);
        FilterCollectionByPropInvocableMethod.FilterCollectionByIdInvocableMethodOutputModel outputModel = outputModels[0];
        
        System.assertEquals(contactTwo.Id, outputModel.filteredObject.Id);
    }
}