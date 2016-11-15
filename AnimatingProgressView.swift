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
        setProgress(0.0, animated: false)
        setNeedsLayout()

        // Animate the progress
        UIView.animate(withDuration: duration) {
            self.setProgress(1.0, animated: true)
        }

        // Call the completion after the time is up
        DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now() + duration)) {
            if resetProgress { self.progress = 0.0 }

            completion()
        }
    }

    func stopProgressing() {
        // Because the 'track' layer has animations on it, we'll try to remove them
        layer.sublayers?.forEach { $0.removeAllAnimations() }
    }
}

