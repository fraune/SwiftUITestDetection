# UI Test Detection in Swift via Swizzling

## Description

This app demonstrates that a _single file_ in the UI test target can intercept the `XCUIApplication.launch()` method, then append environment variables via `launchEnvironment`.

## Explanation

Because UI tests do not set an environment variable that indicates they are running, you would normally need to add some code to the setup of every UI test class to accomplish this (cumbersome).

Instead, we can use Swizzling to swap the implementation of the `launch()` method, with one that we write ourselves. Then we can resume normal execution by calling the original one.

It requires adding one Objective-C file (and letting Xcode generate the bridging header if necessary). ObjC is chosen for this task over Swift, because ObjC's `+load` method is called as soon as the test bundle is loaded. Alternatively with Swift, file properties seem to be loaded a bit more casually, so the Swizzler wouldn't run for me before the app had launched.

## Demonstration

This demonstration shows that when the app is launched normally, the `UI_Test` environment variable is `nil` (which I coalesce to the String, "false"). However, when the UI tests run, they verify that the `UI_Test` environment variable is set to the String "true".

You can notice that the UI test classes are simply launched without setting any environment variables — though you could still add your own if you like!
