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
            .switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
                
                print("Нажата ячейка: Авиарежим")
            }, isOn: false)),
            .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemBlue) {
                
                print("Нажата ячейка: Wi-Fi")
            }),
            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(named: "icons8-bluetooth-30"), iconBackgroundColor: .systemBlue) {
                
                print("Нажата ячейка: Bluetooth")
            }),
            .staticCell(model: SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen) {
                
                print("Нажата ячейка: Сотовая связь")
            }),
            .staticCell(model: SettingsOption(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen) {
                
                print("Нажата ячейка: Режим модема")
            }),
            .switchCell(model: SettingsSwitchOption(title: "VPN", icon: UIImage(named: "icons8-vpn-status-bar-icon-50"), iconBackgroundColor: .systemBlue, handler: {
                
                print("Нажата ячейка: VPN")
            }, isOn: false))
        ]))
        
        models.append(Section(title: "Information", options: [
            .staticCell(model: SettingsOption(title: "Уведомления", icon: UIImage(named: "icons8-notification-50"), iconBackgroundColor: .systemRed) {
                
                print("Нажата ячейка: Уведомления")
            }),
            .staticCell(model: SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "speaker.wave.3"), iconBackgroundColor: .systemPink) {
                
                print("Нажата ячейка: Звуки, тактильные сигналы")
            }),
            .staticCell(model: SettingsOption(title: "Не беспокоить", icon: UIImage(systemName: "moon.fill"), iconBackgroundColor: .systemPurple) {
                
                print("Нажата ячейка: Не беспокоить")
            }),
            .staticCell(model: SettingsOption(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemPurple) {
                
                print("Нажата ячейка: Экранное время")
            })
        ]))
        
        models.append(Section(title: "General", options: [
            .staticCell(model: SettingsOption(title: "Основные", icon: UIImage(named: "icons8-settings-100"), iconBackgroundColor: .lightGray) {
                
                print("Нажата ячейка: Основные")
            }),
            .staticCell(model: SettingsOption(title: "Пункт управления", icon: UIImage(systemName: "switch.2"), iconBackgroundColor: .lightGray) {
                
                print("Нажата ячейка: Пункт управления")
            }),
            .staticCell(model: SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "textformat.size"), iconBackgroundColor: .systemBlue) {
                
                print("Нажата ячейка: Экран и яркость")
            }),
            .staticCell(model: SettingsOption(title: "Экран «Домой»", icon: UIImage(named: "icons8-desktop-mac-40"), iconBackgroundColor: .systemBlue) {
                
                print("Нажата ячейка: Экран «Домой»")
            }),
            .staticCell(model: SettingsOption(title: "Универсальный доступ", icon: UIImage(systemName: "figure.wave.circle"), iconBackgroundColor: .systemBlue) {
                
                print("Нажата ячейка: Универсальный доступ")
            }),
            .staticCell(model: SettingsOption(title: "Обои", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemMint) {
                
                print("Нажата ячейка: Обои")
            }),
            .staticCell(model: SettingsOption(title: "Siri и Поиск", icon: UIImage(named: "icons8-siri-64"), iconBackgroundColor: .black) {
                
                print("Нажата ячейка: Siri и Поиск")
            }),
            .staticCell(model: SettingsOption(title: "Face ID и код-пароль", icon: UIImage(named: "icons8-face-id-30"), iconBackgroundColor: .systemGreen) {
                
                print("Нажата ячейка: Face ID и код-пароль")
            }),
            .staticCell(model: SettingsOption(title: "Экстренный вызов - SOS", icon: UIImage(named: "icons8-sos-button-48"), iconBackgroundColor: .systemRed) {
                
                print("Нажата ячейка: Экстренный вызов - SOS")
            }),
            .staticCell(model: SettingsOption(title: "Уведомление о контакте", icon: UIImage(named: "icons8-inactive-state-80"), iconBackgroundColor: .white) {
                
                print("Нажата ячейка: Уведомление о контакте")
            }),
            .staticCell(model: SettingsOption(title: "Аккумулятор", icon: UIImage(systemName: "battery.100"), iconBackgroundColor: .systemGreen) {
                
                print("Нажата ячейка: Аккумулятор")
            }),
            .staticCell(model: SettingsOption(title: "Конфидециальность", icon: UIImage(named: "icons8-stop-64"), iconBackgroundColor: .systemBlue) {
                
                print("Нажата ячейка: Конфидециальность")
            })
        ]))
        
        models.append(Section(title: "Information", options: [
            .staticCell(model: SettingsOption(title: "App Store", icon: UIImage(named: "icons8-app-store-48"), iconBackgroundColor: .white) {
                
                print("Нажата ячейка: App Store")
            }),
            .staticCell(model: SettingsOption(title: "Wallet и Apple Pay", icon: UIImage(named: "icons8-wallet-48"), iconBackgroundColor: .white) {
                
                print("Нажата ячейка: Wallet и Apple Pay")
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
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
}

