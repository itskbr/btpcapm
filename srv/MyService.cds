using { ahamed.cds } from '../db/CDSViews';

service MyService @(path: 'MyService') {

    function danfoss(name: String(20)) returns String;
    entity ProductOrdersSet as projection on cds.CDSViews.ProductOrders;
    entity CProductAnalyticsSet as projection on cds.CDSViews.CProductAnalytics;

}