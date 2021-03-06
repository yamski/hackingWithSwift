//
//  DetailViewController.swift
//  Project1
//
//  Created by JOHN YAM on 4/16/15.
//  Copyright (c) 2015 John Yam. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

   

    @IBOutlet weak var detailImageView: UIImageView!

    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let imageView = self.detailImageView {
                imageView.image = UIImage(named: detail as! String)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.configureView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "shareTapped")
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
        println("view will disappear")
    }
    
    func shareTapped() {
        // acitivity items are the things we want to share
        // applicationAcitivites is an array of any of our own app's services you want to make sure are in the list
        
        let vc = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: [])
        presentViewController(vc, animated: true, completion: nil)
        
        // Alternate, Social way of posting to Facebook
//        let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
//        vc.setInitialText("Look at this great picture!")
//        vc.addImage(detailImageView.image!)
//        vc.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
//        presentViewController(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

