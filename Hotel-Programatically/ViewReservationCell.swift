//
//  ViewReservationCell.swift
//  Hotel-Programatically
//
//  Created by Ion Sebastian Rodriguez Lara on 09/05/23.
//

import UIKit

class ViewReservationCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    -----------------------------------------------------------------------------
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//      super.init(style: style, reuseIdentifier: reuseIdentifier)
//      let vStackView = VerticalStackView(arrangedSubviews: [
//        emojiNameLabel,
//        emojiDescriptionLabel
//      ], spacing: 0, alignment: .fill,distribution: .fill)
//
//      let hStackView = HorizontalStackView(arrangedSubviews: [
//        emojiSymbolLabel, vStackView
//      ], spacing: 16, alignment: .fill, distribution: .fill)
//
//      contentView.addSubview(hStackView)
//      hStackView.matchParent(padding: .init(top: 8, left: 16, bottom: 8, right: 16))
//    }
//
//    required init?(coder: NSCoder) {
//      fatalError("init(coder:) has not been implemented")
//    }
//
//    func update(with emoji: Emoji) {
//      emojiSymbolLabel.text = emoji.symbol
//      emojiNameLabel.text = emoji.name
//      emojiDescriptionLabel.text = emoji.description
//    }
}
