//
//  ShipmentCellTableViewCell.swift
//  ShipmentsTracker
//
//  Created by Iorgers Almeida on 26/06/21.
//

import UIKit
import ShipmentsTrackerAdapters

class ShipmentCell: UITableViewCell {

    @IBOutlet weak var shipmentLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusImgView: UIImage!

    var shipmentInfo: ShipmentDetailsViewModel?{
        didSet{
            shipmentLabel.text = shipmentInfo?.identifier
            statusLabel.text = shipmentInfo?.status
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
