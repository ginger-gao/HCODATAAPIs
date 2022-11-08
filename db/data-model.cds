
using {
   cuid,
   managed,
   sap.common
 } from '@sap/cds/common';

entity PickListV2 :cuid {
    key mdfSystemRecordId : String (128);
    picklistId : String (128);
    cudKey : String(1);
    Record : LargeString;
    createdBy: String @cds.on.insert: $user;
    lastModifiedBy: String @cds.on.insert: $user @cds.on.update: $user;
    createdDateTime: DateTime @cds.on.insert: $now;
    lastModifiedDateTime: DateTime @cds.on.insert: $now  @cds.on.update: $now;
}

entity Risks  :cuid, managed {
 //key ID : UUID @(Core.Computed : true);
 key ID : Integer;
 title : String(100);
 owner : String;
 prio : String(5);
 descr : String;
 miti : Association to Mitigations;
 impact : Integer;
 //bp : Association to BusinessPartners;
 // You will need this definition in a later step
 criticality : Integer;
 }

 entity Mitigations  :cuid, managed {
 //key ID : UUID @(Core.Computed : true);
 key ID : Integer;
 descr : String;
 owner : String;
 timeline : String;
 risks : Association to many Risks on risks.miti = $self;
 }