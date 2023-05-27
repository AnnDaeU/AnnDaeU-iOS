//
//  InitViewController.swift
//  AnnDaeU
//
//  Created by 이민아 on 2023/04/24.
//

import UIKit

class AfterSignUpViewController: UIViewController {
    
    private lazy var logoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()

    private lazy var nameStack: UIStackView = {
        let nameLabel = UILabel()
        nameLabel.text = "한소희"
        nameLabel.textColor = UIColor(named: "adu-pink")
        nameLabel.font = UIFont(name: "Pretendard-ExtraBold", size: 30.0)

        let nimLabel = UILabel()
        nimLabel.text = "님"
        nimLabel.textColor = .black
        nimLabel.font = UIFont(name: "Pretendard-ExtraBold", size: 30.0)
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 3.0
        [nameLabel, nimLabel].forEach{stackView.addArrangedSubview($0)}
        return stackView
    }()
    

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "환영합니다"
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 30.0)
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("진단 시작", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "adu-blue")
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size:25.0)
        button.addTarget(self, action: #selector(openGallery), for: .touchUpInside)

        button.widthAnchor.constraint(equalToConstant: 190).isActive = true
        button.heightAnchor.constraint(equalToConstant: 190).isActive = true
        button.layer.cornerRadius = 95
        button.clipsToBounds = true
        
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 3.0
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowRadius = 95
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private lazy var imagePickerViewController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true //수정권한 추가
        imagePickerController.delegate = self
        
        return imagePickerController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

}

extension AfterSignUpViewController {
    func setupLayout(){
        [logoImageView, nameStack,welcomeLabel, startButton].forEach{view.addSubview($0)}
        
        let inset: CGFloat = 20.0
        
        logoImageView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
            $0.leading.equalToSuperview().inset(inset)
            $0.width.equalTo(49.0)
            $0.height.equalTo(40.0)
        }
        nameStack.snp.makeConstraints{
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.top.equalTo(logoImageView.snp.bottom).offset(150.0)
        }
        welcomeLabel.snp.makeConstraints{
            $0.centerX.equalTo(nameStack)
            $0.top.equalTo(nameStack.snp.bottom).offset(1.0)
        }
        startButton.snp.makeConstraints{
            $0.centerX.equalTo(welcomeLabel)
            $0.bottom.equalToSuperview().inset(100.0)
        }
    }
}

extension AfterSignUpViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectImage: UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            selectImage = editedImage
        }//info: pick한 정보를 가지고 있는 딕셔너리
        else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            selectImage = originalImage
        }
        
        print(selectImage)
        
        picker.dismiss(animated: true) { [weak self] in //메모리위해 ..뒤에 self?
            let waitingViewController = WaitingViewController(uploadImage: selectImage ?? UIImage())
            let navigationController = UINavigationController(rootViewController: waitingViewController)
            navigationController.modalPresentationStyle = .fullScreen
            
            self?.present(navigationController, animated: true)
            
        }//imagePicker 창닫고, completion: 대기창으로 넘김
    }
}


extension AfterSignUpViewController {
    //일단은 아이폰 시스템 갤러리로 연결
    @objc func openGallery(){
        present(imagePickerViewController, animated: true)
    }
}
