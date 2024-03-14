/*
 Copyright (C) 2017 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 A NSViewController subclass showing how to use IBActions to manipulate a view.
 */

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var dotView: DotView!

    // radiusChanged(_:) is an action method which lets you change the radius of the dot.
    // A possible optimization is to check to see if the old and new value is the same,
    // and not do anything if so.
    @IBAction func radiusChanged(_ sender: NSSlider) {
        dotView.radius = CGFloat(sender.doubleValue)
    }

    // colorChanged(_:) is an action method which lets you change the color of the dot.
    // A possible optimization is to check to see if the old and new value is the same,
    // and not do anything if so.
    @IBAction func colorChanged(_ sender: NSColorWell) {
        dotView.color = sender.color
    }

    // The recommended way to handle events is to override NSResponder (superclass
    // of NSView) methods in the NSView subclass. One such method is mouseUp(with:).
    // These methods get the event as the argument. The event has the mouse
    // location in window coordinates; use convert(_:from:) (with "nil"
    // as the view argument) to convert this point to view coordinates local
    // to dotView.
    //
    // Note that once we set the new center, needsDisplay is set to true in the center
    // property's didSet observer to mark that the view needs to be redisplayed (which
    // is done automatically by AppKit).
    override func mouseUp(with event: NSEvent) {
        let eventLocation = event.locationInWindow
        dotView.center = dotView.convert(eventLocation, from: nil)
    }
}
