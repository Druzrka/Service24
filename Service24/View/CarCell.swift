//
//  CarCell.swift
//  Service24
//
//  Created by Захар on 26.09.17.
//  Copyright © 2017 Захар. All rights reserved.
//

import UIKit

class CarCell: UITableViewCell {

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var mark: UILabel!
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var viewForCell: UIView!
    
    override func awakeFromNib() {
        setBorderForView(width: 1, color: UIColor.lightGray, cornerRadius: 10)
    }
    
    func updateCell(car: Car) {
        id.text = String(car.id)
        model.text = car.model
        mark.text = car.mark
        code.text = car.vinCode
        number.text = car.number
    }
    
    func setBorderForView(width: CGFloat, color: UIColor, cornerRadius: CGFloat) {
        viewForCell.layer.borderWidth = width
        viewForCell.layer.borderColor = color.cgColor
        viewForCell.layer.cornerRadius = cornerRadius
    }
}
