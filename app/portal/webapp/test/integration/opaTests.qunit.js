sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'buyerportal/portal/test/integration/FirstJourney',
		'buyerportal/portal/test/integration/pages/HeadersList',
		'buyerportal/portal/test/integration/pages/HeadersObjectPage'
    ],
    function(JourneyRunner, opaJourney, HeadersList, HeadersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('buyerportal/portal') + '/index.html'
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