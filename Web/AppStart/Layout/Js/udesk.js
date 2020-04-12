
function init(data)
{ 

    (function (a, h, c, b, f, g) { a['UdeskApiObject'] = f; a[f] = a[f] || function () { (a[f].d = a[f].d || []).push(arguments) }; g = h.createElement(c); g.async = 1; g.src = b; c = h.getElementsByTagName(c)[0]; c.parentNode.insertBefore(g, c) })(window, document, 'script', 'http://assets-cli.udesk.cn/im_client/js/udeskApi.js?1494847567167', 'ud');
    ud({
        'code': '1c8bk22k',
        'link': 'http://wmt.udesk.cn/im_client?web_plugin_id=24303',
        product: {
            title: ' ',
            image: 'http://wmt.ccorp.cn/AppWMT/webMaster/imgs/logo.png',
            url: 'http://wmt.ccorp.cn',
            '用户': data.trueName,
            '十位编码': data.companyCode,
            '企业名称': data.companyName
        } 
        //,customer: {
        //    'c_name': '" + user.TrueName + @"',
        //    'c_org': '"+user.CIQ_Name+ @"',
        //    'c_cf_十位编码': '"+user.CIQ_Code+@"',
        //    'nonce': '" + nonce+@"',
        //    'signature': '"+signature+@"',
        //    'timestamp': '"+timestamp+@"',
        //    'web_token': '"+webToken+@"'
        //}

       , 'targetSelector': '#Toolbar_functionBarOnlineService',
    });

}

 

//$(function () {
//    var count = $("#Toolbar_functionBarOnlineService").length;
//    if (count > 0) {
//        var guid = eci.guid();
//        init({ trueName: "AAA0001", companyCode: "0001-teeee", companyName: guid });
//    }
//})