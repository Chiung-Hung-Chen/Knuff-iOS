//
//  SuccessView.swift
//  Knuff
//
//  Created by Simon Blommegard on 01/04/15.
//  Copyright (c) 2015 Bowtie. All rights reserved.
//

import UIKit
import Snap

class SuccessView: UIView {
  
  let titleLabel: UILabel
  let pulseView: DevicePulseView
  let checkView: InstructionStepView
  let infoLabel: UILabel
  
  override init(frame: CGRect) {
    titleLabel = UILabel()
    pulseView = DevicePulseView(state: PulseViewState.Success)
    checkView = InstructionStepView(title: "You are broadcasting your device", badgeString: nil)
    infoLabel = UILabel()
    
    super.init(frame: frame)
    
    titleLabel.text = "Push galore!"
    titleLabel.font = UIFont(name: "OpenSans-Bold", size: 18)
    titleLabel.textColor = UIColor(hex: 0xF7F9FC, alpha: 1)
    addSubview(titleLabel)
    
    addSubview(pulseView)
    
    checkView.badge.imageCircleContent = UIImage(named: "Check")
    addSubview(checkView)
    
    
    let deviceName = UIDevice.currentDevice().name
    infoLabel.text = "To recieve push notifications from your computer just select \"\(deviceName)\" in the device list and tap the home button."
    infoLabel.font = UIFont(name: "OpenSans-Light", size: 12)
    infoLabel.textColor = UIColor(white: 1, alpha: 1)
    infoLabel.textAlignment = NSTextAlignment.Center
    infoLabel.numberOfLines = 0
    infoLabel.preferredMaxLayoutWidth = 300
    addSubview(infoLabel)
    
    self.setTranslatesAutoresizingMaskIntoConstraints(false)
  }

  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  override func updateConstraints() {
    super.updateConstraints()
    
    titleLabel.snp_remakeConstraints({ make in
      make.top.centerX.equalTo(self)
      make.right.lessThanOrEqualTo(self)
    })
    
    pulseView.snp_remakeConstraints({ make in
      make.top.equalTo(self.titleLabel.snp_bottom).offset(20)
      make.centerX.equalTo(self)
      make.right.lessThanOrEqualTo(self)
    })
    
    checkView.snp_remakeConstraints({ make in
      make.top.equalTo(self.pulseView.snp_bottom).offset(20)
      make.centerX.equalTo(self)
      make.right.lessThanOrEqualTo(self)
    })
    
    infoLabel.snp_remakeConstraints({ make in
      make.top.equalTo(self.checkView.snp_bottom).offset(20)
      make.bottom.centerX.equalTo(self)
      make.right.lessThanOrEqualTo(self)
    })
  }
}
