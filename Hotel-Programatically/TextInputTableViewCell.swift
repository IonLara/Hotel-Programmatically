//
//  TextInputTableViewCell.swift
//  Hotel-Programatically
//
//  Created by Ion Sebastian Rodriguez Lara on 10/05/23.
//

import UIKit

class TextInputTableViewCell: UITableViewCell {

    
    let textField: UITextField = {
       let tf = UITextField()
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        textField.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    et textField: UITextField = {
//      let tf = UITextField()
//      tf.borderStyle = .roundedRect
//      return tf
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//      super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//      contentView.addSubview(textField)
//      textField.matchParent(padding: .init(top: 8, left: 16, bottom: 8, right: 16))
//    }
//
//    required init?(coder: NSCoder) {
//      fatalError("init(coder:) has not been implemented")
//    }
}
