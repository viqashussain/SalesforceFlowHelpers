global class FilterCollectionByPropInvocableMethod {
    @InvocableMethod(label='Filter collection by Property' description='Filter a collection and find a single object using a specified Column Api Name. You can pass either a 1 or 2 field to filter the collection by.')
    global static List<FilterCollectionByIdInvocableMethodOutputModel> filter(List<FilterCollectionByIdInvocableMethodInputModel> models)
    {
        List<FilterCollectionByIdInvocableMethodOutputModel> returnModels = new List<FilterCollectionByIdInvocableMethodOutputModel>();
        for (SObject o: models[0].collection)
        {
            // if you have the second filter
            if (models[0].valueToFilterBy2 != null)
            {
                if (o.get(models[0].columnApiNameToFilterBy) == models[0].valueToFilterBy && o.get(models[0].columnApiNameToFilterBy2) == models[0].valueToFilterBy2)
                {
                    returnModels.add(new FilterCollectionByIdInvocableMethodOutputModel(o));
                    break;
                }
            }
            // only a single filter
            else if (o.get(models[0].columnApiNameToFilterBy) == models[0].valueToFilterBy)
            {
                returnModels.add(new FilterCollectionByIdInvocableMethodOutputModel(o));
                break;
            }
        }
        
        
        return returnModels;
    }
    
    global class FilterCollectionByIdInvocableMethodInputModel {
        @InvocableVariable(required=true description='The collection you would like to filter and find the object in.')
        global List<SObject> collection;
        
        @InvocableVariable(required=true description='The value you would like to filter by, e.g. an ID.')
        global String valueToFilterBy;
        
        @InvocableVariable(required=true description='The Column Api Name you would like to use to filter the collection. Please provide plain text of the Column Api Name, no quotes.')
        global String columnApiNameToFilterBy;
        
        @InvocableVariable(description='The value you would like to filter by, e.g. an ID. (Not Required)')
        global String valueToFilterBy2;
        
        @InvocableVariable(description='The second Column Api Name you would like to use to filter the collection. (Not Required)')
        global String columnApiNameToFilterBy2;
    }
    
    global class FilterCollectionByIdInvocableMethodOutputModel {
        @InvocableVariable(required=true description='The filter object from the collection. This will be NULL if nothing is found.')
        global SObject filteredObject;
        
        global FilterCollectionByIdInvocableMethodOutputModel(SObject filteredObject)
        {
            this.filteredObject = filteredObject;
        }
    }
}