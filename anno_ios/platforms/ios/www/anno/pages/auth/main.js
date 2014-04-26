require([
    "dojo/_base/declare",
    "dojo/dom",
    "dijit/registry",
    "dojo/dom-class",
    "dojox/app/main",
    "dojox/json/ref",
    "dojox/mobile/_ContentPaneMixin",
    "anno/common/DBUtil",
    "anno/common/Util",
    "anno/anno/AnnoDataHandler",
    "dojo/text!./app.json"
],
    function (declare, dom, registry, domClass, Application, jsonRef, _ContentPaneMixin, DBUtil, annoUtil, AnnoDataHandler, config)
    {
        var config = jsonRef.fromJson(config);
        console.log("Worked!");

        document.addEventListener("deviceready", function(){

            if (!annoUtil.hasConnection())
            {
                annoUtil.showMessageDialog("Please sign-up/sign-in when there is a connection.", function(){
                    navigator.app.exitApp();
                });
                return;
            }

            DBUtil.initDB(function(){
                console.error("DB is readay!");
                AnnoDataHandler.removeUser();

                annoUtil.readSettings(function(settings){
                    if (settings.ServerURL == null)
                    {
                        annoUtil.showLoadingIndicator();
                        annoUtil.inChina(function(inChina){
                            if (inChina)
                            {
                                annoUtil.chooseProxyServer();
                            }
                            else
                            {
                                annoUtil.setDefaultServer();
                            }

                            Application(config);
                            annoUtil.hideLoadingIndicator();
                        });
                    }
                    else
                    {
                        Application(config);
                    }
                });
            });
        }, false);

    });
