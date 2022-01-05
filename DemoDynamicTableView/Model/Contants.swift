//
//  File.swift
//  DemoDynamicTableView
//
//  Created by CristianoDaoHung on 02/01/2022.
//

import Foundation
struct Contants {
    static let identifier = "HomeTableCell"
    static let nibName = "HomeTableViewCell"
    static var contactDatasources: [Contact] = [Contact(name: "Dao Hung", phone: "092828", avt: #imageLiteral(resourceName: "hung")),
                                                Contact(name: "Nam Phu", phone: "0917618517", avt: #imageLiteral(resourceName: "toan")),
                                                Contact(name: "Van Kiet", phone: "0917618517", avt: #imageLiteral(resourceName: "hoang")),
                                                Contact(name: "Anh Pham", phone: "0917618517", avt: #imageLiteral(resourceName: "kiet")),
                                                Contact(name: "Anh Tran", phone: "0917618517", avt: #imageLiteral(resourceName: "kiet")),
                                                Contact(name: "Bao Nam", phone: "0917618517", avt: #imageLiteral(resourceName: "toan")),
                                                Contact(name: "Bao Tin", phone: "0917618517", avt: #imageLiteral(resourceName: "duy")),
                                                Contact(name: "Giao Thuy", phone: "0917618517", avt: #imageLiteral(resourceName: "phu")),
                                                Contact(name: "Kha Le", phone: "0917618517", avt: #imageLiteral(resourceName: "hoang")),
                                                Contact(name: "Le Tin", phone: "0917618517", avt: #imageLiteral(resourceName: "duy")),
                                                Contact(name: "Nam Nguyen", phone: "0917618517", avt: #imageLiteral(resourceName: "kiet")),
                                                Contact(name: "Mai Ho", phone: "0917618517", avt: #imageLiteral(resourceName: "hoang"))]
}
struct CellActionImage {
    static let pinImg = "pin.fill"
    static let favoriteImg = "star.fill"
    static let trashImg = "trash.fill"
    static let messageImg = "message.fill"
    static let videoCallImg = "video.fill"
    static let moreImg = "ellipsis"
}
