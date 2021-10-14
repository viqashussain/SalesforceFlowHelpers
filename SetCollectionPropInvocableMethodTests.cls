@IsTest
public class SetCollectionPropInvocableMethodTests {
	@IsTest
    public static void settingAccountNameOnMultipleAccounts()
    {
        Account accountOne = TestHelper.createAccount();
        Account accountTwo = TestHelper.createAccount();
        
        List<SetCollectionPropInvocableMethod.InputModel> inputModels = new List<SetCollectionPropInvocableMethod.InputModel>();
        SetCollectionPropInvocableMethod.InputModel inputModel = new SetCollectionPropInvocableMethod.InputModel();
        inputModel.inputCollection = new List<Account> { accountOne, accountTwo };
        inputModel.propertyApiNameToUpdate = 'Name';
        inputModel.value = 'abcdefg';
        inputModels.add(InputModel);
        
        Test.startTest();
        List<SetCollectionPropInvocableMethod.OutputModel> outputModels = SetCollectionPropInvocableMethod.execute(inputModels);
        Test.stopTest();
        
        System.assertEquals(2, outputModels[0].outputCollection.size());
        System.assertEquals('abcdefg', ((Account)(outputModels[0].outputCollection[0])).Name);
        System.assertEquals('abcdefg', ((Account)(outputModels[0].outputCollection[1])).Name);
    }
}