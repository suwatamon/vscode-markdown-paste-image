param($imagePath)
# The first argument is set to $imagePath, and argmuments are shifted
# i.e. $args[0] represent the second argument of script
$exts = $args;
# The rest argumets are set to $exts

add-type -an system.windows.forms
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$source_files = @();
foreach ($filename in [System.Windows.Forms.Clipboard]::GetFileDropList()) {
    foreach ($ext in $exts){
        if ($filename.EndsWith($ext)){
            $source_files += $filename;
        }
    }
}

New-Item -ItemType Directory -Force -Path $imagePath | Out-Null
$destination_files = @();
foreach ($fullname in $source_files) {
    $filename = [System.IO.Path]::GetFileName($fullname);
    $dst = Join-Path $imagePath $filename;
    Copy-Item -Path $fullname -Destination $dst;

    if ($?){
        # $? contains TRUE if the last operation succeeded
        $destination_files += $dst;
    }
}

foreach ($filename in $destination_files) {
    [Console]::WriteLine($filename);
}
