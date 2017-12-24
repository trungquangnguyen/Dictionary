//
//  OxFordTopCollectionViewCell.swift
//  DictionaryIOS
//
//  Created by SSD on 12/18/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit
protocol OxFordTopCollectionViewCellDelegate {
    func didSelectSpeakerButton(urlString: String)
}

class OxFordTopCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelSpelling: UILabel!
    @IBOutlet weak var buttonSpeaker: UIButton!
    
    var delegate: OxFordTopCollectionViewCellDelegate!
    var prounication: PronuncationViewModel!{
        didSet{
            labelSpelling.text = prounication.spelling
            buttonSpeaker.isSelected = !prounication.isAmericanVoice
        }
    }

    @IBAction func speakerAction(_ sender: Any) {
        delegate.didSelectSpeakerButton(urlString: prounication.pronounce)
    }
}

extension OxFordTopCollectionViewCell {
    fileprivate func setFont(){
        labelSpelling.setSize12_black()
    }
}
