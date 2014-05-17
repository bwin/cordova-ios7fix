# cordova-ios7fix

Cordova plugin to suppress scrolling of the webview.

In a SPA IOS7's (at least without body-scrolling and instead with `-wekbit-overflow-stlye: touch;` on divs) scrolling is a PITA. This plugin tries to prevent scrolling of the WebView itself.

## config-values

### IOS7PreventWebViewScrolling [boolean; default:false]
Enable this plugin with:

```
	<preference name="IOS7PreventWebViewScrolling" value="true"/>
```

## License
The MIT License (MIT)