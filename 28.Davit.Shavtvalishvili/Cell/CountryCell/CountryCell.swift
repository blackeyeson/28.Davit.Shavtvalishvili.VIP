//
//  CountryCell.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 29.08.22.
//

import UIKit

final class CountryCell: UITableViewCell {
    // MARK: - Static Fields

    static var identifier: String { .init(describing: self) }
    // MARK: - Fields

    let countryLabel = UILabel()
    
    // MARK: - ObjectLifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods

    func configure(with model: CountryCellModel) {
        countryLabel.text = model.title
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        addSubview(countryLabel)
        countryLabel.anchor(left: leftAnchor, paddingLeft: 12)
    }
}
