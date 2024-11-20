sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'buyerportalapplication/portal/test/integration/FirstJourney',
		'buyerportalapplication/portal/test/integration/pages/HeadersList',
		'buyerportalapplication/portal/test/integration/pages/HeadersObjectPage'
    ],
    function(JourneyRunner, opaJourney, HeadersList, HeadersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('buyerportalapplication/portal') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheHeadersList: HeadersList,
					onTheHeadersObjectPage: HeadersObjectPage
                }
            },
            opaJourney.run
        );
    }
);