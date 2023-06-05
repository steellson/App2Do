//
//  TDCell.swift
//
//  Created by Steellson


import UIKit
import SnapKit

final class TDCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    static let cellId = R.Strings.tdCellReuseIdentifier.rawValue
    
    private var textLabel: UILabel = {
        let label = UILabel()
        label.font = .chalkboard18
        label.textColor = R.Colors.specialWhiteColor
        return label
    }()
    
    private let checkmarkView: UIView = {
        let view = UIView()
        view.makeBorder(of: 1)
        view.layer.cornerRadius = 6
        view.backgroundColor = R.Colors.deepGrayBackgroundColor
        return view
    }()
    
    private var checkmark: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.Images.isDoneMarkImage
        imageView.tintColor = R.Colors.specialWhiteColor
        return imageView
    }()
    
    private var deleteMarkView: UIView = {
        let view = UIView()
        view.makeBorder(of: 1)
        view.layer.cornerRadius = 6
        view.backgroundColor = R.Colors.specialPinkColor
        view.isHidden = true
        return view
    }()
    
    private var deleteMark: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.Images.deleteMarkImage
        imageView.tintColor = R.Colors.deepGrayBackgroundColor
        return imageView
    }()
    
    private var editMarkView: UIView = {
        let view = UIView()
        view.makeBorder(of: 1)
        view.layer.cornerRadius = 6
        view.backgroundColor = R.Colors.specialLimeColor
        view.isHidden = true
        return view
    }()
    
    private var editMark: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.Images.editmarkImage
        imageView.tintColor = R.Colors.deepGrayBackgroundColor
        return imageView
    }()
    
    private var editLongGesture: UILongPressGestureRecognizer!
    
    private var isDone: Bool = false {
        didSet {
            if isDone {
                checkmarkView.backgroundColor = R.Colors.specialBlueColor
                checkmark.isHidden = false
            } else {
                checkmarkView.backgroundColor = R.Colors.deepGrayBackgroundColor
                checkmark.isHidden = true
            }
        }
    }
    
    private var isEditing: Bool = false {
        didSet {
            if isEditing {
                layer.borderColor = R.Colors.specialLimeColor.cgColor
                makeBorder(of: 4, color: R.Colors.specialLimeColor)
                
                deleteMarkView.isHidden = false
                editMarkView.isHidden = false
            } else {
                layer.borderColor = R.Colors.specialWhiteColor.cgColor
                makeBorder(of: 2)
                
                deleteMarkView.isHidden = true
                editMarkView.isHidden = true
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        setupLayout()
        setupEditLongGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureCell(with text: String, isDone: Bool) {
        self.textLabel.text = text
        self.isDone = isDone
    }
    
    private func setupEditLongGesture() {
        editLongGesture = UILongPressGestureRecognizer(target: self,
                                                   action: #selector(editLongGestureHandler))
        editLongGesture.minimumPressDuration = 0.7
        editLongGesture.delegate = self
        addGestureRecognizer(editLongGesture)
    }

    @objc private func editLongGestureHandler() {
        isEditing.toggle()
    }
}


//MARK: - TDCell Extension

private extension TDCell {
    
    func setupCell() {
        backgroundColor = R.Colors.deepGrayBackgroundColor
        layer.cornerRadius = 18
        makeBorder(of: 2)
        
        [
            textLabel, checkmarkView,
         deleteMarkView, editMarkView].forEach { addNewSubbview($0) }
        
        checkmarkView.addNewSubbview(checkmark)
        deleteMarkView.addNewSubbview(deleteMark)
        editMarkView.addNewSubbview(editMark)
    }
    
    func setupLayout() {
        
        let sideOffset = frame.width / 10
        
        checkmarkView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(sideOffset * 0.5)
            $0.width.height.equalTo(50)
        }
        
        checkmark.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(5)
        }
        
        deleteMarkView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(sideOffset * 0.5)
            $0.width.height.equalTo(50)
        }

        deleteMark.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(5)
        }

        editMarkView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(deleteMarkView.snp.leading).inset(-sideOffset * 0.5)
            $0.width.height.equalTo(50)
        }

        editMark.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(5)
        }
        
        textLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(sideOffset)
            $0.trailing.equalTo(checkmarkView.snp.leading).offset(sideOffset)
        }
    }
}
