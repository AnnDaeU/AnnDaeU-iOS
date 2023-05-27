//
//  ViewController.swift
//  AnnDaeU
//
//  Created by 이민아 on 2023/04/23.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    private lazy var logoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo-2")
        return imageView
    }()
    
    private lazy var mainLabelStack1 : UIStackView = {
        let annLabel = UILabel()
        annLabel.text = "안"
        annLabel.textColor = UIColor(named: "adu-pink")
        annLabel.font = UIFont(name: "Pretendard-ExtraBold", size: 30.0)
        
        let meonLabel = UILabel()
        meonLabel.text = "면   "
        meonLabel.textColor = .white
        meonLabel.font = UIFont(name: "Pretendard-Bold", size: 18.0)
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 1.0
        [annLabel, meonLabel].forEach{stackView.addArrangedSubview($0)}
        return stackView
    }()

    private lazy var mainLabelStack2 : UIStackView = {
        let daeLabel = UILabel()
        daeLabel.text = "대"
        daeLabel.textColor = .lightGray
        daeLabel.font = UIFont(name: "Pretendard-ExtraBold", size: 30.0)
        
        let chingIsLabel = UILabel()
        chingIsLabel.text = "칭 is"
        chingIsLabel.textColor = .white
        chingIsLabel.font = UIFont(name: "Pretendard-Bold", size: 18.0)
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 1.0
        [daeLabel, chingIsLabel].forEach{stackView.addArrangedSubview($0)}
        return stackView
    }()
    
    private lazy var mainLabel : UILabel = {
        let label = UILabel()
        label.text = "YOU"
        label.textColor = UIColor(named: "adu-pink")
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 30.0)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        //stackView.distribution = .equalSpacing
        stackView.spacing = 2.0
        [mainLabelStack1,mainLabelStack2,mainLabel].forEach{stackView.addArrangedSubview($0)}
        return stackView
    }()
    private var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "안 대 유"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 20.0)
        return label
    }()
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "아이디", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.font = UIFont(name: "Pretendard-Light", size: 18.0)
        textField.textColor = .white
        textField.backgroundColor = UIColor(named: "adu-blue")
        textField.delegate = self
        return textField
    }()
    
    private lazy var underLineView1: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .white
        return lineView
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Pretendard-Light", size: 18.0)
        textField.isSecureTextEntry = true //비밀번호는 보이지 않게
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textColor = .white
        textField.backgroundColor = UIColor(named: "adu-blue")
        textField.delegate = self
        return textField
    }()
    
    private lazy var underLineView2: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .white
        return lineView
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor(named: "adu-blue"), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 18.0)
        button.backgroundColor = .white
        button.layer.cornerRadius = 18
        button.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("처음이에요!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 18.0)
        button.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "adu-blue")
        setupLayout()
    }
}

extension LoginViewController {
    func setupLayout(){
        [logoImageView,stackView,nameLabel,idTextField,underLineView1,passwordTextField,underLineView2,loginButton,signUpButton].forEach{view.addSubview($0)}
        
        let inset : CGFloat = 20.0
        
        logoImageView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
            $0.leading.equalToSuperview().inset(inset)
            $0.width.equalTo(49.0)
            $0.height.equalTo(40.0)
        }
        stackView.snp.makeConstraints{
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.top.equalTo(logoImageView.snp.bottom).offset(80.0)
        }
        nameLabel.snp.makeConstraints{
            $0.top.equalTo(stackView.snp.bottom).offset(80.0)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
        idTextField.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(140.0)
            $0.leading.equalTo(logoImageView)
            $0.trailing.equalToSuperview().inset(inset)
        }
        underLineView1.snp.makeConstraints{
            $0.top.equalTo(idTextField.snp.bottom).offset(5.0)
            $0.leading.equalTo(logoImageView)
            $0.trailing.equalTo(idTextField)
            $0.height.equalTo(1.0)
        }
        passwordTextField.snp.makeConstraints{
            $0.top.equalTo(underLineView1.snp.bottom).offset(inset)
            $0.leading.equalTo(logoImageView)
            $0.trailing.equalToSuperview().inset(inset)
        }
        underLineView2.snp.makeConstraints{
            $0.top.equalTo(passwordTextField.snp.bottom).offset(5.0)
            $0.leading.equalTo(passwordTextField)
            $0.trailing.equalTo(passwordTextField)
            $0.height.equalTo(1.0)
        }
        loginButton.snp.makeConstraints{
            $0.top.equalTo(underLineView2.snp.bottom).offset(30.0)
            $0.leading.equalTo(passwordTextField)
            $0.trailing.equalTo(passwordTextField)
            $0.height.equalTo(45.0)
        }
        signUpButton.snp.makeConstraints{
            $0.top.equalTo(loginButton.snp.bottom).offset(inset)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    //return -> 키보드 내려가도록
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if idTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false {
            loginButton.isUserInteractionEnabled = true
            loginButton.titleLabel?.textColor = UIColor(named: "adu-blue")
        } //문제점: enter를 눌러야 활성화됨
    }
}

extension LoginViewController {
    @objc func goToHome(){
        let home = HomeViewController()
        home.modalPresentationStyle = .fullScreen //화면이 보여지는 방식
        home.modalTransitionStyle = .crossDissolve //화면 전환 애니메이션
        
        present(home, animated: true)
        
        if presentedViewController == home {
            presentingViewController?.dismiss(animated: true)
        }
    }
    
    @objc func goToSignUp(){
        let vc = AfterSignUpViewController()
        vc.modalPresentationStyle = .fullScreen //화면이 보여지는 방식
        vc.modalTransitionStyle = .crossDissolve //화면 전환 애니메이션
        
        present(vc, animated: true)
        
        if presentedViewController == vc {
            presentingViewController?.dismiss(animated: true)
        }
    }
}

