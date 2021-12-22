//
//  ViewController.swift
//  OpenCVPractice
//
//  Created by Tim on 2021/12/22.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    print(CVWrapper.openCVVersion())
    imageView.image = CVWrapper.detectParagraphArea(imageView.image!)
  }


}
