add-type -an system.windows.forms
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$dataObj = [System.Windows.Forms.Clipboard]::GetDataObject();

if ($dataObj) {
    foreach ($fmt in $dataObj.GetFormats()) {
        if ($fmt -eq "FileNameW"){
            foreach ($filename in $dataObj.GetData($fmt)) {
                [Console]::WriteLine($filename)
            }
        }
    }
}
