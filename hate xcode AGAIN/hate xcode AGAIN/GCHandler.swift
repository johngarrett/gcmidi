//
//  GCController.swift
//  hate xcode AGAIN
//
//  Created by garrepi on 3/4/22.
//

import Foundation
import GameController

class GCHandler {
    private var gamePadCurrent: GCController?
    private var gamePadLeft: GCControllerDirectionPad?
    private var gamePadRight: GCControllerDirectionPad?
    
    init() {
        guard let controller = GCController.controllers().first else {
            return
        }
        registerGameController(controller)
        
        NotificationCenter.default.addObserver(
                self, selector: #selector(self.handleControllerDidConnect),
                name: NSNotification.Name.GCControllerDidBecomeCurrent, object: nil)

        NotificationCenter.default.addObserver(
            self, selector: #selector(self.handleControllerDidDisconnect),
            name: NSNotification.Name.GCControllerDidStopBeingCurrent, object: nil)
    }
    
    @objc
    func handleControllerDidConnect(_ notification: Notification) {
        print("Controller did connect")
        guard let gameController = notification.object as? GCController else {
            return
        }
        unregisterGameController()
        registerGameController(gameController)
    }

    @objc
    func handleControllerDidDisconnect(_ notification: Notification) {
        print("Controller did disconnect")
        unregisterGameController()
    }
    
    func registerGameController(_ gameController: GCController) {
        print("registerGameController")
        var buttonA: GCControllerButtonInput?
        var buttonB: GCControllerButtonInput?
        var rightTrigger: GCControllerButtonInput?

        if let gamepad = gameController.extendedGamepad {
            self.gamePadLeft = gamepad.leftThumbstick
            self.gamePadRight = gamepad.rightThumbstick
            buttonA = gamepad.buttonA
            buttonB = gamepad.buttonB
            rightTrigger = gamepad.rightTrigger
        } else if let gamepad = gameController.microGamepad {
            self.gamePadLeft = gamepad.dpad
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
    func unregisterGameController() {
        gamePadLeft = nil
        gamePadRight = nil
        gamePadCurrent = nil
    }
}
