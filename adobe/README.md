## Adobe

- [Migrating Lightroom 5 to a new computer](#migrating-lightroom-5-to-a-new-computer)

## Migrating Lightroom 5 to a new computer

There doesn't appear to be an installer available on the Internet for
Lightroom 5, which I still use. I was interested in migrating to a new
computer and figured out how to make it work.

1. Copy `/Applications/Adobe Photoshop Lightroom 5.app` to the new computer.
2. Copy `~/Library/Application\ Support/Adobe/Lightroom` to the new computer.
3. Copy `~/Library/Preferences/com.adobe.Lightroom5.plist` to the new computer.
4. Once everything is copied and moved into place, disable the quarantine:
    1. `xattr -d com.apple.quarantine /Applications/Adobe Photoshop Lightroom 5.app`
    1. `xattr -d com.apple.quarantine /Applications/Adobe Photoshop Lightroom 5.app/Contents/dynamiclinkmanager.app`
5. Launch Lightroom.
