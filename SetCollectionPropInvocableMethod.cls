public class SetCollectionPropInvocableMethod {
    @InvocableMethod(description='Set the property of a collection of sObjects to a specified value.')
	public static List<OutputModel> execute(List<InputModel> inputModels)
    {
        InputModel model = inputModels[0];
        for (SObject o: model.inputCollection)
        {
            o.put(model.propertyApiNameToUpdate, model.value);
        }
        
        return new List<OutputModel> { new OutputModel(model.inputCollection) };
    }
    
    public class InputModel
    {
        @InvocableVariable(required=true description='The list you would like to update')
     	public List<SObject> inputCollection;   
        
        @InvocableVariable(required=true description='The Api Name of the field you would like to update')
        public String propertyApiNameToUpdate;
            
        @InvocableVariable(required=true description='The value you would like to set the propertyApiNameToUpdate field to.')
        public String value;
    }
    
    public class OutputModel
    {
        @InvocableVariable(required=true description='The updated list.')
     	public List<SObject> outputCollection;   
        
        OutputModel(List<SObject> outputCollection)
        {
            this.outputCollection = outputCollection;
        }
    }
}