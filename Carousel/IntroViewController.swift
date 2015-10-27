//
//  IntroViewController.swift
//  Carousel
//
//  Created by Rujia He on 10/25/15.
//


import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tileOneView: UIImageView!
    @IBOutlet weak var tileTwoView: UIImageView!
    @IBOutlet weak var tileThreeView: UIImageView!
    @IBOutlet weak var tileFourView: UIImageView!
    @IBOutlet weak var tileFiveView: UIImageView!
    @IBOutlet weak var tileSixView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 1136)
            }
}
