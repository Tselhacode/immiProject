//
//  Utilities.swift
//  immi
//
//  Created by user217004 on 3/19/22.
//

import UIKit

class Utilities {
    func inputContainerView(withImage image:UIImage, text:UITextField) -> UIView {
        let view = UIView()
        let iv = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        iv.image = image
        view.addSubview(iv)
        iv.anchor(left:view.leftAnchor,bottom:view.bottomAnchor,paddingLeft:8,paddingBottom:8)
        iv.setDimensions(width: 24, height: 24)
        
        view.addSubview(text)
        text.anchor(left:iv.rightAnchor, bottom: view.bottomAnchor,right: view.rightAnchor,paddingLeft: 8,paddingBottom:8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        view.addSubview(dividerView)
        dividerView.anchor(left:view.leftAnchor,bottom:view.bottomAnchor,right: view.rightAnchor, paddingLeft:8, height: 0.75)
        return view
    }
    
    //for login textfields
    func textField(withPlaceholder placeholder : String) -> UITextField {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = .white
        tf.attributedPlaceholder = NSAttributedString(string: placeholder,attributes:[NSAttributedString.Key.foregroundColor:UIColor.white])
        return tf
    }
    
    func attributedButton(_ firstPart: String, _ secondPart: String) -> UIButton {
        let button = UIButton(type:.system)
        
        let attributedTitle = NSMutableAttributedString(string: firstPart, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize:16),NSAttributedString.Key.foregroundColor:UIColor.white])
        
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize:16),NSAttributedString.Key.foregroundColor:UIColor.white]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }
}
