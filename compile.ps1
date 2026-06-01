Set-Location $PSScriptRoot
Write-Host "Building main.tex (IEEE refs)..."
Remove-Item main.aux, main.bbl, main.blg, main.bcf, main.run.xml, main.out -ErrorAction SilentlyContinue
xelatex -interaction=nonstopmode main.tex
if ($LASTEXITCODE -ne 0) { Read-Host "xelatex failed. Press Enter"; exit 1 }
xelatex -interaction=nonstopmode main.tex
if ($LASTEXITCODE -ne 0) { Read-Host "xelatex failed. Press Enter"; exit 1 }
if (Test-Path main.pdf) {
    Write-Host "OK: main.pdf"
    Invoke-Item main.pdf
} else {
    Write-Host "ERROR: no main.pdf"
}
Read-Host "Press Enter"
