//
//  StepperTableViewCell.swift
//  Hotel-Programatically
//
//  Created by Ion Sebastian Rodriguez Lara on 10/05/23.
//

import UIKit

class StepperTableViewCell: UITableViewCell {

    let label: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 17)
        return tl
    }()
    let number: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 17)
        tl.text = "0"
        return tl
    }()
    
    let stepper: UIStepper = UIStepper()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(number)
        contentView.addSubview(stepper)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.widthAnchor.constraint(equalToConstant: 32).isActive = true
        stepper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -75).isActive = true
        stepper.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
        number.translatesAutoresizingMaskIntoConstraints = false
        number.widthAnchor.constraint(equalToConstant: 32).isActive = true
        number.trailingAnchor.constraint(equalTo: stepper.leadingAnchor, constant: -10).isActive = true
        number.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
