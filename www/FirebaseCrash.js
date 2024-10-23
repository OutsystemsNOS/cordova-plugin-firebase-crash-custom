var exec = require("cordova/exec");
var PLUGIN_NAME = "FirebaseCrash";

module.exports = {
    forceCrash: function(message) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "forceCrash", []);
        });
    },
    log: function(message) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "log", [message]);
        });
    },
    logError: function(message) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "logError", [message]);
        });
    },
    setUserId: function(userId) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "setUserId", [userId]);
        });
    },
    setEnabled: function(enabled) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "setEnabled", [enabled]);
        });
    },
    setCustomKeys: function(keyname1, keyvalue1, keyname2, keyvalue2, keyname3, keyvalue3, keyname4, keyvalue4) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "setCustomKeys", [keyname1, keyvalue1, keyname2, keyvalue2, keyname3, keyvalue3, keyname4, keyvalue4]);
        });
    }
};
