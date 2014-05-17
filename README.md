# cordova-ios7fix

Cordova plugin to suppress scrolling of the webview.

In a SPA IOS7's scrolling is a PITA (at least without body-scrolling and instead with `-wekbit-overflow-scrolling: touch;` on divs).
This plugin tries to prevent scrolling of the WebView itself, so the body shouldn't be able to scroll out of the viewport.
If you're having trouble with the whole document scrolling on form-field selection, maybe this will help.

## config-values

### IOS7PreventWebViewScrolling [boolean; default:false]
Enable this plugin with:

```
	<preference name="IOS7PreventWebViewScrolling" value="true"/>
```

## Motivation

I experienced problems developing an cordova-app for iOS 7. Cordova version 3.3, but I also couldn't fix it just with css/js/config.xml in 3.1.
These are the relevant html/css portions:
- `html` and `body` are set to `width: 100%; height: 100%; overflow: hidden;`.
- there is a header `div` with `position: absolute;` that acts as "fixed", because there is no body-scrolling.
- then there's a `div` with `overflow-x: hidden; overflow-y: scroll; -webkit-touch-scrolling: touch;` that's also absolute positioned and spans the rest of the available space.

When a form-field is selected these problems occur:
- iOS tries to scroll the webview to get the input-element into view. Except it already was and I explicitly doesn't want that to happen (because it scrolls the full-width-full-height-body out of the viewport).
- When the scrollable div is scrolled all the way to the bottom end and you scroll down (swipe up) again the whole body scrolls.
- If you swipe up on the header it's basically the same as above.

## License
The MIT License (MIT)
