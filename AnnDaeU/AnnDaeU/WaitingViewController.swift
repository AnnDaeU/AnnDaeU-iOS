//
//  WaitingViewController.swift
//  AnnDaeU
//
//  Created by 이민아 on 2023/04/24.
//

import UIKit
import SnapKit

class WaitingViewController: UIViewController {
    private let uploadImage : UIImage
    
    private let imageView = UIImageView()
    
    init(uploadImage: UIImage) {
        self.uploadImage = uploadImage
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    private lazy var loadingImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "loading")
        return imageView
    }()
    
    private lazy var loadingLabel : UILabel = {
        let label = UILabel()
        label.text = "분석 중 입니다..."
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-Medium", size: 24.0)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
        imageView.image = uploadImage
    }
}

extension WaitingViewController {
    func setupLayout(){
        [imageView, loadingImageView, loadingLabel].forEach{view.addSubview($0)}
        
        imageView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(100.0)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.width.equalTo(180.0)
            $0.height.equalTo(200.0)
            }
        loadingImageView.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.bottom).offset(30.0)
            $0.centerX.equalTo(imageView)
            $0.width.equalTo(70.0)
            $0.height.equalTo(80.0)
        }
        loadingLabel.snp.makeConstraints{
            $0.top.equalTo(loadingImageView.snp.bottom).offset(20.0)
            $0.centerX.equalTo(imageView)
        }
    }
}
