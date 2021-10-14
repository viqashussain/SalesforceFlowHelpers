global class GetCollectionWherePropInInvocableMethod {
    @InvocableMethod(label='GET collection WHERE Id IN' description='Retrieve a collection of objects from SOQL where the ID is in specified collection.')
    global static List<OutputModel> get(List<InputModel> models)
    {
        List<OutputModel> returnModels = new List<OutputModel>(); 
        
        string listToFilterBy = getListToFilterBy(models[0].collectionWithFieldToFilterBy, models[0].collectionFilterColumnApiNameToFilterBy);
        
        string allFields = getFieldsForObject(models[0].objectApiName);
        
        string query = 'SELECT ' + allFields + ' FROM ' + models[0].objectApiName + ' WHERE ' + models[0].columnApiNameToFilterBy + ' IN ' + listToFilterBy;
        
        system.debug(query);
        
        List<Sobject> results = Database.Query(query);
        
        if (results.size() > 0)
        {
            returnModels.add(new OutputModel(results));
        }
        else
        {
            returnModels.add(new OutputModel(null));
        }
        
        
        
        return returnModels;
    }
    
    global class InputModel {
        @InvocableVariable(required=true description='The collection that contains the ID (does not have to be the ID field, cannot be another field such as a lookup) field you would like to filter SOQL by')
        global List<SObject> collectionWithFieldToFilterBy;
        
        @InvocableVariable(required=true description='The Column Api Name you would like to use to get the filter field from the collectionWithFieldToFilterBy collection. Please provide plain text of the Column Api Name, no quotes.')
        global String collectionFilterColumnApiNameToFilterBy;
        
        @InvocableVariable(required=true description='The Object Api Name of the objects you would like returned, e.g. Account. Please provide plain text of the Column Api Name, no quotes.')
        global String objectApiName;
        
        @InvocableVariable(required=true description='The Column Api Name you would like to filter your new SObject with. Please provide plain text of the Column Api Name, no quotes.')
        global String columnApiNameToFilterBy;
    }
    
    global class OutputModel {
        @InvocableVariable(required=true description='The filtered collection. This can return an empty list of no objects are found.')
        global List<SObject> collection;
        
        global OutputModel(List<Sobject> collection)
        {
            this.collection = collection;
        }
    }
    	
    static String getListToFilterBy(List<SObject> collection, string fieldName)
    {
        string listToFilterBy = '(';
        
        for (SObject o: collection)
        {
            listToFilterBy += '\'' + (String)o.get(fieldName) + '\'' + ',';
        }
        
        return listToFilterBy.substring(0, listToFilterBy.length() - 1) + ')';
    }
    
    static String getFieldsForObject(String objectName) 
    {
        String SobjectApiName = objectName;
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();
        
        String apiNames = '';
        
        for(String apiName : fieldMap.keyset())
        {
            if(fieldMap.get(apiName).getDescribe().isUpdateable()) {
                apiNames += apiName + ',';
            }
        }
        
        return apiNames.substring(0, apiNames.length() - 1);
    }
}