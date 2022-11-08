const cds = require('@sap/cds')
const serviceList = [
    {"entity":"PickListV2","srv":"SavePickListV2MultiProc","proc":"PICKLISTV2_SAVE_PROC","output":[{"ef":"mdfSystemRecordId","df":"MDFSYSTEMRECORDID"},{"ef":"picklistId","df":"PICKLISTID"},{"ef":"cudKey","df":"CUDKEY"}]}
]

const deleteServiceList = [
    {"entity":"PickListV2","srv":"DeletePickListV2Proc","proc":"PICKLISTV2_DELETE_PROC"}
]

module.exports = cds.service.impl(function () {    
    serviceList.forEach(service => {
        this.on(service.srv, async (req) => {
            try {
                 const inputData = req.data[service.entity] ? req.data[service.entity] : [];
                 
                 let params = [];
            
                inputData.forEach(item => {
                    let entries = Object.entries(item);
                    let capsEntries = entries.map((entry) => [entry[0].toUpperCase(), entry[1]]);
                    let param = Object.fromEntries(capsEntries);
                    params.push(param);
                });
            
                 const db = await cds.connect.to('db')
                 const dbClass = require("sap-hdbext-promisfied")
                 let dbConn = new dbClass(await dbClass.createConnection(db.options.credentials))
                 const hdbext = require("@sap/hdbext")
                 const sp = await dbConn.loadProcedurePromisified(hdbext, null, service.proc)
                 const output = await dbConn.callProcedurePromisified(sp, params)
                 
                 const outputData = output.results;
                 let outputList = [];
                 outputData.forEach(item => {
                    let opdata = {};
                    service.output.forEach(op => {
                        opdata[op.ef] = item[op.df];
                    }) 
                    
                    outputList.push(opdata);  
                 });
                 return outputList
            } catch (error) {
                 /*
                 console.error(error)
                 return false
                 */
                let errorList = [];
                let errorData = {"error":error.toString()}; 
                errorList.push(errorData);
                console.log(error.toString())
                 return errorList;
            }
         })
         
    });
    
    deleteServiceList.forEach(delService => {
        this.on(delService.srv, async () => {
            try {
                    const db = await cds.connect.to('db')
                    const dbClass = require("sap-hdbext-promisfied")
                    let dbConn = new dbClass(await dbClass.createConnection(db.options.credentials))
                    const hdbext = require("@sap/hdbext")
                    const sp = await dbConn.loadProcedurePromisified(hdbext, null, delService.proc)
                    const output = await dbConn.callProcedurePromisified(sp, []);
                    const outputData = output.results;
                    
                return outputData
            } catch (error) {
                    console.error(error)
                    return false
            }
        })
    });

})
