var language = $("head").attr("lang");
if (language == undefined) { language = "zh-cn"; }

var webPath = $("head").attr("VirtualPath");
if (webPath == undefined) { webPath = "../.."; }
 
document.write("<script src='" + webPath + "/Scripts/lang/" + language + ".js?v=1111'><" + "/script>")







