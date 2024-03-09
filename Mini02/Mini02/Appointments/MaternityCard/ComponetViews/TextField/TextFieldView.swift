import UIKit

class TextView: UIView{
    
    static let id = "TextViewCell"
    let query = "textView"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let viewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.34)

    lazy var textView: UITextView = {
       let tv = TextViewComponet()
        tv.setupTextView()
        return tv
    }()
    
    let contentBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor.notQuiteWhite()
        
        view.layer.borderWidth = 2 // Adjust the width as needed
        view.layer.borderColor = UIColor.darkPink().cgColor // Change color as needed
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        self.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor)
        
        self.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: self.topAnchor, topPadding: 40, width: screenSize.width * 0.9, height: screenSize.height * 0.3)
        contentBackGround.centerX(inView: self)
        
        // Add textField to contentBackGround
        self.addSubview(textView)
        
        textView.anchorWithMultiplayerValues(top: contentBackGround.topAnchor, width: screenSize.width * 0.8, height: screenSize.height * 0.3)
        textView.centerX(inView: contentBackGround)
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
