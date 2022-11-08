sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'picklistmanagement/picklist/test/integration/FirstJourney',
		'picklistmanagement/picklist/test/integration/pages/PickListV2List',
		'picklistmanagement/picklist/test/integration/pages/PickListV2ObjectPage'
    ],
    function(JourneyRunner, opaJourney, PickListV2List, PickListV2ObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('picklistmanagement/picklist') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePickListV2List: PickListV2List,
					onThePickListV2ObjectPage: PickListV2ObjectPage
                }
            },
            opaJourney.run
        );
    }
);