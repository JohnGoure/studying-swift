//
//  ViewController.swift
//  ISpy
//
//  Created by john goure on 5/18/18.
//  Copyright © 2018 john goure. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.delegate = self
        updateZoomFor(size: view.bounds.size)
    }
    
    @IBOutlet weak var behanceImageView: UIImageView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return behanceImageView
    }
    
    func updateZoomFor(size: CGSize) {
        let widthScale = size.width / behanceImageView.bounds.width
        let heightScale = size.height / behanceImageView.bounds.height
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

