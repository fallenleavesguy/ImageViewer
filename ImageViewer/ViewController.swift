//
//  ViewController.swift
//  ImageViewer
//
//  Created by Craig Grummitt on 22/04/2016.
//  Copyright © 2016 Craig Grummitt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
  
    @IBOutlet weak var imageView: UIImageView!
    let images = ["CradleMountain.JPG", "Laguna69.JPG", "PatagoniaSky.JPG"]
    var imageNo = 0
    override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        tapGestureRecognizer.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        imageView.center =  CGPoint(
            x: imageView.center.x + translation.x,
            y: imageView.center.y + translation.y
        )
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    @IBAction func handlePinch(_ sender: UIPinchGestureRecognizer) {
        imageView.transform = imageView.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }
    @IBAction func handleRotation(_ sender: UIRotationGestureRecognizer) {
        imageView.transform = imageView.transform.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        imageNo += 1
        if imageNo == images.count { imageNo = 0}
        imageView.image = UIImage(named: images[imageNo])
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

