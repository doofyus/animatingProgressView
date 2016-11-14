//
//  AnimatingProgressView.swift
//
//  Created by Mikk Rätsep on 14/11/2016.
//  Copyright © 2016 Mikk Rätsep. All rights reserved.
//

import UIKit


class AnimatingProgressView: UIProgressView {

    func startProgressing(duration: TimeInterval, completion: @escaping (Void) -> Void) {
        stopProgressing()

        // Reset to 0
        setProgress(0.0, animated: false)

        // Otherwise the progress doesn't get reset to 0
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration, animations: {
                self.setProgress(1.0, animated: true)
            }) { finished in
                guard finished else { return }

                completion()
            }
        }
    }

    func stopProgressing() {
        // Because the 'track' layer has animations on it, we'll try to remove them
        layer.sublayers?.forEach { $0.removeAllAnimations() }
    }
}

