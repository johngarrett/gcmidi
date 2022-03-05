//
//  Take2.swift
//  gcmidi-proj
//
//  Created by garrepi on 3/4/22.
//

import Foundation
import GameController

private var gamePadCurrent: GCController?
private var gamePadLeft: GCControllerDirectionPad?
private var gamePadRight: GCControllerDirectionPad?

func registerGameController(_ gameController: GCController) {
    var buttonA: GCControllerButtonInput?
    var buttonB: GCControllerButtonInput?
    var rightTrigger: GCControllerButtonInput?

    if let gamepad = gameController.extendedGamepad {
        gamePadLeft = gamepad.leftThumbstick
        gamePadRight = gamepad.rightThumbstick
        buttonA = gamepad.buttonA
        buttonB = gamepad.buttonB
        rightTrigger = gamepad.rightTrigger
    } else if let gamepad = gameController.microGamepad {
        gamePadLeft = gamepad.dpad
        buttonA = gamepad.buttonA
        buttonB = gamepad.buttonX
    }
    
    buttonA?.valueChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
        print("jump")
    }

    buttonB?.valueChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
        print("attack")
    }
    
    rightTrigger?.pressedChangedHandler = buttonB?.valueChangedHandler
}

func start() {
    guard let controller = GCController.controllers().first else {
        return
    }
    registerGameController(controller)
    
    while(true) {
        print(" ss")
        // do nothing
    }
}

start()
