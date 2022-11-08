
using {Risks as RisksData} from '../db/data-model';
using {Mitigations as MitigationsData} from '../db/data-model';

 @path: 'service/risk'
 service RiskService {
 entity Risks as projection on RisksData;
     annotate Risks with @odata.draft.enabled;
 entity Mitigations as projection on MitigationsData;
     annotate Mitigations with @odata.draft.enabled;
 //@readonly entity BusinessPartners as projection on rm.BusinessPartners;
 }