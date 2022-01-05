
import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    private func setUp() {
        avatarImgView.layer.cornerRadius = avatarImgView.frame.height / 1.5
        phoneImage.image = UIImage(systemName: "phone.circle.fill")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    public func configure(with model: Contacts) {
        self.avatarImgView.image = model.avt
        self.phoneLabel.text = model.phone
        self.nameLabel.text = model.name
    }
}
