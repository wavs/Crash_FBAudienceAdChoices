# Crash_FBAudienceAdChoices
Test project to reproduce a Facebook Audience iOS SDK crash related to FBAdChoicesView.

## Steps to reproduce:

1. Search the string "YOUR_PLACEMENT_ID_HERE" and replace it with your test placement ID from Facebook Audience.
2. Build and launch the project on iOS 9 device/simulator.
3. When the native ad is displayed, click on the AdChoices icon in the upper right corner.
4. It should display a webview, click on "OK" to dismiss it.
5. Normally, it should crash after 1 or 2 seconds with this type of stacktrace:

```
#0	0x228cdc84 in __pthread_kill ()
#11	0x22b68c88 in _CF_forwarding_prep_0 ()
#12	0x0012c644 in __62-[FBAdSafariDelegateTranslator safariViewControllerDidFinish:]_block_invoke at /Users/dzhuowen/src/ads/src/FBAudienceNetwork/FBAudienceNetwork/internal/FBAdSafariViewController.m:159
#13	0x01378cbe in _dispatch_call_block_and_release ()
#24	0x26e35fb4 in UIApplicationMain ()
#25	0x001092a4 in main
```

and this log in console:

```
-[FBAdChoicesView viewControllerDismissed:]: unrecognized selector sent to instance 0x16dce9f0
*** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[FBAdChoicesView viewControllerDismissed:]: unrecognized selector sent to instance 0x16dce9f0'
```
