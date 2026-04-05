on open theItems
    set scriptPath to (POSIX path of (path to me)) & "Contents/Resources/opentty"
    repeat with anItem in theItems
        set itemPath to POSIX path of anItem
        do shell script quoted form of scriptPath & " " & quoted form of itemPath & " >> /tmp/opentty.log 2>&1"
    end repeat
end open

on run
    set scriptPath to (POSIX path of (path to me)) & "Contents/Resources/opentty"
    do shell script quoted form of scriptPath & " >> /tmp/opentty.log 2>&1"
end run
