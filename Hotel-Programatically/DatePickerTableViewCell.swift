//
//  DatePickerTableViewCell.swift
//  Hotel-Programatically
//
//  Created by Ion Sebastian Rodriguez Lara on 10/05/23.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell {

    let datePicker: UIDatePicker = {
      let dp = UIDatePicker()
        dp.preferredDatePickerStyle = .wheels
      return dp
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      contentView.addSubview(datePicker)
      datePicker.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
      datePicker.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

}
