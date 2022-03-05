//
//  File.swift
//  gcmidi-proj
//
//  Created by garrepi on 3/4/22.
//

// feel like i'm wasting time...

import Foundation

var midiClient: MIDIClientRef = MIDIClientRef()
var midiEndpoint: MIDIEndpointRef = MIDIEndpointRef()

struct Device {
    let handle: IOHIDDevice
    let n_axes: Int
}

func setupMidi() {
    MIDIClientCreate("game controller" as CFString, nil, nil, &midiClient)
    MIDISourceCreateWithProtocol(midiClient, "game controller" as CFString, ._1_0, &midiEndpoint)
}

func setupController() {
    
}

func setup() {
    setupMidi()
    setupController()
}
