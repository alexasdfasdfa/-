@echo off
cd /d "%~dp0"

echo ============================================
echo  Step 0: extract images (optional)
echo ============================================
if exist "*.docx" python extract_images.py

echo.
echo ============================================
echo  Step 1-2: xelatex (run twice, wait patiently)
echo ============================================
del main.aux main.out main.bcf main.run.xml 2>nul

xelatex -interaction=nonstopmode main.tex
xelatex -interaction=nonstopmode main.tex

echo.
if exist main.pdf (
    echo SUCCESS - main.pdf created
    start "" main.pdf
) else (
    echo FAILED - open main.log and search for "!"
)

pause
