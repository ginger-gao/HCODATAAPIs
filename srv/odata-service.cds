using {PickListV2 as PickListV2Data} from '../db/data-model';

@path : '/odata/v4'
@requires : 'authenticated-user'
@cds.query.limit.max: 10000000
service OdataService {
    entity PickListV2 as projection on PickListV2Data;
    annotate PickListV2 with @odata.draft.enabled;

    type PickListV2Headers : {
        mdfSystemRecordId : String(128);
        picklistId : String(128);
        cudKey : String(1);
        Record: LargeString;
    }
    
    type PickListV2HeadersOutput: {
        mdfSystemRecordId : String(128);
        picklistId : String(128);
        cudKey : String(1);
    }
 

    action SavePickListV2MultiProc (PickListV2 : array of PickListV2Headers) returns array of PickListV2HeadersOutput;
    action DeletePickListV2Proc () returns Boolean;

}
