//
//  SwitchTableViewCell.swift
//  Hotel-Programatically
//
//  Created by Ion Sebastian Rodriguez Lara on 10/05/23.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    let label: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 17)
        tl.text = "Wi-Fi"
        return tl
    }()
    let price: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 17)
        tl.text = "$10 per day"
        return tl
    }()
    
    let wifiSwitch: UISwitch = UISwitch()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(price)
        contentView.addSubview(wifiSwitch)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
        wifiSwitch.translatesAutoresizingMaskIntoConstraints = false
        wifiSwitch.widthAnchor.constraint(equalToConstant: 32).isActive = true
        wifiSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
        wifiSwitch.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
        price.translatesAutoresizingMaskIntoConstraints = false
        price.widthAnchor.constraint(equalToConstant: 90).isActive = true
        price.trailingAnchor.constraint(equalTo: wifiSwitch.leadingAnchor, constant: -10).isActive = true
        price.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
