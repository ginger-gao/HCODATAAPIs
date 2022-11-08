using OdataService as service from '../../srv/odata-service';

 // Picklist List Report Page
 annotate OdataService.PickListV2 with @(UI : {
    HeaderInfo : {
       TypeName : 'Pick1',
       TypeNamePlural : 'Pick2',
       Title : {
          $Type : 'UI.DataField',
          Value : picklistId
       },
       Description : {
          $Type : 'UI.DataField',
            Value : mdfSystemRecordId
       }
    },
    SelectionFields : [picklistId,mdfSystemRecordId,cudKey],
    Identification : [{Value : mdfSystemRecordId}],
    // Define the table columns
    LineItem : [
       {Value : picklistId},
       {Value : mdfSystemRecordId},
       {Value : cudKey},
      
    ],
 });
 // Picklist Object Page
 annotate OdataService.PickListV2 with @(UI : {
     Facets : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Main',
        Target : '@UI.FieldGroup#Main',
     }],
     FieldGroup #Main : {Data : [
       {Value : Record},
       
       
    ]},
 });