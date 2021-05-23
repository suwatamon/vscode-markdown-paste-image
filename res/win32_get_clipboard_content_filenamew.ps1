add-type -an system.windows.forms
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

foreach ($filename in [System.Windows.Forms.Clipboard]::GetFileDropList()) {
    [Console]::WriteLine($filename)
}

