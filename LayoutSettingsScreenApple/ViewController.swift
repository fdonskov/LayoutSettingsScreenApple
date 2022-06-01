//
//  ViewController.swift
//  LayoutSettingsScreenApple
//
//  Created by Федор Донсков on 31.05.2022.
//

import UIKit

// MARK: - Section cell

struct Section {
    let title: String
    let options: [SettingsOptionType]
}

// Создание разного типа ячеек
enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

// MARK: - Settings cell

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

// MARK: - ViewController settings

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self,
                       forCellReuseIdentifier: SwitchTableViewCell.identifier)
        
        return table
    }()
    
    var models = [Section]()

    // MARK: - Methods viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
    }
    
    // MARK: - Setup Hieraechy
    
    func setupHierarchy() {
//        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Настройки"
        
        configure()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }

    // MARK: - Configuration cell
    
    func configure() {
        models.append(Section(title: "General", options: [
            .switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(image: .airplane), iconBackgroundColor: .systemOrange, handler: {

            }, isOn: false)),
            .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(image: .wifi), iconBackgroundColor: .systemBlue) {
                
            }),
            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(image: .bluetooth), iconBackgroundColor: .systemBlue) {
                
            }),
            .staticCell(model: SettingsOption(title: "Сотовая связь", icon: UIImage(image: .antenna), iconBackgroundColor: .systemGreen) {
                
            }),
            .staticCell(model: SettingsOption(title: "Режим модема", icon: UIImage(image: .modem), iconBackgroundColor: .systemGreen) {
                
            }),
            .switchCell(model: SettingsSwitchOption(title: "VPN", icon: UIImage(image: .vpn), iconBackgroundColor: .systemBlue, handler: {
                
            }, isOn: false))
        ]))
        
        models.append(Section(title: "Information", options: [
            .staticCell(model: SettingsOption(title: "Уведомления", icon: UIImage(image: .notification), iconBackgroundColor: .systemRed) {
                
            }),
            .staticCell(model: SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(image: .speaker), iconBackgroundColor: .systemPink) {
                
            }),
            .staticCell(model: SettingsOption(title: "Не беспокоить", icon: UIImage(image: .moonFill), iconBackgroundColor: .systemPurple) {
                
            }),
            .staticCell(model: SettingsOption(title: "Экранное время", icon: UIImage(image: .screenTime), iconBackgroundColor: .systemPurple) {
                
            })
        ]))
        
        models.append(Section(title: "General", options: [
            .staticCell(model: SettingsOption(title: "Основные", icon: UIImage(image: .settings), iconBackgroundColor: .lightGray) {
                
            }),
            .staticCell(model: SettingsOption(title: "Пункт управления", icon: UIImage(image: .switchScreen), iconBackgroundColor: .lightGray) {
                
            }),
            .staticCell(model: SettingsOption(title: "Экран и яркость", icon: UIImage(image: .screenFormat), iconBackgroundColor: .systemBlue) {
                
            }),
            .staticCell(model: SettingsOption(title: "Экран «Домой»", icon: UIImage(image: .screenHome), iconBackgroundColor: .systemBlue) {
                
            }),
            .staticCell(model: SettingsOption(title: "Универсальный доступ", icon: UIImage(image: .universalAccess), iconBackgroundColor: .systemBlue) {
                
            }),
            .staticCell(model: SettingsOption(title: "Обои", icon: UIImage(image: .wallpaper), iconBackgroundColor: .systemMint) {
                
            }),
            .staticCell(model: SettingsOption(title: "Siri и Поиск", icon: UIImage(image: .siri), iconBackgroundColor: .black) {
                
            }),
            .staticCell(model: SettingsOption(title: "Face ID и код-пароль", icon: UIImage(image: .faceId), iconBackgroundColor: .systemGreen) {
                
            }),
            .staticCell(model: SettingsOption(title: "Экстренный вызов - SOS", icon: UIImage(image: .sos), iconBackgroundColor: .systemRed) {
                
            }),
            .staticCell(model: SettingsOption(title: "Уведомление о контакте", icon: UIImage(image: .notificationContact), iconBackgroundColor: .white) {
                
            }),
            .staticCell(model: SettingsOption(title: "Аккумулятор", icon: UIImage(image: .battery), iconBackgroundColor: .systemGreen) {
                
            }),
            .staticCell(model: SettingsOption(title: "Конфидециальность", icon: UIImage(image: .privacy), iconBackgroundColor: .systemBlue) {
                
            })
        ]))
        
        models.append(Section(title: "Information", options: [
            .staticCell(model: SettingsOption(title: "App Store", icon: UIImage(image: .appStore), iconBackgroundColor: .white) {
                
            }),
            .staticCell(model: SettingsOption(title: "Wallet и Apple Pay", icon: UIImage(image: .wallet), iconBackgroundColor: .white) {
                
            })
        ]))
    }
    
    // MARK: - Methods configuration
    
//    // Метод - Отображение названия разделов
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let section = models[section]
//        return section.title
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifier,
                for: indexPath
            ) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    // Метод - Убрать выделение строки после нажатия на нее
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        
        switch type.self {
        case .staticCell(let model):
            print("Нажата ячейка \(model.title)")
            model.handler()
        case .switchCell(let model):
            print("Нажата ячейка \(model.title)")
            model.handler()
        }
    }
}

extension UIImage {
    convenience init?(image: Icon) {
        self.init(named: image.rawValue)
    }

    enum Icon: String {
        case airplane = "icons8-airplane-mode-on-50"
        case wifi = "icons8-wi-fi-30"
        case bluetooth = "icons8-bluetooth-30"
        case antenna = "icons8-antenna-65"
        case modem = "icons8-personal-hotspot-50"
        case vpn = "icons8-vpn-status-bar-icon-50"
        case notification = "icons8-notification-50"
        case speaker = "icons8-speaker-60"
        case moonFill = "icons8-moon-symbol-60"
        case screenTime = "icons8-hourglass-48"
        case settings = "icons8-settings-100"
        case switchScreen = "icons8-switches-50"
        case screenFormat = "icons8-font-size-48"
        case screenHome = "icons8-desktop-mac-40"
        case universalAccess = "icons8-web-accessibility-50"
        case wallpaper = "icons8-geometric-flowers-60"
        case siri = "icons8-siri-64"
        case faceId = "icons8-face-id-30"
        case sos = "icons8-sos-button-48"
        case notificationContact = "icons8-inactive-state-80"
        case battery = "icons8-empty-battery-50"
        case privacy = "icons8-stop-64"
        case appStore = "icons8-app-store-48"
        case wallet = "icons8-wallet-48"
    }
}
