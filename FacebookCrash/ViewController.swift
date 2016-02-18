//
//  ViewController.swift
//  FacebookCrash
//
//  Created by athomas on 18/02/2016.
//  Copyright © 2016 Noname. All rights reserved.
//

import UIKit
import FBAudienceNetwork

class ViewController: UIViewController, FBNativeAdDelegate
{
    @IBOutlet weak var adView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var ctaButton: UIButton!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var socialContextLabel: UILabel!
    @IBOutlet weak var coverMediaView: FBMediaView!
    
    private var nativeAd: FBNativeAd?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Request native ad
        let ad = FBNativeAd(placementID: "YOUR_PLACEMENT_ID_HERE")
        ad.delegate = self
        ad.loadAd()
    }
    
    // MARK: FBNativeAdDelegate Protocol
    
    func nativeAdDidLoad(nativeAd: FBNativeAd)
    {
        self.titleLabel.text = nativeAd.title
        self.bodyLabel.text = nativeAd.body
        self.ctaButton .setTitle(nativeAd.callToAction, forState: .Normal)
        self.socialContextLabel.text = nativeAd.socialContext
        self.coverMediaView.nativeAd = nativeAd
        
        nativeAd.icon?.loadImageAsyncWithBlock
        {
            (image) -> Void in
            self.iconImageView.image = image
        }
        
        let adChoicesView = FBAdChoicesView(nativeAd: nativeAd, expandable: true)
        self.adView.addSubview(adChoicesView)
        adChoicesView.updateFrameFromSuperview()
        
        nativeAd.registerViewForInteraction(self.adView, withViewController: self, withClickableViews: [self.iconImageView, self.titleLabel, self.bodyLabel, self.ctaButton, self.socialContextLabel])
        
        self.adView.hidden = false
    }
    
    func nativeAd(nativeAd: FBNativeAd, didFailWithError error: NSError)
    {
        self.adView.hidden = true
    }
}
