import UIKit

class TextView: UIView, UITextViewDelegate{
    
    static let id = "TextViewCell"
    let query = "textView"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let viewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.34)
    
    private let placeholderText = "Digite suas notas aqui"
    private var isPlaceholderShown = true
    private var typedText: String?
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.returnKeyType = .done
        textView.autocapitalizationType = .sentences
        textView.isScrollEnabled = true
        textView.showsVerticalScrollIndicator = false
        textView.autocorrectionType = .default
        
        let bodyFont = UIFont.preferredFont(forTextStyle: .body)
        let scaledFontSize = bodyFont.pointSize * 1.1
        let signikaBoldFont = UIFont(name: "Signika-Bold", size: scaledFontSize)
        
        textView.font = signikaBoldFont
        
        return textView
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
        textView.delegate = self
        if typedText != nil {
            isPlaceholderShown = false
        }
        textView.text = typedText ?? placeholderText
        textView.textColor = .lightGray
        setupUI()
    }
    
    private func setupUI() {
        self.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor)
        
        self.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: self.topAnchor, topPadding: 40, width: screenSize.width * 0.9, height: screenSize.height * 0.3)
        contentBackGround.centerX(inView: self)
        
        // Add textField to contentBackGround
        contentBackGround.addSubview(textView)
        textView.anchorWithMultiplayerValues(top: contentBackGround.topAnchor, width: screenSize.width * 0.8, height: screenSize.height * 0.3)
        textView.centerX(inView: contentBackGround)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if isPlaceholderShown {
            textView.text = nil
            textView.textColor = UIColor.darkPink()
            isPlaceholderShown = false
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = .lightGray
            isPlaceholderShown = true
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        typedText = textView.text // Update typedText property when text changes
    }
    
    func getTypedText() -> String? {
        return typedText // Function to return the typed text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
