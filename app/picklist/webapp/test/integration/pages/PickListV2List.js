sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'picklistmanagement.picklist',
            componentId: 'PickListV2List',
            entitySet: 'PickListV2'
        },
        CustomPageDefinitions
    );
});