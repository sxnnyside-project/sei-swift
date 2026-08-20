// Created by Sxnnyside Project on 30/01/26.

/// Sxnnyside Eloquent Icons catalog.
///
/// Every case corresponds to an outline icon asset bundled with this
/// package. Use a case with ``SEIIcon`` to render it:
///
/// ```swift
/// SEIIcon(.home)
/// ```
public enum SEIIcons: String, CaseIterable, Sendable {
    // MARK: - Common Actions
    case add
    case back
    case check
    case close
    case download
    case edit
    case filter
    case menu
    case more
    case refresh
    case remove
    case search
    case share
    case sort
    case upload

    // MARK: - Navigation & Layout
    case home
    case apps
    case dashboard
    case layoutGrid = "layout-grid"
    case layoutList = "layout-list"
    case tab
    case window

    // MARK: - User & Account
    case account
    case profile
    case user
    case users
    case team
    case login
    case logout
    case register

    // MARK: - Communication
    case message
    case notification
    case invite

    // MARK: - Security & Privacy
    case lock
    case lockOpen = "lock-open"
    case unlock
    case shield
    case key
    case fingerprint
    case firewall
    case verified

    // MARK: - Files & Storage
    case file
    case folder
    case cloud
    case database
    case backup
    case restore

    // MARK: - Development
    case code
    case terminal
    case bug
    case debug
    case api
    case function
    case variable
    case brackets
    case plugin
    case package

    // MARK: - System & Settings
    case settings
    case power
    case cpu
    case server
    case router
    case connection
    case sync
    case update
    case version
    case install
    case uninstall

    // MARK: - Status & Alerts
    case success
    case error
    case warning
    case info
    case help
    case alert

    // MARK: - Media & Content
    case music
    case sound
    case mute
    case gamepad
    case joystick

    // MARK: - Analytics & Charts
    case analytics
    case chartBar = "chart-bar"
    case chartLine = "chart-line"
    case chartPie = "chart-pie"
    case progress

    // MARK: - Commerce & Finance
    case money
    case wallet
    case creditCard = "credit-card"
    case pricing
    case discount
    case invoice
    case receipt
    case subscription

    // MARK: - Productivity
    case calendar
    case clock
    case timer
    case task
    case checklist
    case focus

    // MARK: - Network & Connectivity
    case wifi
    case offline
    case globe
    case browser
    case link
    case linkExternal = "link-external"

    // MARK: - Utility
    case qr
    case scan
    case visibilityOn = "visibility"
    case visibilityOff = "visibility-off"
    case star
    case heart
    case flame
    case spark
    case crown
    case badge

    // MARK: - Build & Deploy
    case build
    case deploy
    case log

    // MARK: - Special
    case app
    case exploit
    case skull

    /// The name of the asset in the package's resource bundle.
    public var assetName: String {
        rawValue
    }
}
