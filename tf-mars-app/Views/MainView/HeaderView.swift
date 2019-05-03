import UIKit

class HeaderView: UIView {

  // MARK: - Properties
  
  private let tfmBoard: TFMBoard
  private let viewModel = MainViewModel()
  var resetValuesAction: (() -> Void)?
  
  override var intrinsicContentSize: CGSize {
    let titleLabelHeight = titleLabel.intrinsicContentSize.height
    let stackViewHeight = stackView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
    let height = titleLabelHeight + stackViewHeight
    return CGSize(width: UIView.noIntrinsicMetric, height: height)
  }
  
  var toggleGenerationPicker: (() -> Void)?
  
  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Terra Forming Board"
    label.font = UIFont.systemFont(ofSize: 24)
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    return stackView
  }()
  
  lazy var generationLabel: UILabel = {
    let label = UILabel()
    label.text = viewModel.displayGeneration(with: $0)
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = .white
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }(tfmBoard.generation)
  
  lazy var terraFormButton: UIButton = {
    let button = UIButton()
    button.setTitle($0, for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(toggleGenerationPickerView), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }(viewModel.displayTerraForm(with: tfmBoard.terraForm))
  
  lazy var resetButton: UIButton = {
    let button = UIButton()
    button.setTitle("Reset", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(resetValues), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  // MARK: - Initializer

  init(with tfmBoard: TFMBoard) {
    self.tfmBoard = tfmBoard
    super.init(frame: .zero)
    
    // Clojures
    tfmBoard.didChangeGeneration = didChangeGeneration
    tfmBoard.didChangeTerraForm = didChangeTerraForm

    translatesAutoresizingMaskIntoConstraints = false

    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Methods
  
  private func setupViews() {
    addSubViews()
    setupConstraints()
  }
  
  private func addSubViews() {
    addSubviews(titleLabel, stackView)

    stackView.addArrangedSubviews(generationLabel,
                                  terraFormButton,
                                  resetButton)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.topAnchor.constraint(equalTo: topAnchor),
      
      // Stackview
      stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }
  
  @objc private func toggleGenerationPickerView() {
    toggleGenerationPicker?()
  }
  
  @objc private func resetValues() {
    resetValuesAction?()
  }
  
  private func didChangeGeneration() {
    generationLabel.text = viewModel.displayGeneration(with: tfmBoard.generation)
  }
  
  private func didChangeTerraForm() {
    let terraForm = viewModel.displayTerraForm(with: tfmBoard.terraForm)
    terraFormButton.setTitle(terraForm, for: .normal)
  }
}
