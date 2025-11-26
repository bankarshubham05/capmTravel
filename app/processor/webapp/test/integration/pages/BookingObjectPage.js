sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'processor',
            componentId: 'BookingObjectPage',
            contextPath: '/TravelEt/to_Booking'
        },
        CustomPageDefinitions
    );
});