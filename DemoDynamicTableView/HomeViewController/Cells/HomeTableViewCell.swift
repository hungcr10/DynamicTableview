
import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    private func setUp() {
        avatarImgView.layer.cornerRadius = avatarImgView.frame.height / 1.5
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
  
}
