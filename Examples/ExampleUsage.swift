// Created by Sxnnyside Project on 30/01/26.
// Example usage of SEISwift in a real application

import SwiftUI
import SEISwift

// MARK: - SwiftUI Examples

/// Complete example app demonstrating SEISwift usage
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ExampleTabView()
        }
    }
}

/// Tab-based navigation showcasing different icon categories
struct ExampleTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

/// Home view with icon grid
struct HomeView: View {
    let columns = [
        GridItem(.adaptive(minimum: 60))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(Array(SEIIcons.allCases.prefix(20)), id: \.self) { icon in
                        IconCard(icon: icon)
                    }
                }
                .padding()
            }
            .navigationTitle("SEI Icons")
        }
    }
}

/// Individual icon card
struct IconCard: View {
    let icon: SEIIcons
    
    var body: some View {
        VStack(spacing: 8) {
            SEIIcon(icon)
                .font(.largeTitle)
                .foregroundStyle(.blue)
            
            Text(icon.rawValue)
                .font(.caption2)
                .lineLimit(1)
        }
        .frame(width: 60, height: 80)
    }
}

/// Settings view with list of options
struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Account") {
                    SettingsRow(icon: .profile, title: "Profile", color: .blue)
                    SettingsRow(icon: .user, title: "Personal Info", color: .green)
                    SettingsRow(icon: .lock, title: "Security", color: .red)
                }
                
                Section("App") {
                    SettingsRow(icon: .notification, title: "Notifications", color: .purple)
                    SettingsRow(icon: .settings, title: "Preferences", color: .gray)
                    SettingsRow(icon: .help, title: "Help & Support", color: .orange)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

/// Settings row with icon
struct SettingsRow: View {
    let icon: SEIIcons
    let title: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            SEIIcon(icon)
                .font(.title2)
                .foregroundStyle(color)
                .frame(width: 32)
            
            Text(title)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - UIKit Examples

#if canImport(UIKit)
import UIKit

/// Example UIKit view controller
class ExampleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Navigation bar
        title = "SEI Icons"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: .sei(.settings),
            style: .plain,
            target: self,
            action: #selector(settingsTapped)
        )
        
        // Stack view with icons
        let stackView = createIconStackView()
        view.addSubview(stackView)
        
        // Layout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func createIconStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        // Create icon views
        let icons: [SEIIcons] = [.home, .user, .heart, .star, .settings]
        
        for icon in icons {
            let imageView = UIImageView(image: .sei(icon))
            imageView.tintColor = .systemBlue
            imageView.contentMode = .scaleAspectFit
            imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            stackView.addArrangedSubview(imageView)
        }
        
        return stackView
    }
    
    @objc private func settingsTapped() {
        let alert = UIAlertController(
            title: "Settings",
            message: "Settings tapped",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

/// Example table view controller
class IconTableViewController: UITableViewController {
    
    private let icons = Array(SEIIcons.allCases.prefix(20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Icon Gallery"
        tableView.register(IconTableViewCell.self, forCellReuseIdentifier: "IconCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        icons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath) as! IconTableViewCell
        cell.configure(with: icons[indexPath.row])
        return cell
    }
}

/// Custom table view cell with icon
class IconTableViewCell: UITableViewCell {
    
    private let iconView = UIImageView()
    private let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // Icon view
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .systemBlue
        contentView.addSubview(iconView)
        
        // Name label
        nameLabel.font = .systemFont(ofSize: 17)
        contentView.addSubview(nameLabel)
        
        // Layout
        iconView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 32),
            iconView.heightAnchor.constraint(equalToConstant: 32),
            
            nameLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func configure(with icon: SEIIcons) {
        iconView.image = .sei(icon)
        nameLabel.text = icon.rawValue.capitalized
    }
}
#endif

// MARK: - Utility Extensions

extension SEIIcons {
    /// Example: Get icon color based on category
    var suggestedColor: Color {
        switch self {
        case .home, .apps, .dashboard: return .blue
        case .user, .profile, .account: return .green
        case .lock, .shield, .key: return .red
        case .heart, .star, .crown: return .yellow
        case .success: return .green
        case .error: return .red
        case .warning: return .orange
        default: return .primary
        }
    }
}
