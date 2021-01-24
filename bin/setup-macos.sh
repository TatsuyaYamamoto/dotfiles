#!/bin/zsh -x

# https://zenn.dev/ulwlu/articles/1c3a1da12887ed
# https://do-zan.com/mac-dock-terminalcommand-settings/


Dock() {
  # ========== Size ==========
  # Dockのアイコンのサイズ
  # @int: size 16-128
  defaults write com.apple.dock tilesize -int 50

  # ========== Magnification ==========
  # Dockのアイコンを拡大するか
  defaults write com.apple.dock magnification -bool false

  # ========== Position on screen ==========
  # Dock の位置 デフォルトの設定（下）
  defaults write com.apple.dock orientation

  # ========== Minimize windows using ==========
  # ウインドウを Dock にしまうときのエフェクト
  defaults write com.apple.dock mineffect -string "scale"

  # ========== Prefer tabs when opening documents ==========
  # defaults write .GlobalPreferences AppleWindowTabbingMode

  # ========== Double-click a window's title bar to ==========
  # defaults write .GlobalPreferences AppleActionOnDoubleClick -string "Minimize"

  # ========== Minimize windows into application icon ==========
  # ウィンドウを開いているアプリアイコンにまとめてしまうか、Dockの別のアイコンとしてしまう(off)か
  defaults write com.apple.dock minimize-to-application -bool false

  # ========== Animate opening applications ==========
  # 起動中のアプリアイコンをDockでバウンドするような動きをするか
  defaults write com.apple.dock launchanim

  # ========== Automatically hide and show the Dock ==========
  # Dockを常に表示させるか、非表示にさせマウスポインタを近づけたときだけ表示させるか
  defaults write com.apple.dock autohide -bool true #自動表示/非表示オン

  # ========== Show indicators for open applications ==========
  # 起動中のアプリアイコンの下に点を表示させるか
  defaults write com.apple.dock show-process-indicators -bool true

  # ========== Show recent applications in Dock ==========
  # Dock上に最近使ったアプリアイコンを表示させるか
  defaults write com.apple.dock show-recents -bool false

  # ========== Dock Applications ==========
  # Dock に標準で入っている全てのアプリを消す、Finder とごみ箱は消えない
  defaults write com.apple.dock persistent-apps -array
}

Finder() {
  # ========== Show these items on the desktop ==========
  # hide Hard disks on desktop
  defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

  # hide external disks on desktop
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false

  # hide RemovableMedia on desktop
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

  # hide Connected servers on desktop
  defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

  # ========== New Finder windows show ==========
  defaults write com.apple.finder NewWindowTarget -string "${HOME}"

  # ========== Open folders in tabs instead of new windows ==========
  # defaults write com.apple.finder FinderSpawnTab

  # ========== Recent Tags ==========
  defaults write com.apple.finder ShowRecentTags -bool false

  # ========== Show all filename extensions ==========
  defaults write -g AppleShowAllExtensions -bool true

  # ========== Show warning before changing an extension ==========
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool true

  # ========== Show warning before removing from iCloud Drive ==========
  # defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning

  # ========== Show warning before emptying the Trash ==========
  # defaults write com.apple.finder WarnOnEmptyTrash

  # ========== Remove items from the Trash after 30 days ==========
  defaults write com.apple.finder FXRemoveOldTrashItems -bool true

  # ========== View ==========
  # icnv, Nlsv, clmv, Flwv
  # defaults write com.apple.Finder FXPreferredViewStyle

  # ========== Icon Size ==========

  # ========== Text Size ==========

  # ========== Show Toolbar ==========
  defaults write com.apple.finder ShowSidebar -bool true
  defaults write com.apple.finder ShowPreviewPane -bool true

  # ========== Show Path Bar ==========
  defaults write com.apple.finder ShowPathbar -bool true

  # ========== Show Tab Bar ==========
  defaults write com.apple.finder ShowTabView -bool true

  # ========== Show Status Bar ==========
  defaults write com.apple.finder ShowStatusBar -bool true
}

AppStore() {
  # ========== Auto Update Check ==========
  # Mac でアップデートがバックグラウンドでダウンロードされないようにする方法 
  # https://support.apple.com/ja-jp/HT207251
  # - Disable
  defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool false

  # ========== Auto Update ==========
  # App をアップデートする／自動ダウンロードを使う
  # https://support.apple.com/ja-jp/HT202180
  # - Enable
  defaults write com.apple.commerce AutoUpdate -bool true
}

ScreenShot() {
  # ========== Set Screenshot saved directory ==========
  defaults write com.apple.screencapture location -string "$HOME/Pictures/screenshot"

  # ========== Set Screenshots format ==========
  defaults write com.apple.screencapture type -string "jpg"

  # ========== Disable shadow of screenshot ==========
  # スクリーンショットの画像を影なしにする
  defaults write com.apple.screencapture disable-shadow -bool true

  # ========== Rename screenshot default name ==========
  defaults write com.apple.screencapture name -string "screenshot"

  # ========== Show timestamp ==========
  defaults write com.apple.screencapture include-date -bool true
}

EnergySaver() {
  # ========== Show Battery percentage in menu bar ==========
  defaults write com.apple.menuextra.battery ShowPercent -string "Yes"
}

DateTime() {
  # ========== Set date and time automatically ==========
  sudo systemsetup -setusingnetworktime on > /dev/null

  # ========== Time options ==========
  # - Digital
  defaults write com.apple.menuextra.clock IsAnalog -bool false

  # ========== Flash the time separators ==========
  # https://macos-defaults.com/menubar/flashdateseparators.html#set-to-false-default-value
  defaults write com.apple.menuextra.clock FlashDateSeparators -bool true

  # ========== DateFormat ==========
  # 日付と時刻
  # メニューバーに日付、曜日、24時間、秒数を表示）
  # https://oki2a24.com/2019/01/21/nitial-setting-done-manually-and-setting-with-defaults-command-on-macbook-pro-2018/
  defaults write com.apple.menuextra.clock DateFormat -string 'EEE d MMM HH:mm:ss'
}

iCloud() {
  # Disable All settings
  # ((icloud 対応アプリでのファイル保存時のデフォルト = icloud をデフォルト保存先としない))
  # https://gist.github.com/woowee/6414643#file-osx-sh-L63-L64
  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
}

Trackpad() {
  # ========== Look up & data detectors ==========
  # 対象の設定項目が見つからん...

  # ========== Secondary click ==========
  # - Checked
  #  - Click or tap with two fingers
  # https://baqamore.hatenablog.com/entry/2015/02/09/221934
  defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
  defaults write com.apple.AppleMultitouchTrackpad                  TrackpadRightClick -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

  # ========== Tap to click ==========
  # - Checked
  defaults write com.apple.AppleMultitouchTrackpad                  Clicking -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

  # ========== Click ==========
  # @int:Light.0 Medium.1 Firm.2
  defaults write -g com.apple.trackpad.forceClick 1

  # ========== Tracking speed ==========
  # @int:Slow.0 Fast.3
  defaults write -g com.apple.trackpad.scaling 1.5

  # ========== Force Click and haptic feedback ==========
  # - Checked
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad ActuateDetents -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad ForceSuppressed -bool false

  # ========== Scroll direction: Natural ==========
  defaults write .GlobalPreferences com.apple.swipescrolldirection -bool true

  # ========== Zoom in or out ==========
  defaults write com.apple.AppleMultitouchTrackpad                  TrackpadPinch -boolean true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -boolean true

  # ========== Smart zoom ==========
  defaults write com.apple.AppleMultitouchTrackpad                  TrackpadTwoFingerDoubleTapGesture -boolean true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -boolean true

  # ========== Rotate ==========
  defaults write com.apple.AppleMultitouchTrackpad                  TrackpadRotate -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool true

  # ========== Swipe between pages ==========
  # - Checked
  # - Scroll left or right with two fingers
  # https://baqamore.hatenablog.com/entry/2015/02/09/221934
  defaults write -g AppleEnableSwipeNavigateWithScrolls -bool true
  defaults write com.apple.AppleMultitouchTrackpad                  TrackpadThreeFingerHorizSwipeGesture -int 0
  defaults write com.apple.AppleMultitouchTrackpad                  TrackpadThreeFingerVertSwipeGesture  -int 0
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture  -int 0


  # ========== Swipe between full-screen apps ==========
  # - Checked
  #  - Scroll left or right with three fingers
  defaults write com.apple.AppleMultitouchTrackpad                  TrackpadThreeFingerHorizSwipeGesture -int 2
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 2

  # ========== Notification Center ==========
  defaults write com.apple.AppleMultitouchTrackpad                  TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3

  # ========== Mission Control ==========
  # - Checked
  # - Swipe up with three fingers
  defaults write com.apple.AppleMultitouchTrackpad                  TrackpadThreeFingerVertSwipeGesture -int 2
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 2

  # ========== App Expose ==========
  # - Checked
  # - Swipe down with three fingers
  defaults write com.apple.dock showAppExposeGestureEnabled -bool true
  defaults write com.apple.AppleMultitouchTrackpad                  TrackpadThreeFingerVertSwipeGesture -int 2
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 2

  # ========== Launchpad ==========
  defaults write com.apple.dock showLaunchpadGestureEnabled -bool true

  # ========== Show Desktop ==========
  defaults write com.apple.dock showDesktopGestureEnabled -bool true
}

ExtraSettings() {
  # ========== Disable DS_STORE in Network and USB ==========
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
}

Dock
Finder
AppStore
ScreenShot
EnergySaver
DateTime
iCloud
Trackpad
ExtraSettings

# cache clean and restart services
killall cfprefsd
killall Dock
killall Finder
killall SystemUIServer
