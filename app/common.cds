using {PickListV2 as PickListV2Data} from '../db/data-model';
using {Risks as RisksData} from '../db/data-model';
using {Mitigations as MitigationsData} from '../db/data-model';

 // Annotate Risk elements
 annotate RisksData with {
 ID     @title : 'Risk';
 title  @title : 'Title';
 owner  @title : 'Owner';
 prio   @title : 'Priority';
 descr  @title : 'Description';
 miti   @title : 'Mitigation';
 impact @title : 'Impact';
 } 

// Annotate Miti elements
 annotate MitigationsData with {
 ID @( 
      //UI.Hidden,
      Common : {Text : descr}
 ); 
owner @title : 'Owner';
descr @title : 'Description';
 }

annotate RisksData with {
   miti @(Common : {
    //show text, not id for mitigation in the context of risks
    Text            : miti.descr,
    TextArrangement : #TextOnly,
    ValueList       : {
    Label          : 'Mitigations',
    CollectionPath : 'Mitigations',
    Parameters     : [
    //    {
    //    $Type : 'Common.ValueListParameterIn',
    //    LocalDataProperty : owner,
    //    ValueListProperty : 'owner'
    //    },
       {
       $Type : 'Common.ValueListParameterOut',
       LocalDataProperty : miti_ID,
       ValueListProperty : 'ID'
       },
    //    {
    //    $Type : 'Common.ValueListParameterDisplayOnly',
    //    //LocalDataProperty : owner,
    //    ValueListProperty : 'owner'
    //    },
       {
       $Type : 'Common.ValueListParameterDisplayOnly',
       ValueListProperty : 'descr'
       }
    ]
    }
  });
 }

 // Annotate picklist elements
 annotate PickListV2Data with {
 mdfSystemRecordId     @title : 'RecordID';
 picklistId  @title : 'ID';
 cudKey  @title : 'Key';
 Record @title : 'record';
 } 

 annotate PickListV2Data with {
   Record @(Common : {
    //show text, not id for mitigation in the context of risks
    Text            : Record,
    TextArrangement : #TextOnly,
    ValueList       : {
    Label          : 'Records',
    CollectionPath : 'PickListV2',
    Parameters     : [
       {
       $Type : 'Common.ValueListParameterInOut',
       LocalDataProperty : Record,
       ValueListProperty : 'PickListV2.Record'
       },
       {
       $Type : 'Common.ValueListParameterDisplayOnly',
       ValueListProperty : 'PickListV2.picklistId'
       }
    ]
    }
  });
 }