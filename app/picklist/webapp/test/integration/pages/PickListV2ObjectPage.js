sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'picklistmanagement.picklist',
            componentId: 'PickListV2ObjectPage',
            entitySet: 'PickListV2'
        },
        CustomPageDefinitions
    );
});