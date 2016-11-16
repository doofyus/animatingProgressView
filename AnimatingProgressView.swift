//
//  AnimatingProgressView.swift
//
//  Created by Mikk Rätsep on 14/11/2016.
//  Copyright © 2016 Mikk Rätsep. All rights reserved.
//

import UIKit


class AnimatingProgressView: UIProgressView {

    func startProgressing(duration: TimeInterval, resetProgress: Bool, completion: @escaping (Void) -> Void) {
        stopProgressing()

        // Reset to 0
        progress = 0.0
        layoutIfNeeded()

        // Set the 'destination' progress
        progress = 1.0

        // Animate the progress
        UIView.animate(withDuration: duration, animations: {
            self.layoutIfNeeded()

        }) { finished in
            // Remove this guard-block, if you want the completion to be called all the time - even when the progression was interrupted
            guard finished else { return }

            if resetProgress { self.progress = 0.0 }

            completion()
        }
    }

    func stopProgressing() {
        // Because the 'track' layer has animations on it, we'll try to remove them
        layer.sublayers?.forEach { $0.removeAllAnimations() }
    }
}

