sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'buyerportal.portal',
            componentId: 'HeadersObjectPage',
            contextPath: '/Headers'
        },
        CustomPageDefinitions
    );
});